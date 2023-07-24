import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/app_column_with_stars.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  double _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      _currPageValue = pageController.page!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.mainPageViewContainer,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //  dot indicator should go here
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(Dimensions.width8),
            activeSize: Size(Dimensions.height16, Dimensions.width8),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius4)),
          ),
        ),
        //  Popular text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width8),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(text: '.', color: Colors.black54),
              ),
              SizedBox(width: Dimensions.width8),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        // LIST VIEW BUILDER started from here.
        SizedBox(height: Dimensions.height16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width24,
                right: Dimensions.width16,
                bottom: Dimensions.height8,
              ),
              child: Row(
                children: [
                  // I will show product image here.
                  Container(
                    height: Dimensions.listViewImgSize,
                    width: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/food0.png'),
                        )),
                  ),
                  //  Then i will show a column here...
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContainerSize,
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width8, right: Dimensions.width8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: 'Nutritious fruit meal in china'),
                            SizedBox(height: Dimensions.height4),
                            SmallText(text: 'With chinese characteristics'),
                            SizedBox(height: Dimensions.height4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle,
                                    iconColor: AppColors.iconColor1,
                                    text: 'Normal'),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    iconColor: AppColors.mainColor,
                                    text: '1.7 km'),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: Dimensions.width8),
                                  child: IconAndTextWidget(
                                      icon: Icons.access_time_sharp,
                                      iconColor: AppColors.iconColor2,
                                      text: '32 min'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    // This is the code for positioning the slides and there scale
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height.floor() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height.floor() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = height.floor() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      var currTrans = height.floor() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width4, right: Dimensions.width4),
            // padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: const DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: 300,
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width32,
                right: Dimensions.width32,
                bottom: Dimensions.height32,
                top: Dimensions.height8,
              ),
              // padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 3.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.5,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.5,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height16,
                      horizontal: Dimensions.width16),
                  child:
                      const AppColumnWithStars(text: 'Bitter Orange Marinade'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
