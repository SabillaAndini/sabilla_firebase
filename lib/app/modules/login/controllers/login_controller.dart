import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/class_model.dart';
import '../../../integrations/firestore.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => _auth.authStateChanges();

  var currentUser = UserModel().obs;
  UserModel get user => currentUser.value;
  set user(UserModel value) => currentUser.value = value;

  var _isRegister = false.obs;
  bool get isRegister => _isRegister.value;
  set isRegister(value) => _isRegister.value = value;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(value) => _isSaving.value = value;

  late Rx<User?> firebaseUser;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController confirmC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  RxString _selectedGender = ''.obs;
  RxString get selectedGender => _selectedGender;

  void setSelectedGender(String value) {
    _selectedGender = value.obs;
    update();
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      print(pickedDate); // Format pickedDate => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat("EEE, dd MMM y").format(pickedDate);
      print(
          formattedDate); // Format tanggal terformat menggunakan paket intl => 2021-03-16
      dateC.text = formattedDate; // Setel nilai dateC dengan tanggal terformat
    } else {
      print("Tanggal tidak dipilih");
    }
  }

  login() async {
    try {
      // ignore: unused_local_variable
      final myUser = await _auth.signInWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      if (myUser.user!.emailVerified) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Failed to Login",
          middleText:
              "Verify your email first, Does verification need to be resent?",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
            Get.snackbar(
                'Success', 'Verification code has been sent to your email');
          },
          textConfirm: 'Yes',
          textCancel: 'No',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast("No User found for that email");
      } else if (e.code == 'wrong-password') {
        toast("Wrong password provided for that user");
      } else {
        toast(e.toString());
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  register() async {
    try {
      isSaving = true;
      UserModel user = UserModel(
        username: nameC.text,
        email: emailC.text,
        password: passC.text,
        birthDate: selectedDate,
        image: '',
        time: DateTime.now(),
      );
      UserCredential myUser = await _auth.createUserWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      await myUser.user!.sendEmailVerification();
      user.id = myUser.user!.uid;
      if (user.id != null) {
        firebaseFirestore
            .collection(usersCollection)
            .doc(user.id)
            .set(user.toJson);
      }
    } on FirebaseAuthException catch (e) {
      isSaving = false;
      if (e.code == 'weak-password') {
        toast('Password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toast('An account already exists for this email');
      } else {
        toast(e.toString());
      }
    }
  }

  void logout() async {
    Get.defaultDialog(
        title: 'Logout',
        middleText: 'Are you sure?',
        onConfirm: () async {
          await FirebaseAuth.instance.signOut();
          Get.back();
          isSaving = false;
          emailC.clear();
          passC.clear();
          Get.offAndToNamed(Routes.LOGIN);
        },
        textConfirm: 'Yes',
        textCancel: 'No');
  }

  void signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: 'emailC', password: 'passC');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  streamUser(User? fuser) {
    if (fuser != null) {
      currentUser.bindStream(UserModel().streamList(fuser.uid));
      print("auth id = ${fuser.uid}");
    } else {
      print("null auth");
      user = UserModel();
    }
  }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, streamUser);
  }

  @override
  void onClose() {
    emailC.clear();
    passC.clear();
    confirmC.clear();
    nameC.clear();
  }
}
