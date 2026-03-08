import 'package:e_librairie_front/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  UserProvider userProvider = UserProvider();

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

  void register() async {
    var data = {
      'user_name': 'test1',
      'full_name': 'test1 data',
      'phone': '0855264856',
      'email': 'test1@gmail.com',
      'password': 'testtest',
    };

    await userProvider.register(data: data);
  }

  void increment() => count.value++;
}
