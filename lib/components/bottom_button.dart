import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.title, required this.onTap});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
