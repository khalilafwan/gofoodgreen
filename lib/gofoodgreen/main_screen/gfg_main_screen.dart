import 'package:flutter/material.dart';
import 'package:gofoodgreen/gofoodgreen/data/resto_data.dart';
import 'package:gofoodgreen/gofoodgreen/model/resto_model.dart';
import 'package:gofoodgreen/gofoodgreen/widget/main_screen_widget.dart';

import '../widget/banner_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var _verticalPadding = 2.5;
  var _horizontalPadding = 2.5;

  final String _alamat = "Universitas Negeri Padang";

  void _onTappedBottomNav(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    List<String> menuBottomNav = ['Explore', 'Pencarian', 'Favorit'];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 1) {
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              '${menuBottomNav.elementAt(index)} was clicked',
              style: TextStyle(color: Color.fromARGB(255, 61, 135, 42)),
            ),
            action: SnackBarAction(
              backgroundColor: Color.fromARGB(255, 61, 135, 42),
              textColor: Colors.white,
              label: 'Close',
              onPressed: scaffold.hideCurrentSnackBar,
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    paddingVertical: _verticalPadding,
                    paddingHorizontal: _horizontalPadding,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Eat for Earth!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // Ensures all items are shown equally
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 61, 135, 42),
        onTap: _onTappedBottomNav,
      ),
    );
  }

  SafeArea buildHeader() {
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
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                        size: 18,
                      ),
                    ],
                  ),
                  Text(
                    _alamat,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
}
