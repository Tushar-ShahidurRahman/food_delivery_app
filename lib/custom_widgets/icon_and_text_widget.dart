import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  // final bool? filled;

  IconAndTextWidget(
      {Key? key, required this.icon, required this.text, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(icon, color: iconColor, ),
          SizedBox(width: 4),
          SmallText(text: text),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
