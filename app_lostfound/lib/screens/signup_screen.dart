import 'dart:convert';

import 'package:app_lostfound/ip.dart';
import 'package:app_lostfound/screens/signin_screen.dart';
import 'package:app_lostfound/theme/theme.dart';
import 'package:app_lostfound/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //controller
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();

  //method/fungsi register
  Future register() async {
    var url =
        Uri.parse("http://$ipv4/api_lostfound/flutter-login-signup/register.php");
    var response = await http.post(url, body: {
      "fullname": fullname.text,
      "email": email.text,
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);

    //kondisi jika dia  menerima pesan error dr server
    if (data == "Error") {
      //toast
      Fluttertoast.showToast(
          msg: "User allready exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15);
    } else {
      Fluttertoast.showToast(
          msg: "Succsesfuly Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    }
  }

  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
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
          ),
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
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // tulisan get started
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),

                      //pemberi jarak antara tulisan dg textfield
                      const SizedBox(
                        height: 40.0,
                      ),

                      // full name
                      TextFormField(
                        //validasi form fullname
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Full Name'), //text fullname
                          hintText: 'Enter Full Name', //placeholder
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
                        controller:
                            fullname, //controller yg menerima inputan user
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      // email
                      TextFormField(
                        //validasi form fullname
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'), //tulisan email
                          hintText: 'Enter Email', //placeholder
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
                        controller: email, //controller yg menerima inputan user
                      ),

                      //pemberi jarak antara tulisan dg textfield
                      const SizedBox(
                        height: 25.0,
                      ),

                      // username
                      TextFormField(
                        //validasi form username
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Username'), //ulisan username
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
                        controller: user, //controller yg menerima inputan user
                      ),

                      //pemberi jarak antara tulisan dg textfield
                      const SizedBox(
                        height: 25.0,
                      ),

                      // password
                      TextFormField(
                        //membuat tulisan password menjadi *
                        obscureText: true,
                        obscuringCharacter: '*',

                        //validasi form password
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:
                              const Text('Password'), //tulisan label password
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
                        controller: pass, //controller yg menerima inputan user
                      ),

                      //pemberi jarak antara tulisan dg textfield
                      const SizedBox(
                        height: 25.0,
                      ),

                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            register(); //memanggil method register
                            //kondisi validasi jika formsignup tervalidate, dan peresonaldatagree maka akan ada snackbar
                            //if (_formSignupKey.currentState!.validate() &&
                            //    agreePersonalData) {
                            //  ScaffoldMessenger.of(context).showSnackBar(
                            //    const SnackBar(
                            //      content: Text('Processing Data'),
                            //    ),
                            //  );
                            //kondisi jika tdk agreepersonal data (valid)
                            //} else if (!agreePersonalData) {
                            //  ScaffoldMessenger.of(context).showSnackBar(
                            //    const SnackBar(
                            //        content: Text('Please check your data!')),
                            //  );
                            //}
                          },
                          child: const Text('Sign up'), //tulisan button sign up
                        ),
                      ),

                      //jarak
                      const SizedBox(
                        height: 30.0,
                      ),

                      // sign up pake logo logo ituw
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
                        height: 30.0,
                      ),
                      // sign up social media logo
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

                      // tulisan alredy
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            //tulisan link untuk ke halaman sign in
                            child: Text(
                              'Sign in',
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
