import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/nvvm_with_riverpod/view_models/config_vm.dart';
import 'package:tiktok/video_config.dart';

class ExampleScreen extends ConsumerWidget {
  static String routeName = '/settings/privacy';

  const ExampleScreen({super.key});
  // STF Consumer은 stfwidget에서 context가 아무데서나 사용 가능한것 처럼 ref도 똑같음.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                value: false,
                onChanged: (value) {},
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
              // provider만 넣어주면 단순히 반환하는 데이터만 불러올 수 있음.
              value: ref.watch(riverpodConfigProvider).muted,
              onChanged: (value) {
                //notifire 클래스에 접근하고 싶다면 .notifire를 전달.
                ref.read(riverpodConfigProvider.notifier).setMuted(value);
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
              value: ref.watch(riverpodConfigProvider).autoplay,
              onChanged: (value) {
                //notifire 클래스에 접근하고 싶다면 .notifire를 전달.
                ref.read(riverpodConfigProvider.notifier).setAutoplay(value);
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
