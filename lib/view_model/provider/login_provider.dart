import 'package:flutter/material.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_base_helper.dart';

import '../../helper/api_url.dart';

class LoginProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<dynamic> loginUser(String name, String password, String vendor) async {
    notifyListeners();
    final response = await apiBaseHelper.postAPICall(userLoginApiUrl(), {
      "email": name,
      "password": password,
      "role": vendor,
    });
    notifyListeners();
    return response;
  }
}
