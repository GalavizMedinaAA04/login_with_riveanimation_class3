import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  // Control para mostrar/ocultar la contraseña
  bool _obscureText = true;

  // Crear el cerebro de la animación
  StateMachineController? _controller;
  //SMI: State Machine Input
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;

  // 1.1 Crear variables para FocusNode
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // 1.2 Listeners (oyentes) para FocusNode
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener( () {
      if (_emailFocusNode.hasFocus) {
        // Verifica que no sea Nulo
        if (_isHandsUp != null) {
          // Manos abajo en el email
          _isHandsUp?.change(false);
        }
      }
    });
    _passwordFocusNode.addListener(() {
      // Manos arriba en password
      _isHandsUp?.change(_passwordFocusNode.hasFocus);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // Para tener el tamaño de la pantalla del dispositivo
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Evita que se quite espacio del nudge
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset('assets/animated_login_bear.riv',
                stateMachines: ['Login Machine'],
                // Al iniciar la animación
                onInit: (artboard) {
                  _controller = StateMachineController.fromArtboard(
                    artboard, 
                    'Login Machine',
                  );

                  // Verifica que inició bien
                  if (_controller == null) return;

                  // Agregar el controlador al tablero/escenario
                  artboard.addController(_controller!);
                  _isChecking = _controller!.findSMI('isChecking');
                  _isHandsUp = _controller!.findSMI('isHandsUp');
                  _trigSuccess = _controller!.findSMI('trigSuccess');
                  _trigFail = _controller!.findSMI('trigFail');

                },
                ),
              ),
              // widget para separar
              const SizedBox(height: 10),
              // Campo de texto Email
              TextField(
                // 1.3 Asignar FocusNode al TextField
                focusNode: _emailFocusNode,
                onChanged: (value) {
                  if (_isHandsUp != null){
                    // No tapes los ojos al ver el email
                    //_isHandsUp!.change(false);
                  }
                  //Si isChecking es nulo
                  if (_isChecking == null) return;
                  // activar el modo chismoso
                  _isChecking!.change(true);
                },
                // Muestra un tipo de teclado
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
              const SizedBox(height: 10),
              // Campo de texto contraseña
              TextField(
                // 1.3 Asignar FocusNode al TextField
                focusNode: _passwordFocusNode,
                onChanged: (value) {
                  if (_isChecking != null){
                    // No quiero modo chismoso
                    //_isChecking!.change(false);
                  }
                  //Si isHandsUp es nulo
                  if (_isHandsUp == null) return;
                  // activar el modo chismoso
                  _isHandsUp!.change(true);
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // if ternario
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Refresca el Ícono
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10)
            ]
          ),
        )
      )
    );
  }

  // 1.4 Liberar memoria/recurso al salir de la pantalla
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}