import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabilla_firebase/app/data/database.dart';
import 'package:sabilla_firebase/app/integrations/firestore.dart';

class ReadModel {
  String? id;
  String? bookId;
  int? prePage;
  int? newPage;
  DateTime? time;

  ReadModel({this.id, this.bookId, this.prePage, this.newPage, this.time});
  ReadModel.fromJson(DocumentSnapshot snapshot) {
    Map<String, dynamic>? json = snapshot.data() as Map<String, dynamic>?;
    id = snapshot.id;
    bookId = json?['bookid'];
    prePage = json?['prepage'];
    newPage = json?['newpage'];
    time = (json?['time']).toDate();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bookid'] = bookId;
    data['prepage'] = prePage;
    data['newpage'] = newPage;
    data['time'] = time;
    return data;
  }

  Database db = Database(
      collectionReference: firebaseFirestore.collection(
        readCollection,
      ),
      storageReference: firebaseStorage.ref(readCollection));

  Future<ReadModel> save() async {
    id == null ? id = await db.add(toJson()) : await db.edit(toJson());
    if (id != null) {
      db.edit(toJson());
    }
    return this;
  }

  Future delete() async {
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
    return await db.delete(id!);
  }

  Stream<List<ReadModel>> streamList() async* {
    yield* db.collectionReference
        .orderBy("time", descending: true)
        .snapshots()
        .map((query) {
      List<ReadModel> list = [];
      for (var doc in query.docs) {
        list.add(
          ReadModel.fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
