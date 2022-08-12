import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/src/config/text_style.dart';
import 'package:weather/src/constant/theme.dart';
import 'package:weather/src/constant/theme_color.dart';
import 'package:weather/src/model/model_variable.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isC = true;
  String temp = ModelVariable.data['current']['temp_c'].toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeColors.backgroundColor(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30,top: Get.size.height * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),
                            child: Text(temp,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                height: 0.9,
                                color: ThemeColors.primaryTextColor(),
                                fontSize: Get.size.height * 0.09
                              ),
                            ),
                          ),
                          Text(
                            isC
                            ? '°C'
                            : '°F',
                            style: AppTextStyle.regularBold20.copyWith(color: ThemeColors.primaryTextColor(),),
                          ),
                        ],
                      ),
                    
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isC = true;
                                });
                              },
                              child: Text('°C'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),

              Container(
                height: Get.size.height * 0.3,
                // color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

