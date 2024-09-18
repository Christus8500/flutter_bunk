import 'package:bunk/pages/add_password_page.dart';
import 'package:bunk/services/database_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void getPasswords() {
    final box = Hive.box<Password>('password');
    print(box.values.first.appName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(
          'Bunk',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddPassword();
          }));
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const Center(
        child: Text(
          'No Password Yet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
