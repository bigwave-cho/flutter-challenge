import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/main_navigation/c_activity_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/c_search_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/home_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/post_thread_screen.dart';
import 'package:tiktok/challenge/features/main_navigation/widgets/c_nav_tab.dart';
import 'package:tiktok/constants/sizes.dart';

class CMainNavigation extends StatefulWidget {
  const CMainNavigation({super.key});

  @override
  State<CMainNavigation> createState() => _CMainNavigationState();
}

class _CMainNavigationState extends State<CMainNavigation> {
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showPostBottomModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size16),
      ),
      context: context,
      builder: (context) {
        return const PostThreadScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //Offstage 위젯 : offstage 불린에 따라 화면에 보이고 안보이게
          // 단 위젯은 계속 살아있는 상태다.
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const CSearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const CActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Scaffold(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size24),
          child: Row(
            children: [
              CNavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.houseChimneyUser,
                selectedIcon: FontAwesomeIcons.houseChimney,
                onTap: () => _onTap(0),
              ),
              CNavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              CNavTab(
                text: "Discover",
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.noteSticky,
                selectedIcon: FontAwesomeIcons.solidNoteSticky,
                onTap: () {
                  _showPostBottomModal(context);
                },
              ),
              CNavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.solidHeart,
                onTap: () => _onTap(3),
              ),
              CNavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
