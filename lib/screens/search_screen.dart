import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_auth_testing/component/ReusebleLargeImage.dart';
import 'package:one_auth_testing/component/ReusebleSizebox.dart';
import 'package:one_auth_testing/component/item_search.dart';
import 'package:one_auth_testing/screens/language_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.feed),
        leading: InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          const Icon(Icons.location_on),
          SizedBox(width: 15.w),
          InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguageScreen()));
                });
              },
              child: const Icon(Icons.settings)),
          SizedBox(width: 20.w),
        ],
      ),
      body: ListView.builder(
        itemCount: searchItems.length,
        itemBuilder: (context, index) {
          SearchScreenItems item = searchItems[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SizedBox(
                  height: screenHeight * 0.36,
                  width: screenWidth * 0.9,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.36,
                        width: screenWidth * 0.9,
                      ),
                      Positioned(
                        child: ReusebleLargeContainer(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          urlImage: item.largeImage,
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(170),
                        bottom: ScreenUtil().setHeight(0),
                        child: ReusebleSizeBox(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          nameText: item.nameText,
                          viewTime: item.viewTime,
                          timeText: item.timeText,
                          image: NetworkImage(item.smallImage),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
