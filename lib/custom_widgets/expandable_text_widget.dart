import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String lastHalf;
  final double textHeight = Dimensions.screenHeight / 5.63;
  bool isTextHidden = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      lastHalf =
          widget.text.substring(textHeight.toInt() , widget.text.length);
    } else {
      firstHalf = widget.text;
      lastHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: lastHalf.isEmpty
            ? SmallText(text: firstHalf, color: AppColors.paraColor, size: Dimensions.font16, height: 1.4,)
            : Column(
                children: [
                  isTextHidden
                      ? SmallText(text: '$firstHalf...', color: AppColors.paraColor, size: Dimensions.font16,height: 1.4,)
                      : SmallText(text: firstHalf + lastHalf, color: AppColors.paraColor, size: Dimensions.font16,height: 1.4,),
                  InkWell(
                    onTap: () {
                      isTextHidden = !isTextHidden;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        isTextHidden? SmallText(
                            text: 'Show more', color: AppColors.mainColor): SmallText(
                            text: 'Show less', color: AppColors.mainColor),
                        Icon(
                          isTextHidden
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }
}
