import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class HorizontalSelectionWidget extends StatefulWidget {
  final String title;
  final Function(String) onSelectInterest;

  const HorizontalSelectionWidget({
    Key? key,
    required this.title,
    required this.onSelectInterest,
  }) : super(key: key);

  @override
  State<HorizontalSelectionWidget> createState() =>
      _HorizontalSelectionWidgetState();
}

class _HorizontalSelectionWidgetState extends State<HorizontalSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              SizedBox(
                width: 2000,
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: [
                    for (var interest in interests)
                      InterestButton(
                        interest: interest,
                        onSelectInterest: widget.onSelectInterest,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
