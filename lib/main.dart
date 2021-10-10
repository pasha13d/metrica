import 'package:flutter/material.dart';
import 'package:metrica/views/login/user_login.dart';
import 'package:metrica/views/registration/user_registration.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Metrica'),
              backgroundColor: Colors.lightBlue,
              leading: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.people_alt_outlined),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.login_outlined), text: 'Login',),
                  Tab(icon: Icon(Icons.app_registration_outlined), text: 'Register',),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                UserLogin(),
                UserRegistration(),
              ],
            ),
          ),
      ),
    );
  }
}



