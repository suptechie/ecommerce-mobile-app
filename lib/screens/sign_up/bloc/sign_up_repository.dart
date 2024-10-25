/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */


import 'package:bagisto_app_demo/screens/sign_up/utils/index.dart';


abstract class SignUpRepository {
  Future<SignInModel?> callSignUpApi(
    String email,
    String firstName,
    String lastName,
    String password,
    String confirmPassword,
      bool subsNewsLetter
  );

  // Future<Subscribe?> subscribeNewsLetter(
  //     String email,
  //     );
}

class SignUpRepositoryImp implements SignUpRepository {
  @override
  Future<SignInModel?> callSignUpApi(
    String email,
    String firstName,
    String lastName,
    String password,
    String confirmPassword,
      bool subsNewsLetter
  ) async {
    SignInModel? SignUpResponseModel;

    try {
      SignUpResponseModel = await ApiClient().getSignUpData(
        email,
        firstName,
        lastName,
        password,
        confirmPassword,
          subsNewsLetter
      );

    } catch (error, stacktrace) {
      debugPrint("Error --> $error");
      debugPrint("StackTrace --> $stacktrace");
    }
    return SignUpResponseModel;
  }

  // @override
  // Future<Subscribe?> subscribeNewsLetter(
  //     String email,
  //     ) async {
  //   Subscribe? subscribeNewsletterModel;
  //
  //   try {
  //     subscribeNewsletterModel = await ApiClient().subscribeNewsLetter(
  //       email,
  //     );
  //
  //   } catch (error, stacktrace) {
  //     debugPrint("Error --> $error");
  //     debugPrint("StackTrace --> $stacktrace");
  //   }
  //   return subscribeNewsletterModel;
  // }
}
