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
                      title: const Center(child: Text("Reading Form")),
                      content: Container(
                        width: 250.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Select Book",
                                labelStyle: TextStyle(
                                  color: Color(0xFF8332A6),
                                ),
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Previous Page",
                                labelStyle: TextStyle(color: Color(0xFF8332A6)),
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Newest Read Page",
                                labelStyle: TextStyle(color: Color(0xFF8332A6)),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF8332A6)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
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
                );
              },
              iconSize: 20,
            ),
          ),
          Positioned(
            top: 120, // Atur posisi top sesuai kebutuhan
            left: 10,
            right: 10, // Atur posisi right sesuai kebutuhan
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: LinearProgressIndicator(
                                    value: 0.5,
                                    minHeight: 10,
                                    backgroundColor: Colors.grey.shade400,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color(0xFF7C39BF)),
                                  ),
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
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount:
                              20, // Ganti dengan jumlah item yang Anda inginkan
                          itemBuilder: (BuildContext context, int index) {
                            // Menggunakan indeks genap/ganjil untuk mengganti warna latar belakang
                            Color backgroundColor = index % 2 == 0
                                ? Color(0xFFBF2C98).withOpacity(0.1)
                                : Color(0xFFBF2C98).withOpacity(0.2);
                            return Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Image.asset(
                                      'assets/homeimage.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Book Name',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      Text(
                                        'Tue, 23 Oct 2023, 12/25',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFBF2C98),
                                        borderRadius: BorderRadius.circular(10),
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
                            );
                          },
                        ),
                      ),
                    ),
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
          Get.toNamed('/form');
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
