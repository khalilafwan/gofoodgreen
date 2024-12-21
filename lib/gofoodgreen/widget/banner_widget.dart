import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gofoodgreen/gofoodgreen/data/banner_data.dart';
import 'package:gofoodgreen/gofoodgreen/model/banner_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto-scroll logic
    Future.delayed(Duration.zero, () {
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_pageController.hasClients) {
          int nextPage = _currentPage + 1;
          if (nextPage >= bannerDataList.length) {
            nextPage = 0;
          }
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 175, // Banner height
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: bannerDataList.length,
            itemBuilder: (context, index) {
              final BannerModel banner = bannerDataList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      banner.bannerAssets,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          '${banner.eventName} Promo Selected!',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.red),
                        ),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: scaffold.hideCurrentSnackBar,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // Dot indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: bannerDataList.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 5,
          ),
        ),
      ],
    );
  }
}
