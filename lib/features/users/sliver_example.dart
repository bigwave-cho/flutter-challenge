import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

class SliverExample extends StatefulWidget {
  const SliverExample({super.key});

  @override
  State<SliverExample> createState() => _SliverExampleState();
}

class _SliverExampleState extends State<SliverExample> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          //snap: true, // floating이 true여야 사용가능(살짝 내려도 appbar내려옴)
          //  floating: true, //true: 리스트 중간에서 스크롤을 내려도 앱바가 내려옴.
          //  pinned: true, //최소 높이까지만 줄어듦.
          stretch: true,
          pinned: true,
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
        SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20,
              ),
            ],
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
        SliverPersistentHeader(
          pinned: true, //앱바 밑에 붙어버림
          delegate: CustomDelegate(),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.blue[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text('Item $index'),
              ),
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        ),
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            'Title!!!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    //build를 통해서 전혀 다른 위젯을 리턴할 때는 false
    return false;
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
