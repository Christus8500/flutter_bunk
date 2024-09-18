import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:bunk/utils/helpers.dart' as helpers;

class AddPassword extends StatelessWidget {
  AddPassword({super.key});
  final TextEditingController appNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  bool isValid() {
    return (appNameController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  void savePassword() {
    if (isValid()) {
      helpers.savePassword(
          appName: appNameController.text,
          userName: userNameController.text,
          password: passwordController.text);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: savePassword,
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.save),
      ),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              appNameController.clear();
              userNameController.clear();
              passwordController.clear();
            },
            child: const Text(
              'Clear All',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        title: const Text(
          'Add Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Gap(40),
            TextField(
              controller: appNameController,
              decoration: const InputDecoration(
                label: Text('App Name'),
                border: OutlineInputBorder(),
                hintText: 'App Name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const Gap(40),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                label: Text('Username'),
                border: OutlineInputBorder(),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const Gap(40),
            StatefulBuilder(builder: (context, rebuild) {
              return TextField(
                controller: passwordController,
                obscureText: hidePassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      rebuild(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(hidePassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_outlined),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
