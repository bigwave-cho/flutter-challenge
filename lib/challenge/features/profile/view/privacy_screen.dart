import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/profile/view_models/darkmode_config_vm.dart';
import 'package:tiktok/nvvm/view_models/config_vm.dart';
import 'package:tiktok/video_config.dart';
import 'package:provider/provider.dart';

class PrivacyScreen extends StatefulWidget {
  static String routeName = '/settings/privacy';

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool isPrivateProfileOn = false;

  @override
  void initState() {
    super.initState();
  }

  void _togglePrivateProfile(bool value) {
    isPrivateProfileOn = value;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
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
            SwitchListTile(
              activeColor: Colors.black,
              title: Row(children: const [
                FaIcon(
                  FontAwesomeIcons.lock,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Private profile',
                )
              ]),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              activeColor: Colors.black,
              title: Row(children: const [
                FaIcon(
                  FontAwesomeIcons.lock,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Muted',
                )
              ]),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              activeColor: Colors.black,
              title: Row(children: const [
                FaIcon(
                  FontAwesomeIcons.lock,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Autoplay',
                )
              ]),
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              activeColor: Colors.red,
              title: Row(children: const [
                FaIcon(
                  FontAwesomeIcons.lock,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'DarkMode',
                )
              ]),
              value: false,
              onChanged: (value) {},
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.at,
              ),
              title: Text(
                'Mentions',
              ),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.volumeXmark,
              ),
              title: const Text(
                'Muted',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Everyone'),
                  SizedBox(
                    width: 10,
                  ),
                  FaIcon(FontAwesomeIcons.arrowRight),
                ],
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.eyeSlash,
              ),
              title: Text(
                'Hidden Words',
              ),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.users,
              ),
              title: Text(
                'Profiles you follow',
              ),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text(
                'Profiles you follow',
              ),
              subtitle: Text(
                  'some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.'),
              trailing: FaIcon(
                FontAwesomeIcons.share,
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleXmark,
              ),
              title: Text(
                'Blocked profiles',
              ),
              trailing: FaIcon(
                FontAwesomeIcons.share,
              ),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.heartCrack,
              ),
              title: Text(
                'Hide likes',
              ),
              trailing: FaIcon(
                FontAwesomeIcons.share,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
