import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/resto_data.dart';
import '../model/resto_model.dart';
import '../widget/banner_widget.dart';
import '../widget/main_screen_widget.dart';

class MenuGfgScreen extends StatelessWidget {
  const MenuGfgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _horizontalPadding = 2.5;
    return Column(
      children: [
        // Green background with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            color: Color.fromARGB(255, 0, 136, 12), // Green background
            child: Column(
              children: [
                buildHeader(), // Header content
                SizedBox(height: 10),
                SearchBox(
                  paddingVertical: 2,
                  paddingHorizontal: 2,
                ),
                SizedBox(height: 10),
                BannerWidget(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "GoFoodGreen",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Eat for Earth!",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5)
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Chance!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Limited sale ',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 170,
                          width: 700,
                          child: GridView.count(
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 1,
                            crossAxisSpacing:
                                MediaQuery.of(context).size.width * 0.01,
                            mainAxisSpacing:
                                MediaQuery.of(context).size.width * 0.01,
                            children: restoDataList
                                .where((rec) => rec.isRecommended)
                                .toList()
                                .map((resto) {
                              return RestoCardMarkotop(
                                restoName: resto.restoName,
                                rating: resto.restoRating,
                                penilai: resto.restoJudges,
                                resto: resto,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resto Tersedia di Area Kamu',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Kami cariin yang dekat dan mantap lo!',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: restoDataList.length,
                          itemBuilder: (context, index) {
                            final RestoModel resto = restoDataList[index];
                            return UniversalContent(
                              jarakResto: resto.restoDistance,
                              rating: resto.restoRating,
                              categoryResto: resto.restoCategory.join(", "),
                              restoPlace: resto.restoLocation,
                              restoName: resto.restoName,
                              estMin: resto.estMinimum,
                              estMax: resto.estMaximum,
                              resto: resto,
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

SafeArea buildHeader() {
  var _verticalPadding = 2.5;
  var _horizontalPadding = 2.5;
  final String _alamat = "Universitas Negeri Padang";
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.only(
        top: _verticalPadding,
        left: _horizontalPadding,
        right: _horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(
          //   Icons.list_rounded,
          //   color: Colors.black45,
          //   size: 25,
          // ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Dikirim ke',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
                Text(
                  _alamat,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          // Icon(
          //   Icons.favorite_sharp,
          //   color: Colors.black45,
          //   size: 25,
          // )
        ],
      ),
    ),
  );
}
