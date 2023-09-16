import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/main_navigation/c_main_navigation.dart';
import 'package:tiktok/challenge/features/onboarding/widgets/horizontal_selection_widget.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:go_router/go_router.dart';

class CSecondInterestScreen extends StatefulWidget {
  static String routeURL = '/interest';

  const CSecondInterestScreen({super.key});

  @override
  State<CSecondInterestScreen> createState() => _CSecondInterestScreenState();
}

class _CSecondInterestScreenState extends State<CSecondInterestScreen> {
  final List<String> _interests = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onSubmit() {
    context.go('/home');
    // if (_interests.length < 3) return;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const BirthdayScreen(),
    //   ),
    // );
  }

  void _onSelectInterests(String interest) {
    if (_interests.contains(interest)) {
      _interests.remove(interest);
    } else {
      _interests.add(interest);
    }
    setState(() {});
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v40,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: const Text(
              "What do you want to see on Twitter?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Gaps.v10,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: const Text(
              'Interests are used to personalize your experience and will be visible on your profile.',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Gaps.v16,
          const Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              children: [
                HorizontalSelectionWidget(
                  title: 'Music',
                  onSelectInterest: _onSelectInterests,
                ),
                HorizontalSelectionWidget(
                  title: 'Entertainment',
                  onSelectInterest: _onSelectInterests,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Great work!🎉',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: _onSubmit,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: _interests.length > 2 ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
