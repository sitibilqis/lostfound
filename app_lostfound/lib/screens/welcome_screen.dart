import 'package:app_lostfound/screens/signin_screen.dart';
import 'package:app_lostfound/screens/signup_screen.dart';
import 'package:app_lostfound/theme/theme.dart';
import 'package:app_lostfound/widgets/custom_scaffold.dart';
import 'package:app_lostfound/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: '',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      //color: Colors.transparent,
                      icon: CircleAvatar(
                        radius: 100.0, // Ukuran lingkaran
                        backgroundColor: Colors.white, // Warna lingkaran
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blue, // Warna ikon panah
                          //size: 40.0, // Ukuran ikon panah
                        ),
                      ),
                    ),
                  ),
                  //jarak
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
