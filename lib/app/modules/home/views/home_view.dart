import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
          const Positioned(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hai...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'username',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
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
              onPressed: () {
                // Tambahkan aksi ketika ikon ditekan
              },
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title:
                          Center(child: Text("Reading Form")), // Judul dialog
                      content: Container(
                        width: 250.0, // Lebar konten dialog
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Select Book",
                                labelStyle: TextStyle(
                                    color: Color(
                                        0xFF8332A6)), // Mengatur warna label
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Previous Page",
                                labelStyle: TextStyle(color: Color(0xFF8332A6)),
                              ), // Textfield untuk menginputkan item baru
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Newest Read Page",
                                labelStyle: TextStyle(color: Color(0xFF8332A6)),
                              ), // Textfield untuk menginputkan item baru
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Tambahkan aksi untuk menambahkan item ke daftar Anda di sini
                                    Navigator.of(context)
                                        .pop(); // Tutup dialog setelah menambahkan item
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .all<Color>(const Color(
                                            0xFF8332A6)), // Ganti warna sesuai keinginan
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            30), // Ganti sesuai keinginan
                                      ),
                                    ),
                                  ),
                                  child: Text("Submit"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ); // Tambahkan aksi ketika ikon "Add" ditekan
              },
              iconSize: 20,
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            right: 0,
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 140,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Image.asset('assets/homeimage.png')),
                              const SizedBox(height: 20),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Book Name',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFBF2C98),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFBF2C98),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '125/250 Page',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFBF2C98),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '50%',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFBF2C98),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: LinearProgressIndicator(
                                  value: 0.5, // Nilai 0.5 mewakili 50%
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFBF2C98)),
                                  backgroundColor: Colors
                                      .grey, // Warna latar belakang progress bar
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 340, // Sesuaikan posisi top sesuai kebutuhan
            left: 20,
            right: 20,
            child: Container(
              width: 300,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: ScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    // Ganti ini dengan tampilan item Anda
                    child: Container(
                      child: ListTile(
                        title: Text('Item $index'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF8332A6),
        onPressed: () {
          Get.toNamed('/form');
        },
        child: Icon(Icons.add, color: Colors.white),
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
