import 'dart:convert';

import 'package:app_lostfound/homepage.dart';
import 'package:app_lostfound/ip.dart';
//import 'package:depan/screens/DashBoard.dart';
import 'package:app_lostfound/screens/signup_screen.dart';
import 'package:app_lostfound/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //controller
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  //method atau fungsi login
  Future login() async {
    var url =
        Uri.parse("http://$ipv4/api_lostfound/flutter-login-signup/login.php");
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);

    //kondisi jika dia  menerima pesan error dr server
    if (data == "Success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Username and password invalid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15);
    }
  }

  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ), //bikin yang melingkar/melengkung
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back', //tulisan welcome
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),

                      //email
                      TextFormField(
                        //validasi form fullname
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:
                              const Text('Username'), //tulisan label username
                          hintText: 'Enter Username', //placeholder
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: user,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      //password
                      TextFormField(
                        //membuat inputan menjadi *
                        obscureText: true,
                        obscuringCharacter: '*',

                        //validasi form fullname
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'), //tulisan label pw
                          hintText: 'Enter Password', //placeholder
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: pass,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      //button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            login(); //memanggil fungsi login
                            //kondisi validasi jika formsignin tervalidate, dan rememberPassword true maka akan ada snackbar
                            //if (_formSignInKey.currentState!.validate() &&
                            //    rememberPassword) {
                            //  ScaffoldMessenger.of(context).showSnackBar(
                            //    const SnackBar(
                            //      content: Text('Processing Data'),
                            //    ),
                            //  );

                            //kondisi validasi jika rememberPassword false maka akan ada snackbar pemberitahuan
                            //} else if (!rememberPassword) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //  const SnackBar(
                            //      content: Text('Please check your data!')),
                            //);
                            //}
                          },
                          child: const Text('Sign up'), //text button sign up
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      //pilihan login yg lain
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Bootstrap.facebook),
                          Icon(Bootstrap.twitter),
                          Icon(Bootstrap.google),
                          Icon(Bootstrap.apple),
                          //Brand(Brands.facebook_f),
                          //Brand(Brands.twitter),
                          //Brand(Brands.google),
                          //Brand(Brands.apple),
                        ],
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      // don't have an account / mengarah ke halaman register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
