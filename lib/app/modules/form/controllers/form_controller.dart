import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  var path = ''.obs;

  Future<void> selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) path.value = image!.path;
  }

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
