// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   FirebaseAuth authC = FirebaseAuth.instance;

//   // Stream<User?> streamAuthStatus() {
//   //   return auth.authStateChanges();
//   // }
//   Stream<User?> get streamAuthStatus => authC.authStateChanges();

//   void logIn(String emailC, String passwordC) async {
//     try {
//       await authC.signInWithEmailAndPassword(
//           email: emailC, password: passwordC);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   void signUp() async {
// //     try {
// //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //     email: emailC, password: passwordC);
// // } on FirebaseAuthException catch (e) {
// //   if (e.code == 'weak-password') {
// //     print('The password provided is too weak.');
// //   } else if (e.code == 'email-already-in-use') {
// //     print('The account already exists for that email.');
// //   }
// // } catch (e) {
// //   print(e);
// // }
//   }
//   void logOut() {}
// }
