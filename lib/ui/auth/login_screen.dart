import 'package:attendanceapp/ui/auth/signup_screen.dart';
import 'package:attendanceapp/ui/screens/home_screen.dart';
import 'package:attendanceapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHiddenPassword = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance; // creating reference for authentication

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    // creating a function
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString()); // future function
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
      Navigator.pushNamed(context, HomeScreen.routeName);
      setState(() {
        loading = false;
      });
    }).onError((error, StackTrace) {
      debugPrint(error
          .toString()); // to remove errors automatically in production mode
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            helperText: 'enter email e.g. john@gmail.com',
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: _isHiddenPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock_open),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account"),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SignUpScreen(),
                        //     ));
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text("Sign up")),
                ],
              ),
              // InkWell(
              //   onTap: () {

              //   },
              // ),
              // Container(
              //           height: 50,
              //           decoration:BoxDecoration(
              //            // color: Colors.blueGrey,
              //             borderRadius: BorderRadius.circular(30),
              //             border: Border.all(
              //              color: Colors.black,
              //             ),
              //           ),
              //           child: Center(
              //             child:Text('Login with phone'),
              //             ),
              //         )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (_isHiddenPassword == true) {
    //   _isHiddenPassword == false;
    // } else {
    //   _isHiddenPassword = true;
    // }
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
}
