import 'package:flutter/material.dart';

class CInterestButton extends StatefulWidget {
  final String title;
  final Function(String) onSelectInterest;

  const CInterestButton({
    Key? key,
    required this.title,
    required this.onSelectInterest,
  }) : super(key: key);

  @override
  State<CInterestButton> createState() => _CInterestButtonState();
}

class _CInterestButtonState extends State<CInterestButton> {
  bool _isSelected = false;

  void _onSelected() {
    _isSelected = !_isSelected;
    widget.onSelectInterest(widget.title);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue.shade300 : Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
