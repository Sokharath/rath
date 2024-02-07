import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_auth_testing/component/constanst.dart';

class ReusebleSizeBox extends StatelessWidget {
  const ReusebleSizeBox(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.image,
      required this.nameText,
      required this.viewTime,
      required this.timeText});

  final double screenHeight;
  final double screenWidth;
  final NetworkImage image;
  final String nameText;
  final String timeText;
  final String viewTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.18,
      width: screenWidth * 0.9,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Container(
              height: 110.h,
              width: 50.w,
              decoration: BoxDecoration(
                  borderRadius: kBorDerRadius,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image,
                  ),
                  boxShadow: [kBoxShadow]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 34.5.dg, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameText,
                  style: kTextStyle,
                ),
                Text(
                  timeText,
                  style: ltextStykle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w, top: 40.h),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 20.w,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  viewTime,
                  style: ltextStykle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
