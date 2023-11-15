import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabilla_firebase/app/data/database.dart';
import 'package:sabilla_firebase/app/integrations/firestore.dart';

class BookModel {
  String? id;
  String? title;
  String? category;
  int? page;
  int? readPage;
  String? image;
  DateTime? time;

  BookModel(
      {this.id, this.title, this.category, this.page, this.image, this.time});

  BookModel.fromJson(DocumentSnapshot snapshot) {
    Map<String, dynamic>? json = snapshot.data() as Map<String, dynamic>?;
    id = snapshot.id;
    title = json?['title'];
    category = json?['category'];
    page = json?['page'];
    readPage = json?['readPage'];
    image = json?['image'];
    time = (json?['time']).toDate();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['page'] = page;
    data['readPage'] = readPage;
    data['image'] = image;
    data['time'] = time;
    return data;
  }

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        bookCollection,
      ),
      storageReference: firebaseStorage.ref(bookCollection));

  Future<BookModel> save({File? file}) async {
    id == null ? id = await db.add(toJson()) : await db.edit(toJson());
    if (file != null && id != null) {
      image = await db.upload(id: id!, file: file);
      db.edit(toJson());
    }
    return this;
  }

  Future delete(String s) async {
    if (id == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Invalid ID",
        onConfirm: () => Get.back(),
        textConfirm: "Okay",
        buttonColor: Color(0xFF8332A6),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
      );
      return;
    }
    return await db.delete(id!, url: image);
  }

  Stream<List<BookModel>> streamList() async* {
    yield* db.collectionReference
        .orderBy("time", descending: true)
        .snapshots()
        .map((query) {
      List<BookModel> list = [];
      for (var doc in query.docs) {
        list.add(
          BookModel.fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
