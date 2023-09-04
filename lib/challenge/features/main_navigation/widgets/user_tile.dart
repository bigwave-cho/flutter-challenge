import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTileWidget extends StatefulWidget {
  const UserTileWidget({super.key});

  @override
  State<UserTileWidget> createState() => _UserTileWidgetState();
}

class _UserTileWidgetState extends State<UserTileWidget> {
  bool _isFollowedUser = false;

  void _onToggleFollow() {
    _isFollowedUser = !_isFollowedUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('이름'),
                    SizedBox(
                      width: 6,
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
                Text('subtitle'),
                SizedBox(
                  height: 10,
                ),
                Text('26.6K followers'),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: _onToggleFollow,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _isFollowedUser ? 'Follow' : 'Unfollow',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isFollowedUser ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
