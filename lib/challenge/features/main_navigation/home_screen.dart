import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/challenge/features/main_navigation/widgets/report_widget.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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

void _showBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size16),
        ),
        child: const ReportWidget(),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.size16),
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size48,
          color: Colors.blue.shade300,
        ),
      ),
      body: ListView.separated(
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
                                      borderRadius: BorderRadius.circular(99),
                                      border: Border.all(
                                          width: 3, color: Colors.white),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            FontAwesomeIcons.certificate,
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
                                    InkWell(
                                      onTap: () => _showBottomSheet(context),
                                      child: const FaIcon(
                                        FontAwesomeIcons.ellipsis,
                                      ),
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
                                strutStyle: const StrutStyle(fontSize: 16.0),
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
                            if (post['photos'].isNotEmpty)
                              Container(
                                height: 240,
                                decoration: const BoxDecoration(
                                    // color: Colors.black,
                                    ),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (var photo in post['photos'])
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 300,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              photo,
                                            ),
                                          ),
                                        ),
                                      ),
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
    );
  }
}
