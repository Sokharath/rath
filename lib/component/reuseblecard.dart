import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:one_auth_testing/component/constanst.dart';

class Reuseblecard extends StatelessWidget {
  const Reuseblecard({
    super.key,
    required this.nameText,
    required this.timeText,
    required this.viewTime,
    required this.favoriteTime,
    required this.image,
  });
  final String nameText;
  final String timeText;
  final String viewTime;
  final String favoriteTime;
  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 65.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.h, left: 25.w, right: 20.w),
            child: CircleAvatar(radius: 25.h, backgroundImage: image),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(nameText, style: kTextStyle),
              ),
              Text(
                timeText,
                style: ltextStykle,
              ),
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 15.h),
            child: Icon(
              Icons.tag_faces,
              color: Colors.grey,
              size: 20.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 15.h),
            child: Text(
              viewTime,
              style: ltextStykle,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 15.h),
            child: Icon(
              Icons.favorite_border,
              color: Colors.grey,
              size: 20.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 15.h),
            child: Text(
              favoriteTime,
              style: ltextStykle,
            ),
          ),
        ],
      ),
    );
  }
}
