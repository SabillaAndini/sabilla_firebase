import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBF2FF),
        title: Text(
          'Books Form',
          style: TextStyle(
            color:
                Color(0xFFBF2C98), // Ganti dengan warna teks yang Anda inginkan
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
