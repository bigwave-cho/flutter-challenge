import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/profile/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _showPrivacyScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PrivacyScreen()));
  }

  void _showAlertDialog(BuildContext context) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView(
          children: [
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.user,
              ),
              title: Text(
                'Follow and invite friends',
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
              ),
              title: Text(
                'Notifications',
              ),
            ),
            InkWell(
              onTap: _showPrivacyScreen,
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                ),
                title: Text(
                  'Privacy',
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userCheck,
              ),
              title: Text(
                'Account',
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.thumbsUp,
              ),
              title: Text(
                'Help',
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.info,
              ),
              title: Text(
                'About',
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () => {_showAlertDialog(context)},
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.blue.shade400,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
