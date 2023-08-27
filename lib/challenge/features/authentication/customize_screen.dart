import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  void _goBackToPrevScreen() {
    Navigator.pop(context, false);
  }

  void _goNextStep() {
    Navigator.pop(context, true);
  }

  bool isAgree = false;

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
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _goBackToPrevScreen,
              child: const Text(
                'cancel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Text('커스터마이즈 유어 익스피리언스'),
          const Text('트랙 어쩌고'),
          Row(
            children: [
              const Text('트랙 어쩌고'),
              Switch(
                value: isAgree,
                onChanged: (value) {
                  isAgree = value;
                  setState(() {});
                },
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            if (!isAgree) return;
            if (isAgree) _goNextStep();
          },
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isAgree ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
