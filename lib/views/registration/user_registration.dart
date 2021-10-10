import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UserRegistration extends StatefulWidget {

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
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

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //for piexls error
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                            ),
                            validator: RequiredValidator(errorText: 'Enter your address'),
                          ),
                        ),
                        const SizedBox(width: 10.0,),
                        Expanded(
                          child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Last Name',
                          ),
                          ),
                        )
                      ]
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                    validator: RequiredValidator(errorText: 'Enter your address'),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone no',
                    ),
                    validator: RequiredValidator(errorText: 'Enter your phone number'),
                  ),
                  const SizedBox(height: 15.0),
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
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Please enter your password';
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Re-enter password';
                      }
                      if(_passwordController.text != _confirmPasswordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  OutlinedButton(
                    onPressed: () {
                      validate();
                    },
                    child: const Text('Registration',
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
