import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UserLogin extends StatefulWidget {

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if(formKey.currentState!.validate()){
      print("validated");
    } else {
      print("Not validated");
    }
  }

  String validatePassword(value) {
    if(value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6){
      return 'Should be at least 6 characters';
    } else if(value.length >15) {
      return 'Should not be more than 15 characters';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      // hintText: 'Email',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      labelText: 'Email',
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Enter your email'),
                        EmailValidator(errorText: 'Enter a valid email'),
                      ]
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: validatePassword,
                  ),
                  const SizedBox(height: 15.0),
                  OutlinedButton(
                      onPressed: () {
                        validate();
                      },
                      child: const Text('Login',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18.0
                      ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
