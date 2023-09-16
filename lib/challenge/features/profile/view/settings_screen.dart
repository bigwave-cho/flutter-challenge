import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/challenge/features/authentication/repos/authentication.repo.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _showPrivacyScreen() {
    context.pushNamed('privacy');
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const PrivacyScreen()));
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
              // 원래는 view는 repo와 직접 소통하면 안되지만 이건 간단한 거니까 예외로..
              // ref.read(authRepo).signOut();
              context.go('/');
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
        title: const Text('Settings'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView(
          children: [
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.user,
              ),
              title: Text(
                'Follow and invite friends',
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
              ),
              title: Text(
                'Notifications',
              ),
            ),
            InkWell(
              onTap: _showPrivacyScreen,
              child: const ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.lock,
                ),
                title: Text(
                  'Privacy',
                ),
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userCheck,
              ),
              title: Text(
                'Account',
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.thumbsUp,
              ),
              title: Text(
                'Help',
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.info,
              ),
              title: Text(
                'About',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
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
