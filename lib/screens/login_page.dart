import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/screens/register_page.dart';
import 'package:my_chat/shared/constants.dart';
import 'package:my_chat/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey = GlobalKey<FormState>();
  late String email = '';
  late String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Groupie',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login now to see whats on your dm',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 200),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    labelText: 'Email',
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
                      login();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register here',
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

  login() {
    formKey.currentState!.validate();
  }
}
