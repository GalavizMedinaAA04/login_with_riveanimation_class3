# 🐻 Interactive Login with Rive Animation

An interactive and modern Login Screen developed in **Flutter** that utilizes **Rive** animations to create an engaging user experience. The animation reacts in real-time as the user interacts with the input fields.

---

## 🚀 Features
* **Dynamic Interaction:** The character follows the cursor while the user types in the Email field (`isChecking`).
* **Reactive Feedback:** The character covers its eyes when the user selects or types in the Password field (`isHandsUp`).
* **State Machine Integration:** Full control of animation states via `StateMachineController`.
* **Modern UI:** Clean design using Flutter Material 3.

---

## 🎨 What is Rive & State Machine?

### **What is Rive?**
It's a vector-based design and animation tool (based on coordinates, not pixels) created specifically for interactive interfaces. Unlike a video or a GIF, Rive files (`.riv`) are extremely small and render in real-time.

### **What is the State Machine?**
It's the **brain** of the animation. It's a visual system within Rive that allows you to define the rules for how and when an animation should change based on inputs (like booleans or triggers).

---

## 🛠️ Technologies Used
* **Framework:** [Flutter](https://flutter.dev/) 🐦
* **Animation Tool:** [Rive](https://rive.app/) 🎨
* **Language:** Dart 🎯

---

## 📂 Project Structure
The main logic is located in the `lib` folder:
* `main.dart`: Entry point of the application and theme configuration.
* `screens/login_screen.dart`: Contains the `LoginScreen` widget, `FocusNode` listeners, and Rive `onInit` controller logic.
* `assets/`: Contains the `animated_login_bear.riv` file.

---

## 📺 Demo
![Login Animation Demo](https://github.com/user-attachments/assets/e68d9c60-e497-437e-8846-9435c665974b)

---

## 🏫 Academic Information
* **Subject:** Graficación 🖥️
* **Professor:** Rodrigo Fidel Gaxiola Sosa 👨‍🏫
* **Student:** Aldebarán Antonino Galaviz Medina 🎓

---

## 📜 Credits
This project uses the following Rive animation:
* **Animation:** [Remix of Login Machine REMIX](https://rive.app/marketplace/3645-7621-remix-of-login-machine/)
* **Author:** [dexterc](https://rive.app/@dexterc/)
