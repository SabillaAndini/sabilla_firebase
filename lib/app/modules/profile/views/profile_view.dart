import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      body: Stack(
        children: [
          Image.asset(
            'assets/profilebg.png', // Ganti dengan path ke gambar latar belakang Anda.
            fit: BoxFit.cover, // Sesuaikan sesuai kebutuhan.
            width: double.infinity, // Lebar gambar mengisi seluruh layar.
          ),
          const Positioned(
            top: 49.13, // Sesuaikan dengan posisi vertikal yang Anda inginkan.
            left:
                35.13, // Sesuaikan dengan posisi horizontal yang Anda inginkan.
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
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
                      'Full Name', // Ganti dengan nama Anda.
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'name@gmail.com', // Ganti dengan alamat email Anda.
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 49.13, // Sesuaikan dengan posisi vertikal yang Anda inginkan.
            right:
                35.13, // Sesuaikan dengan posisi horizontal yang Anda inginkan.
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(30.0), // Sesuaikan sesuai kebutuhan
                border: Border.all(
                  color: Colors.white, // Warna border yang Anda inginkan
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ), // Ikon edit di pojok kanan atas
                onPressed: () {
                  // Tambahkan aksi ketika ikon edit ditekan
                },
              ),
            ),
          ),
          Positioned(
            bottom:
                50, // Sesuaikan dengan posisi vertikal yang Anda inginkan untuk container bawah
            left:
                40, // Sesuaikan dengan posisi horizontal yang Anda inginkan untuk container kiri
            child: Container(
              width: 100, // Sesuaikan lebar container sesuai kebutuhan
              height: 55, // Sesuaikan tinggi container sesuai kebutuhan
              decoration: BoxDecoration(
                color: Colors.white, // Ganti warna container sesuai kebutuhan
                borderRadius:
                    BorderRadius.circular(8.0), // Radius border circular
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 80, 80, 80), // Warna bayangan
                    blurRadius: 3.0, // Radius blur
                    spreadRadius: 0.0, // Radius penyebaran
                    offset: Offset(0, 2), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Total Book',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '7',
                    style: TextStyle(
                      color: Color(0xFF8332A6),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom:
                50, // Sesuaikan dengan posisi vertikal yang Anda inginkan untuk container bawah
            right:
                40, // Sesuaikan dengan posisi horizontal yang Anda inginkan untuk container kanan
            child: Container(
              width: 100, // Sesuaikan lebar container sesuai kebutuhan
              height: 55, // Sesuaikan tinggi container sesuai kebutuhan
              decoration: BoxDecoration(
                color: Colors.white, // Ganti warna container sesuai kebutuhan
                borderRadius:
                    BorderRadius.circular(8.0), // Radius border circular
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 80, 80, 80), // Warna bayangan
                    blurRadius: 3.0, // Radius blur
                    spreadRadius: 0.0, // Radius penyebaran
                    offset: Offset(0, 2), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Total Progress',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '77%',
                    style: TextStyle(
                      color: Color(0xFF8332A6),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
