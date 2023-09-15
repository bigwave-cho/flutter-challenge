import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/profile/view_models/darkmode_config_vm.dart';
import 'package:tiktok/nvvm_with_provider/view_models/config_vm.dart';
import 'package:tiktok/video_config.dart';
import 'package:provider/provider.dart';
/*
class EXPrivacyScreen extends StatefulWidget {
  static String routeName = '/settings/privacy';

  const EXPrivacyScreen({super.key});

  @override
  State<EXPrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<EXPrivacyScreen> {
  bool isPrivateProfileOn = false;

  bool _autoMute = vidoeConfig2.value;

  @override
  void initState() {
    super.initState();
    //방법2: addListener 에서 변화 감지하기.
    vidoeConfig2.addListener(() {
      setState(() {
        _autoMute = vidoeConfig2.value;
        // print(videoConfig.autoMute);
      });
    });

    context.read<ConfigViewModel>().addListener(() {
      if (!mounted) return;
      print(context.read<ConfigViewModel>().autoplay);
      // print(context.read<ConfigViewModel>().muted);
    });
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
            //방법1 : ChangeNotifier는 AnimatedBuilder와 함께 사용
            // 딱 애니메이티드 빌더만 리빌드 됨. (AnimatedBuilder 장점)
            AnimatedBuilder(
              // value notifier는 ValueListenableBuilder 사용해도 됨
              animation: vidoeConfig2,
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
                value: vidoeConfig2.value,
                // onChanged: _togglePrivateProfile,
                onChanged: (value) {
                  // videoConfig.toggleAutoMute();

                  vidoeConfig2.value = !vidoeConfig2.value;
                },
              ),
            ),
            // provider는 애니메이션 빌더 없어도 굳굳
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
              // value: isPrivateProfileOn,
              value: context.watch<ConfigViewModel>().muted,
              // onChanged: _togglePrivateProfile,
              onChanged: (value) {
                // videoConfig.toggleAutoMute();
                // context.read<VideoConfig>().toggleAutoplay();
                context.read<ConfigViewModel>().setMuted(value);
              },
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
              // value: isPrivateProfileOn,
              value: context.watch<ConfigViewModel>().autoplay,
              // onChanged: _togglePrivateProfile,
              onChanged: (value) {
                // videoConfig.toggleAutoMute();
                // context.read<VideoConfig>().toggleAutoplay();
                context.read<ConfigViewModel>().setAutoplay(value);
              },
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
              value: context.watch<DarkModeConfigViewModel>().isDark,
              onChanged: (value) {
                context.read<DarkModeConfigViewModel>().setDarkmode(value);
              },
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
*/