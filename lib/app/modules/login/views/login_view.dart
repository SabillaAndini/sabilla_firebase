import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final authC = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/loginimage.png',
                  width: 200, height: 200), // Ganti dengan path gambar Anda
              Obx(
                () => Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (controller.isRegister)
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Color(0xFF8332A6),
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.nameC,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'This field is required'
                                            : null,
                                    decoration:
                                        InputDecoration(labelText: "Name"),
                                  ),
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: Color(0xFF8332A6),
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.emailC,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'This field is required'
                                          : null,
                                  decoration:
                                      InputDecoration(labelText: "Email"),
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
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.passC,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'This field is required'
                                          : null,
                                  decoration:
                                      InputDecoration(labelText: "Password"),
                                ),
                              ),
                            ],
                          ),
                          if (controller.isRegister)
                            Row(
                              children: [
                                const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF8332A6),
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.confirmC,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'This field is required'
                                            : null,
                                    decoration: const InputDecoration(
                                        labelText: "Confirm Password"),
                                  ),
                                ),
                              ],
                            ),
                          if (controller.isRegister)
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xFF8332A6),
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat("EEE, dd MMM y")
                                              .format(pickedDate);
                                      print(formattedDate);
                                      controller.dateC.text = formattedDate;
                                    } else {
                                      print("Tanggal tidak dipilih");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.dateC,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'This field is required'
                                            : null,
                                    decoration: InputDecoration(
                                      labelText: "Datetime",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 10),
                          if (controller.isRegister)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 7),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff8332A6),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Radio<String>(
                                            value: 'male',
                                            groupValue:
                                                controller.selectedGender.value,
                                            onChanged: (value) {
                                              controller.selectedGender.value =
                                                  value ?? '';
                                            },
                                            activeColor: Color(0xff8332A6),
                                          ),
                                          Text('male'),
                                          Radio<String>(
                                            value: 'female',
                                            groupValue:
                                                controller.selectedGender.value,
                                            onChanged: (value) {
                                              controller.selectedGender.value =
                                                  value ?? '';
                                            },
                                            activeColor: Color(0xff8332A6),
                                          ),
                                          Text('female'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 330,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF8332A6)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text("Sign in"),
                ),
              ),

              const SizedBox(height: 10),
              GestureDetector(
                child: Text(
                  controller.isRegister
                      ? 'Already Have Account? Login Here'
                      : 'Doesn\'t Have Account? Register Here',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8332A6),
                      fontStyle: FontStyle.italic),
                ),
                onTap: () {
                  controller.isRegister = !controller.isRegister;
                  controller.nameC.clear();
                  controller.passC.clear();
                  controller.confirmC.clear();
                  controller.emailC.clear();
                },
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
      ),
    );
  }
}
