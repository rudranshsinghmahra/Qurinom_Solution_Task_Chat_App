import 'package:flutter/material.dart';

class CheckboxProvider with ChangeNotifier {
  bool isCustomerChecked = false;
  bool isVendorChecked = false;

  void toggleCustomerCheckBox(bool value) {
    isCustomerChecked = value;
    if (value) isVendorChecked = false;
    notifyListeners();
  }

  void toggleVendorCheckBox(bool value) {
    isVendorChecked = value;
    if (value) isCustomerChecked = false;
    notifyListeners();
  }

  String get selectedRole {
    if (isCustomerChecked) return "customer";
    if (isVendorChecked) return "vendor";
    return "";
  }
}
