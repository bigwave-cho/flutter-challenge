import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/authentication/sign_up_screen.dart';
import 'package:tiktok/challenge/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/constants/sizes.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void _onSignUpTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue.shade300,
          size: Sizes.size40,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 150,
          ),
          child: Column(
            children: [
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: Sizes.size96 + 40,
              ),
              AuthButton(
                text: 'Continue with Google',
                icon: FontAwesomeIcons.google,
                iconColor: Colors.blue.shade300,
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: Sizes.size20,
              ),
              const AuthButton(
                text: 'Continue with Google',
                icon: FontAwesomeIcons.apple,
                iconColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: Sizes.size24,
              ),
              Divider(
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: Sizes.size16,
              ),
              GestureDetector(
                onTap: _onSignUpTap,
                child: const AuthButton(
                  text: 'Create account',
                  iconColor: Colors.black,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: Sizes.size16,
              ),
              const Text('가입할라믄 정책, 쿠키 사용 등에 동의해야해요!'),
              const SizedBox(
                height: Sizes.size32,
              ),
              Row(
                children: [
                  const Text(
                    'Have an account already?',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
