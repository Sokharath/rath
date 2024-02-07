import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_auth_testing/component/constanst.dart';
import 'package:one_auth_testing/component/image_text.dart';
import 'package:one_auth_testing/component/reuseblecard.dart';
import 'package:one_auth_testing/screens/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.feed),
        leading: const Icon(Icons.menu),
        actions: [
          const Icon(Icons.favorite_border),
          SizedBox(width: 15.w),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              });
            },
            child: const Icon(Icons.search),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.16,
                              width: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          Text(AppLocalizations.of(context)!.addnew)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 110.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          itemBuilder: (context, index) {
                            SocialMediaStory story = stories[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(story.image),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    story.imageName,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: kBorDerRadius,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://backstage.officialcharts.com/sites/default/files/legacy_images/media/658010/21-savage-press-1100.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              const Reuseblecard(
                nameText: '21 Savage',
                timeText: '4 minutes ago',
                viewTime: '25.2k',
                favoriteTime: '920',
                image: NetworkImage(
                  'https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/21-savage_hpjccv/21-savage-call-me-revenge.jpg',
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < containerImage.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: kBorDerRadius,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(containerImage[i]),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Reuseblecard(
                nameText: 'Drake',
                timeText: '9 seconds ago',
                viewTime: '42.1k',
                favoriteTime: '1.3k',
                image: NetworkImage(
                  'https://static01.nyt.com/images/2021/12/08/arts/06drake2/06drake2-mediumSquareAt3X.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
