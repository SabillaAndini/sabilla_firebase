import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<LoginController>();
  final currentUser = FirebaseAuth.instance.currentUser!;
  TextEditingController dateC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF2FF),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/profilebg.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: 49.13,
                left: 35.13,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
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
                          '${authC.user.username}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${authC.user.email}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 49.13,
                right: 35.13,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 97, 95, 95),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Book',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          Text(
                            '7',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8332A6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 130,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 97, 95, 95),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Progres',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          Text(
                            '77%',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8332A6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xff8332A6),
                          size: 40,
                        ),
                        SizedBox(width: 23),
                        Text(
                          '${authC.user.username}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Color(0xff8332A6),
                          size: 40,
                        ),
                        SizedBox(width: 23),
                        Text(
                          '${authC.user.email}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cake,
                          color: Color(0xff8332A6),
                          size: 40,
                        ),
                        SizedBox(width: 23),
                        Text(
                          authC.user.birthDate is DateTime
                              ? DateFormat("EEE, dd MMM y")
                                  .format(authC.selectedDate!)
                              : '--',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          authC.user.gender == 'male'
                              ? Icons.male
                              : Icons.female,
                          color: Color(0xff8332A6),
                          size: 40,
                        ),
                        SizedBox(width: 23),
                        Text(
                          authC.user.gender == 'male' ? 'Male' : 'Female',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
                ),
                onPressed: () {
                  Get.toNamed('/home');
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: const EdgeInsets.only(right: 70.0),
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFF8332A6),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
