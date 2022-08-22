import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:weather/src/config/colors.dart';
import 'package:weather/src/config/text_style.dart';
import 'package:weather/src/constant/theme.dart';
import 'package:weather/src/constant/theme_color.dart';
import 'package:weather/src/model/model.dart';
import 'package:weather/src/model/model_variable.dart';
import 'package:weather/src/screen/forcaste/forecast.dart';
import 'package:weather/src/screen/history/history.dart';
import 'package:weather/src/screen/home/home.dart';
import 'package:weather/src/screen/location/chnage_location.dart';
import 'package:weather/src/services/currnent_location.dart';
import 'package:weather/src/widget/bottombar_design/sliding_clipped.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int selectedIndex = 0;
  PageController? _pageController;
  Timer? time;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    check();
  }

  bool _check = true;

  check() async {
    await getCurrentPosition();
    time = Timer.periodic(Duration(seconds: 1), (t) async {
      if(place.locality != null) {
        ModelVariable.data =  await getData(city: place.locality);
        setState(() {
          _check = false;
        });
        t.cancel();
      }
    });

    if(!mounted) return;
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    if(_check)
    {
      return Scaffold(
        backgroundColor: ThemeColors.backgroundColor(),
        body: Container(
          width: Get.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.cardColor(),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50,),

              Icon(Icons.location_pin,color: ThemeColors.primaryTextColor(),size: 22,),

              Text(place.locality.toString(),style: AppTextStyle.regularBold20.copyWith(color: ThemeColors.primaryTextColor()),),
            ],
          ),
          actions: [
            
            InkWell(
              onTap: () {
                setState(() {
                  ThemeColors.switchTheme(!Darktheme.theme);
                });
              },
              child: Icon(
                Darktheme.theme
                ? Icons.wb_sunny
                : Icons.mode_night,
                color: ThemeColors.secondaryTextColor(),),
            ),

            SizedBox(
              width: 20,
            ),

            InkWell(
              onTap: () async {
                ModelVariable.data = null;
                setState(() {
                  _check = true;
                });
                ModelVariable.data =  await getData(city: place.locality);
                selectedIndex = 0;
                setState(() {
                  _check = false;
                });

                if(!mounted) return;
              },
              child: Icon(
                Icons.refresh,
                color: ThemeColors.secondaryTextColor(),),
            ),

            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => selectedIndex = index);
          },
          children: [
            HomePage(),
            Forecast(),
            History(),
            ChangeLocation()
          ],
        ),
        bottomNavigationBar: SlidingClippedNavBar(
            backgroundColor: ThemeColors.bottomBackgroundColor()!,
            onButtonPressed: (index) {
              setState(() {
                _onItemTapped(index);
              });
            },
            activeColor: ThemeColors.primaryTextColor(),
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(
                icon: Icons.home,
                title: 'Home',
                iconSize: 21,
              ),
              BarItem(
                icon: Icons.calendar_today_outlined,
                title: 'Forcast',
                iconSize: 20,
              ),
              BarItem(
                icon: Icons.history,
                title: 'History',
                iconSize: 25,
              ),
              BarItem(
                icon: Icons.location_on_outlined,
                title: 'Chnage Location',
                iconSize: 25,
              ),
            ],
          ),
      );
    
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController!.animateToPage(index, duration: Duration(milliseconds: 800), curve: Curves.easeOut);
    });
  }
}