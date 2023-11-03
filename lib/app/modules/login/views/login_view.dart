import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final nameC = TextEditingController();
  final confirmC = TextEditingController();
  final dateC = TextEditingController();
  final authC = Get.find<AuthController>();
  RxBool isRegister = false.obs;
  RxString _selectedGender = ''.obs;
  RxString get selectedGender => _selectedGender;

  void setSelectedGender(String value) {
    _selectedGender = value.obs;
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      print(pickedDate); // Format pickedDate => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); // Format tanggal terformat menggunakan paket intl => 2021-03-16
      dateC.text = formattedDate; // Setel nilai dateC dengan tanggal terformat
    } else {
      print("Tanggal tidak dipilih");
    }
  }

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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isRegister.value == true)
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
                                  controller: nameC,
                                  validator: (value) =>
                                      value == null || value == ''
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
                                controller: emailC,
                                validator: (value) =>
                                    value == null || value == ''
                                        ? 'This field is required'
                                        : null,
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
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: passC,
                                validator: (value) =>
                                    value == null || value == ''
                                        ? 'This field is required'
                                        : null,
                                decoration:
                                    InputDecoration(labelText: "Password"),
                              ),
                            ),
                          ],
                        ),
                        if (isRegister.value == true)
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
                                  controller: confirmC,
                                  validator: (value) =>
                                      value == null || value == ''
                                          ? 'This field is required'
                                          : null,
                                  decoration: const InputDecoration(
                                      labelText: "Confirm Password"),
                                ),
                              ),
                            ],
                          ),
                        if (isRegister.value == true)
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFF8332A6),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  _selectDate(
                                      context); // Panggil fungsi _selectDate saat ikon kalender diklik
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: dateC,
                                  validator: (value) =>
                                      value == null || value == ''
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
                        if (isRegister.value == true)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 7),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          groupValue: selectedGender.value,
                                          onChanged: (value) {
                                            selectedGender.value = value ?? '';
                                          },
                                          activeColor: Color(0xff8332A6),
                                        ),
                                        Text('male'),
                                        Radio<String>(
                                          value: 'female',
                                          groupValue: selectedGender.value,
                                          onChanged: (value) {
                                            selectedGender.value = value ?? '';
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
              SizedBox(
                width: 330,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    //if
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
                onPressed: () {
                  isRegister.value = !isRegister.value;
                },
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
      ),
    );
  }
}
