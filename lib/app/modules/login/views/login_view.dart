import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/loginimage.png',
                width: 200, height: 200), // Ganti dengan path gambar Anda
            Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Ganti sesuai keinginan
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF8332A6),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ), // Jarak antara ikon dan TextField
                        Expanded(
                          child: TextField(
                            controller: emailC,
                            decoration: InputDecoration(labelText: "Email"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF8332A6),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ), // Jarak antara ikon dan TextField
                        Expanded(
                          child: TextField(
                            controller: passC,
                            decoration: InputDecoration(labelText: "Password"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 330,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  authC.logIn(emailC.text, passC.text);
                  Get.toNamed('/home'); // Mengarahkan ke halaman HomeView
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF8332A6)), // Ganti warna sesuai keinginan
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Ganti sesuai keinginan
                    ),
                  ),
                ),
                child: Text("Sign in"),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Doesn’t Have Account? Register Here',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8332A6),
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8332A6),
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
