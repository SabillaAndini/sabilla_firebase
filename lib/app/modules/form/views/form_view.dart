import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/book_model.dart';
import '../../home/views/home_view.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  GlobalKey<FormState> formKey = GlobalKey();
  BookModel book = Get.arguments ?? BookModel();
  FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBF2FF),
        leading: IconButton(
          onPressed: () {
            Get.offAll(HomeView());
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF8332A6),
        ),
        title: const Text(
          'Book\'s Form',
          style: TextStyle(
            color: Color(0xFF8332A6),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Container(
                child: Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.book,
                                color: Color(0xFF8332A6),
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.titleC,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'This field is required'
                                          : null,
                                  decoration: const InputDecoration(
                                    labelText: 'Title',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF8332A6)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF8332A6))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Icon(
                                Icons.category,
                                color: Color(0xFF8332A6),
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.categoryC,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'This field is required'
                                          : null,
                                  decoration: const InputDecoration(
                                    labelText: 'Category',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF8332A6)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF8332A6))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Icon(
                                Icons.label_important,
                                color: Color(0xFF8332A6),
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.pageC,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'This field is required'
                                          : null,
                                  decoration: const InputDecoration(
                                    labelText: 'Page Count',
                                    labelStyle:
                                        TextStyle(color: Color(0xFF8332A6)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF8332A6))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              controller.addImage.value.isNotEmpty
                  ? Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Card(
                        elevation: 9,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Center(
                            child: Image.file(File(controller.addImage.value),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Card(
                        elevation: 9,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "Book's Cover",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'assets/formimage1.png',
                                width: 274,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color(0xFF8332A6)),
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(131, 32)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)))),
                                  onPressed: () async {
                                    await controller.getImage();
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Upload',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      controller.store(book, path: controller.addImage.value);
                    } else {
                      Get.defaultDialog(
                        title: 'Gagal!',
                        middleText: 'Data tidak berhasil disimpan',
                        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
                        onConfirm: () {
                          Get.back();
                        },
                        textConfirm: 'Oke',
                        buttonColor: Color(0xff8332A6),
                        confirmTextColor: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    backgroundColor: Color(0xff8332A6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
