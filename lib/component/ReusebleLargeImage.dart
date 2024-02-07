import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_auth_testing/component/constanst.dart';

class ReusebleLargeContainer extends StatelessWidget {
  const ReusebleLargeContainer(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.urlImage});

  final double screenHeight;
  final double screenWidth;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.30,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: kRadius,
          topRight: kRadius,
        ),
        boxShadow: [
          kBoxShadow,
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: urlImage,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: const ColorFilter.mode(
              //   Colors.red,
              //   BlendMode.colorBurn,
              // ),
            ),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
