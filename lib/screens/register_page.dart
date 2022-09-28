import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/services/auth_services.dart';

import '../shared/constants.dart';
import '../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  late String email = '';
  late String password = '';
  late String fullName = '';
  late bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Groupie',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Create your account now to chat and explore',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 200),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Full Name',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              fullName = value;
                            },
                          );
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'Name cannot be empty' : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              email = value;
                            },
                          );
                        },
                        validator: (value) =>
                            value != null && EmailValidator.validate(value)
                                ? 'please enter a valid email'
                                : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              password = value;
                            },
                          );
                        },
                        validator: (value) => value != null && value.length < 6
                            ? 'password must be at least 6 characters'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants().primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            register();
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Log In',
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(
                                    context,
                                    const RegisterPage(),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
    }
    await authService
        .registerUserWithEmailAndPassword(fullName, email, password)
        .then((value) {
      if (value == true) {
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
