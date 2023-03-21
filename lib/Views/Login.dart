import 'package:flutter/material.dart';
import 'package:fruits_app/Constants/Colors.dart';
import 'package:fruits_app/Views/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required title}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              key: _formKey,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 100,
                      width: 85,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: AppColors.PRIMARY_COLOR),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Log in to continue',
                        style: TextStyle(fontSize: 20))),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      hintText: 'Email Address'),
                  // decoration: const InputDecoration(
                  //     border: OutlineInputBorder(), hintText: 'Email Address'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  focusNode: textFieldFocusNode,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      hintText: 'Password',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            size: 24,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color.fromARGB(100, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: AppColors.PRIMARY_COLOR,
                    height: 60,
                    width: 350,
                    child: InkWell(
                      onTap: () {
                        if (_passwordController.text == 'admin' &&
                            _usernameController.text == 'admin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Wrong Email Address or Password!'),
                            ),
                          );
                        }
                      },
                      child: const Center(
                        child: Text('Sign in',
                            style:
                                TextStyle(color: Colors.white, fontSize: 23)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                const Text.rich(
                  TextSpan(
                    text: "Dont't have an account? ",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(122, 0, 0, 0)),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Signup',
                        style: TextStyle(color: AppColors.PRIMARY_COLOR),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Skip ->',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void checkLogin(BuildContext ctx) async {
  //   final _username = _usernameController.text;
  //   final _password = _passwordController.text;
  //   if (_username == _password) {
  //     print("Match");

  //     final _username = 'admin';
  //     final _password = 'admin';
  //     Navigator.of(ctx)
  //         .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
  //   } else {
  //     print('Not Match');
  //   }
  // }
}
