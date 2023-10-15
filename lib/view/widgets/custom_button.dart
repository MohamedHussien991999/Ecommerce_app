import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;
    final Color textColor;


  final Function onPress;

  const CustomButton({
    super.key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 50),
        elevation: 5,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: textColor,
      ),
    );
  }
}
