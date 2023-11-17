import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sabilla_firebase/app/data/book_model.dart';
import 'package:sabilla_firebase/app/data/read_model.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  ReadModel reads = Get.arguments ?? ReadModel();
  final authC = Get.find<LoginController>();

  get book => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBF2C98), Color(0xFF8332A6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  backgroundImage: AssetImage('assets/profilepic.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hai...',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 22),
                    ),
                    Obx(
                      () => Text(
                        '${authC.user.username}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
              iconSize: 35,
            ),
          ),
          const Positioned(
            top: 90,
            left: 16,
            child: Text(
              'Book List',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Positioned(
            top: 80,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed('/form');
              },
              iconSize: 20,
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            right: 10,
            child: SizedBox(
              height: 200,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.book.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () {
                        return GestureDetector(
                            onTap: () {
                              controller.editlist.value = index;
                            },
                            child: controller.editlist.value == index
                                ? Container(
                                    width: 150,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFF8332A6).withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    margin: EdgeInsets.only(right: 15),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.editlist.value = -1;
                                            },
                                            child: const Icon(
                                              Icons.cancel_outlined,
                                              color: Color.fromARGB(
                                                  255, 255, 250, 250),
                                              size:
                                                  20, // Sesuaikan ukuran ikon sesuai kebutuhan Anda
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListTile(
                                                  title: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  leading: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: () => Get.toNamed(
                                                      '/form',
                                                      arguments: book)),
                                              ListTile(
                                                  title: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  leading: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: () =>
                                                      controller.delete(book)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: 140,
                                    child: Obx(
                                      () => Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: controller.book[index]
                                                          .image!.isEmptyOrNull
                                                      ? Image.asset(
                                                          'assets/homeimage.png',
                                                          width: 80,
                                                          height: 60,
                                                        )
                                                      : Image.network(
                                                          '${controller.book[index].image}',
                                                          width: 90,
                                                          height: 80,
                                                        ),
                                                ),
                                                const SizedBox(height: 20),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '${controller.book[index].title}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFBF2C98),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '${controller.book[index].category}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFFBF2C98),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '${controller.book[index].readPage}/${controller.book[index].page} page',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFFBF2C98),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '50%',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFFBF2C98),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: 0.5,
                                                      minHeight: 10,
                                                      backgroundColor:
                                                          Colors.grey.shade400,
                                                      valueColor:
                                                          const AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Color(
                                                                  0xFF7C39BF)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 380, // Atur posisi top sesuai kebutuhan
            left: 10,
            right: 10, // Atur posisi right sesuai kebutuhan
            child: SizedBox(
              height: 300, // Sesuaikan tinggi sesuai kebutuhan
              child: Container(
                height: 612,
                width: 396,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.listread.length < 1
                          ? Center(
                              child: Text('No Read Found',
                                  style: TextStyle(color: Color(0xff7c39bf))),
                            )
                          : Expanded(
                              child: Container(
                                child: ListView.builder(
                                  itemCount: controller.listread.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Color backgroundColor = index % 2 == 0
                                        ? Color(0xFFBF2C98).withOpacity(0.1)
                                        : Color(0xFFBF2C98).withOpacity(0.2);
                                    return Dismissible(
                                        key: Key(
                                            '$index'), // Atur kunci unik untuk setiap item
                                        onDismissed: (direction) {},
                                        background: Container(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: Icon(Icons.delete),
                                        ),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                          ),
                                          child: Obx(
                                            () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Image.asset(
                                                    'assets/homeimage.png',
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${controller.book[index].title}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Tue, 23 Oct 2023, 12/25',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 50),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Container(
                                                    width: 50,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFBF2C98),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        '1 - 20',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8332A6),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Center(
                  child: Text(
                    "Reading Form",
                    style: TextStyle(
                      color:
                          Color(0xFF8332A6), // Ubah warna sesuai keinginan Anda
                      fontSize: 15, // Ukuran teks
                    ),
                  ),
                ),
                content: Obx(
                  () => Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      width: 250.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: controller.bkTitleC,
                            validator: (value) => value == null || value.isEmpty
                                ? 'This field is required'
                                : null,
                            decoration: InputDecoration(
                              labelText: "Select Book",
                              labelStyle: TextStyle(
                                color: Color(0xFF8332A6),
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(
                                Icons.book,
                                color: Color(0xFF8332A6),
                                size: 20,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: controller.prevPg,
                            validator: (value) => value == null || value.isEmpty
                                ? 'This field is required'
                                : null,
                            decoration: InputDecoration(
                              labelText: "Previous page",
                              labelStyle: TextStyle(
                                color: Color(0xFF8332A6),
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(
                                Icons.label,
                                color: Color(0xFF8332A6),
                                size: 20,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: controller.newPg,
                            validator: (value) => value == null || value.isEmpty
                                ? 'This field is required'
                                : null,
                            decoration: InputDecoration(
                              labelText: "Newest page",
                              labelStyle: TextStyle(
                                color: Color(0xFF8332A6),
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(
                                Icons.label_important,
                                color: Color(0xFF8332A6),
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Obx(
                            () => Container(
                              width: Get.width,
                              child: FloatingActionButton.extended(
                                  backgroundColor: Color(0xFF8332A6),
                                  onPressed: controller.isSaving
                                      ? null
                                      : () {
                                          if (form.currentState!.validate()) {
                                            controller.store(reads);
                                          }
                                        },
                                  label: controller.isSaving
                                      ? Text("Loading...")
                                      : Text("Submit")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(left: 70.0),
                icon: const Icon(
                  Icons.home,
                  color: Color(
                      0xFF8332A6), // Ganti dengan warna ikon yang Anda inginkan
                ),
                onPressed: () {
                  // Tambahkan aksi ketika ikon "home" ditekan
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(right: 70.0),
                icon: const Icon(Icons.person),
                onPressed: () {
                  Get.toNamed(
                      '/profile'); // Tambahkan aksi ketika ikon "list" ditekan
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class BookCard extends GetView<HomeController> {
//   BookCard({required this.book});
//   BookModel book;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
//             builder: (context) => Container(
//                 height: 130,
//                 child: Column(
//                   children: [
//                     ListTile(
//                         title: Text(
//                           "Edit",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         leading: Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                         onTap: () => Get.toNamed('/form', arguments: book)),
//                     ListTile(
//                         title: Text(
//                           "Delete",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         leading: Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                         ),
//                         onTap: () => controller.delete(book)),
//                   ],
//                 )));
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         width: 160,
//         height: 260,
//         margin: EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               book.image != null
//                   ? Container(
//                       height: 80,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: NetworkImage(book.image!),
//                               fit: BoxFit.cover)),
//                     )
//                   : Container(
//                       height: 80,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: AssetImage("assets/default.png"),
//                               fit: BoxFit.fitHeight)),
//                     ),
//               SizedBox(
//                 height: 15,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Text(
//                   book.title!,
//                   style: TextStyle(color: Color(0xFFBF2C98), fontSize: 18),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Text(
//                   book.category!,
//                   style: TextStyle(color: Color(0xFFBF2C98), fontSize: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Text(
//                   "${book.page} pages",
//                   style: TextStyle(color: Color(0xFFBF2C98), fontSize: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 NumberFormat.percentPattern('id')
//                     .format((book.readPage ?? 0) / (book.page ?? 0)),
//                 style: TextStyle(color: Color(0xFFBF2C98)),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: LinearProgressIndicator(
//                   color: Color(0xFF8332A6),
//                   value: (book.readPage ?? 0) / (book.page ?? 0),
//                   minHeight: 10,
//                   backgroundColor: Colors.grey[400],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }
