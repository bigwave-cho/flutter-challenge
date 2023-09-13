import 'package:flutter/material.dart';

class CActivityScreen extends StatefulWidget {
  static String routeName = '/activity';

  const CActivityScreen({super.key});

  @override
  State<CActivityScreen> createState() => _CActivityScreenState();
}

class _CActivityScreenState extends State<CActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    'All',
    'Replies',
    'Mentions',
    'recents',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);

    _tabController?.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController!.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activity',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController!,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          tabs: [
            for (int index = 0; index < _tabs.length; index++)
              Tab(
                icon: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == index
                        ? Colors.black
                        : Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      color: _selectedTabIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('이름'),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '4h',
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Mentioned you!',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,
                                          strutStyle:
                                              const StrutStyle(fontSize: 16.0),
                                          text: const TextSpan(
                                            text:
                                                "Here's a thread you should follow if you love botany @jane_mobbin",
                                            style: TextStyle(
                                              color: Colors.black,
                                              height: 1.4,
                                              fontSize: 16.0,
                                              fontFamily: 'NanumSquareRegular',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
