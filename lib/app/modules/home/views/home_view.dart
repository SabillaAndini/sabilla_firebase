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
            top: 20, // Sesuaikan dengan posisi vertikal yang Anda inginkan.
            left: 16, // Sesuaikan dengan posisi horizontal yang Anda inginkan.
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  // Sesuaikan ukuran radius sesuai kebutuhan.
                  backgroundImage: AssetImage(
                      'assets/profilepic.png'), // Ganti dengan path ke gambar profil Anda.
                ),
                SizedBox(
                  width: 16,
                ), // Spasi horizontal antara CircleAvatar dan teks
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hai...', // Ganti dengan nama Anda.
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'username', // Ganti dengan alamat email Anda.
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20, // Sesuaikan dengan posisi vertikal yang Anda inginkan
            right: 16, // Sesuaikan dengan posisi horizontal yang Anda inginkan
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Tambahkan aksi ketika ikon ditekan
              },
              iconSize: 35, // Sesuaikan ukuran ikon sesuai kebutuhan
            ),
          ),
          const Positioned(
            top: 90, // Sesuaikan dengan posisi vertikal yang Anda inginkan
            left: 16, // Sesuaikan dengan posisi horizontal yang Anda inginkan
            child: Text(
              'Book List',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Positioned(
            top: 80, // Sesuaikan dengan posisi vertikal yang Anda inginkan
            right: 16, // Sesuaikan dengan posisi horizontal yang Anda inginkan
            child: IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              onPressed: () {
                // Tambahkan aksi ketika ikon "Add" ditekan
              },
              iconSize: 20, // Sesuaikan ukuran ikon sesuai kebutuhan
            ),
          ),
        ],
      ),
    );
  }
}
