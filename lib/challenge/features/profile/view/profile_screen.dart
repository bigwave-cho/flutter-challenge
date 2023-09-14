import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/profile/view/settings_screen.dart';
import 'package:tiktok/challenge/features/profile/view/widgets/c_persistent_tabbar.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> posts = [
    {
      'userName': "Tim",
      'profileImg':
          "https://plus.unsplash.com/premium_photo-1691030256201-b73e0d0c60e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80",
      'content':
          '세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식)',
      'photos': [
        'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'https://plus.unsplash.com/premium_photo-1691030256201-b73e0d0c60e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80',
        'https://images.unsplash.com/photo-1667949378769-ea42eced4bfd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80'
      ],
      'replyCount': 12,
      'likeCount': 200,
    },
    {
      'userName': "Babo",
      'profileImg':
          "https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
      'content': '배고프다 야식 먹을까?',
      'photos': [
        'https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'
      ],
      'replyCount': 22,
      'likeCount': 200,
    },
    {
      'userName': "아아아아아",
      'profileImg':
          "https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
      'content':
          '세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식)',
      'photos': [],
      'replyCount': 232,
      'likeCount': 200,
    },
    {
      'userName': "Tim",
      'profileImg':
          "https://plus.unsplash.com/premium_photo-1691030256201-b73e0d0c60e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80",
      'content':
          '세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식)',
      'photos': [
        'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'https://plus.unsplash.com/premium_photo-1691030256201-b73e0d0c60e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80',
        'https://images.unsplash.com/photo-1667949378769-ea42eced4bfd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2187&q=80'
      ],
      'replyCount': 12,
      'likeCount': 200,
    },
    {
      'userName': "Babo",
      'profileImg':
          "https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
      'content': '배고프다 야식 먹을까?',
      'photos': [
        'https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'
      ],
      'replyCount': 22,
      'likeCount': 200,
    },
    {
      'userName': "아아아아아",
      'profileImg':
          "https://images.unsplash.com/photo-1682687982468-4584ff11f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
      'content': '배고프다 야식 먹을까? 나도',
      'photos': [],
      'replyCount': 232,
      'likeCount': 200,
    }
  ];

  void _showSettingsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          body: TabBarView(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 16,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpg",
                          image:
                              "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade400,
                  );
                },
                itemBuilder: (context, index) {
                  Map<String, dynamic> post = posts[index];
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        // 메인 내용 부분
                        IntrinsicHeight(
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //프로필 이미지
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: 29,
                                          backgroundColor: Colors.black,
                                          //이미지 넣어주기
                                          foregroundImage: NetworkImage(
                                            post['profileImg'] ?? "",
                                          ),
                                        ),
                                        Positioned(
                                          right: -7,
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //아래 세로줄
                                  Expanded(
                                    child: Container(
                                      width: 1,
                                      // height: 280,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // 유저이름 ,내용 , 사진, 이모티콘부분
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              post['userName'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: Stack(
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .certificate,
                                                    color: Colors.blue.shade300,
                                                    size: 20,
                                                  ),
                                                  const Align(
                                                    alignment: Alignment.center,
                                                    child: FaIcon(
                                                      FontAwesomeIcons.check,
                                                      color: Colors.white,
                                                      size: 10,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text('7h'),
                                            const FaIcon(
                                              FontAwesomeIcons.ellipsis,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent),
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        strutStyle:
                                            const StrutStyle(fontSize: 16.0),
                                        text: TextSpan(
                                          text: post['content'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            height: 1.4,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('earthpix'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('What is one place you hoho~'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.heart,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.chat_bubble_outline_outlined,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.recycling,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.paperPlane,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 댓글 부분 로우
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              clipBehavior: Clip.none,
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                                          ),
                                        ),
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                                          ),
                                        ),
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                                          ),
                                        ),
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('53 replies'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.circle,
                              size: 4,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('437 likes'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Container(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 20,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.earthAsia,
                    size: Sizes.size20,
                  ),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: InkWell(
                      onTap: _showSettingsScreen,
                      child: Icon(
                        FontAwesomeIcons.checkDouble,
                        size: Sizes.size20,
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jane',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text('jane_mobbin'),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text('threads.net'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Plant enThusiast!'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: const [
                                      CircleAvatar(
                                        radius: 10,
                                        foregroundImage: NetworkImage(
                                            "https://avatars.githubusercontent.com/u/3612017"),
                                        child: Text("User"),
                                      ),
                                      Positioned(
                                        right: -10,
                                        child: CircleAvatar(
                                          radius: 10,
                                          foregroundImage: NetworkImage(
                                              "https://avatars.githubusercontent.com/u/3612017"),
                                          child: Text("User"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gaps.h16,
                                  Text(
                                    "2 followers",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 50,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/3612017"),
                            child: Text("User"),
                          ),
                        ],
                      ),
                      Gaps.v24,
                      Gaps.v14,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size14,
                                horizontal: Sizes.size40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size4,
                                ),
                              ),
                              child: const Text(
                                'Edit profile',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size14,
                                horizontal: Sizes.size40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size4,
                                ),
                              ),
                              child: const Text(
                                'Share profile',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: CPersistentTabBar(),
              ),
            ];
          },
        ),
      ),
    );
  }
}
