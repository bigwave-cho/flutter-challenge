import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true, // floating이 true여야 사용가능(살짝 내려도 appbar내려옴)
          floating: true, //true: 리스트 중간에서 스크롤을 내려도 앱바가 내려옴.
          //  pinned: true, //최소 높이까지만 줄어듦.
          stretch: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            // 펼쳐져있을때
            title: Text(
              'hello!',
              style: TextStyle(color: Colors.black),
            ),
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
              StretchMode.zoomBackground
            ],
            background: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('배경화면,'),
            ),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text('Item $index'),
              ),
            ),
          ),
          itemExtent: 100,
        ),
      ],
    );
  }
}


/*
slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            // 펼쳐져있을때
            title: Text(
              'hello!',
              style: TextStyle(color: Colors.black),
            ),
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
              StretchMode.zoomBackground
            ],
            background: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('배경화면,'),
            ),
          ),
        ),
      ],
 */