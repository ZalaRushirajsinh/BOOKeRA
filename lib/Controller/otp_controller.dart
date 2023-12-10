import 'package:figma/authentication.dart';
import 'package:figma/dashboard_page.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(DashboardPage()) : Get.back();
  }
}
