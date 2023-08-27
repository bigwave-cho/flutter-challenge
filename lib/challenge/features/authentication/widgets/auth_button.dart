import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color? textColor;

  const AuthButton({
    Key? key,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
    this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            FaIcon(
              icon,
              color: iconColor,
              size: Sizes.size32,
            ),
          if (icon != null) Gaps.h16,
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: Sizes.size24,
            ),
          ),
        ],
      ),
    );
  }
}
