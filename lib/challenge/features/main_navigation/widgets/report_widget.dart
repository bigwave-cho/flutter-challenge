import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  bool _isReportTapped = true;

  void _showReport() {
    _isReportTapped = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const reportList = [
      'I just dont like it',
      'its unlawful content under Nesafsdf',
      'sadfdsafsdfdasf',
      'sdf;asdflsfelsaf',
      'sfadfiasneflsdfdsfasdf',
      'I just dont like it',
      'its unlawful content under Nesafsdf',
      'sadfdsafsdfdasf',
      'sdf;asdflsfelsaf',
      'sfadfiasneflsdfdsfasdf',
      'I just dont like it',
      'its unlawful content under Nesafsdf',
      'sadfdsafsdfdasf',
      'sdf;asdflsfelsaf',
      'sfadfiasneflsdfdsfasdf',
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: _isReportTapped
          ? null
          : AppBar(
              backgroundColor: Colors.grey.shade50,
              automaticallyImplyLeading: false,
              title: Column(
                children: const [
                  Text("Report"),
                ],
              ),
            ),
      body: _isReportTapped
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Unfollow',
                              ),
                              Divider(),
                              Text(
                                'Mute',
                              ),
                            ],
                          ),
                        ),
                        Gaps.v20,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Hide',
                              ),
                              Divider(),
                              InkWell(
                                onTap: _showReport,
                                child: Text(
                                  'Report',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: reportList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  reportList[index],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                shape: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
    );
  }
}
