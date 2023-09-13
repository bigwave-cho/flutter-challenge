import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/video_config.dart';

class PrivacyScreen extends StatefulWidget {
  static String routeName = '/settings/privacy';

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool isPrivateProfileOn = false;

  bool _autoMute = videoConfig.autoMute;

  @override
  void initState() {
    super.initState();
    //방법2: addListener 에서 변화 감지하기.
    videoConfig.addListener(() {
      setState(() {
        _autoMute = videoConfig.autoMute;
        print(videoConfig.autoMute);
      });
    });
  }

  void _togglePrivateProfile(bool value) {
    isPrivateProfileOn = value;
    setState(() {});
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
            //방법1 : ChangeNotifier는 AnimatedBuilder와 함께 사용
            // 딱 애니메이티드 빌더만 리빌드 됨.
            AnimatedBuilder(
              animation: videoConfig,
              builder: (context, child) => SwitchListTile(
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
                // value: isPrivateProfileOn,
                value: videoConfig.autoMute,
                // onChanged: _togglePrivateProfile,
                onChanged: (value) {
                  videoConfig.toggleAutoMute();
                },
              ),
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
