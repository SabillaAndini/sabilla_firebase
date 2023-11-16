import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/book_model.dart';
import '../../../data/read_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<BookModel> rxBooks = RxList<BookModel>();
  List<BookModel> get book => rxBooks.value;
  set book(List<BookModel> value) => rxBooks.value = value;

  RxList<ReadModel> rxReads = RxList<ReadModel>();
  List<ReadModel> get listread => rxReads.value;
  set listread(List<ReadModel> value) => rxReads.value = value;

  final RxInt editlist = (-1).obs;

  String? BookID;

  String? bookid;
  BookModel? selectedbook;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  TextEditingController bkTitleC = TextEditingController();
  TextEditingController prevPg = TextEditingController();
  TextEditingController newPg = TextEditingController();

  controllerToModel(ReadModel read) {
    // read.id = bookid;
    read.bookId = bookid;
    read.prePage = int.tryParse(prevPg.text);
    read.newPage = int.tryParse(newPg.text);
    read.time = DateTime.now();
    return read;
  }

  modelToController(ReadModel read) {
    bkTitleC.text = read.bookId ?? '';
    prevPg.text = (read.prePage ?? '').toString();
    newPg.text = (read.newPage ?? '').toString();
  }

  Future store(ReadModel read) async {
    _isSaving.value = true;
    read = controllerToModel(read);
    try {
      await read.save();
      selectedbook!.readPage = read.newPage;
      await selectedbook?.save();
      toast('Data berhasil diperbarui');
      Get.back();
      Get.back();
    } catch (e) {
      print(e);
      toast('Error ${e.toString()}');
    } finally {
      _isSaving.value = false;
    }
  }

  Future delete(BookModel book) async {
    if (book.id != null) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Book ID not found',
        onConfirm: () => Get.back(),
        textConfirm: 'Okay',
        buttonColor: Color(0xff8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: Color(0xff8332A6),
        titleStyle: TextStyle(color: Color(0xff8332A6)),
        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
      );
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
        onConfirm: () async {
          try {
            await book.delete(book.id ?? '');
            Get.back();
            Get.back();
          } catch (e) {
            print(e);
          }
        },
        onCancel: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Yes",
        textCancel: "Cancel",
        title: "Delete Book",
        middleText: "Are you sure?",
        buttonColor: Color(0xff8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: Color(0xff8332A6),
        titleStyle: TextStyle(color: Color(0xff8332A6)),
        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
      );
    } on Exception catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Failed to delete",
        onConfirm: () => Get.back(),
        textConfirm: "Okay",
        buttonColor: Color(0xff8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: black,
        titleStyle: TextStyle(color: Color(0xff8332A6)),
        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
      );
    }
  }

  Future deleteread(ReadModel read) async {
    if (read.id == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Book ID not found",
        onConfirm: () => Get.back(),
        textConfirm: "Okay",
        buttonColor: Color(0xff8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        titleStyle: TextStyle(color: Color(0xff8332A6)),
        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
      );
      return Future.value(null);
    }
    try {
      await read.delete();
    } on Exception catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Failed to delete ${e}",
        onConfirm: () => Get.back(),
        textConfirm: "Okay",
        buttonColor: Color(0xff8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        titleStyle: TextStyle(color: Color(0xff8332A6)),
        middleTextStyle: TextStyle(color: Color(0xff8332A6)),
      );
    }
  }

  @override
  void onInit() {
    rxBooks.bindStream(BookModel().streamList());
    rxReads.bindStream(ReadModel().streamAllList());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
