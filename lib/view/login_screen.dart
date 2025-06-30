import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_base_helper.dart';
import 'package:qurinom_solutions_task_chat_app/helper/api_url.dart';
import 'package:qurinom_solutions_task_chat_app/view/home_screen.dart';
import 'package:qurinom_solutions_task_chat_app/view_model/provider/login_provider.dart';
import '../view_model/provider/checkBoxProvider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxProvider = Provider.of<CheckboxProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    TextEditingController nameController = TextEditingController(
      text: "swaroop.vass@gmail.com",
    );
    TextEditingController passwordController = TextEditingController(
      text: "@Tyrion99",
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                controller: nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                controller: passwordController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text("Customer"),
                        Checkbox(
                          value: checkboxProvider.isCustomerChecked,
                          onChanged: (checkBoxValue) {
                            checkboxProvider.toggleCustomerCheckBox(
                              checkBoxValue!,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Vendor"),
                        Checkbox(
                          value: checkboxProvider.isVendorChecked,
                          onChanged: (checkBoxValue) {
                            checkboxProvider.toggleVendorCheckBox(
                              checkBoxValue!,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          loginProvider
                              .loginUser(
                                nameController.text.trim(),
                                passwordController.text.trim().toString(),
                                checkboxProvider.selectedRole,
                              )
                              .then((data) {
                                print(data);
                                if (data != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                }
                              });
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
