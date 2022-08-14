import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:weather/src/widget/comman_widget/image_view.dart';
import '/src/config/colors.dart';
import '/src/config/text_style.dart';
import '/src/constant/constant.dart';
import '/src/constant/theme_color.dart';
import '/src/model/model_variable.dart';
import 'package:intl/intl.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String temp = ModelVariable.data['current']['temp_c'].toString();
  String feren = ModelVariable.data['current']['temp_f'].toString();
  static const IconData wind_power_outlined = IconData(0xf072a, fontFamily: 'MaterialIcons');  


  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: ThemeColors.backgroundColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Get.size.width * 0.05,top: Get.size.height * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // tempreture
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Text(
                          isC
                          ? temp
                          : feren,
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

                  SizedBox(
                    height: 10,
                  ),
                
                  // c and f button
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tap to change',style: AppTextStyle.regular11.copyWith(color: Colors.grey.shade500,)),

                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isC = true;
                                });
                              },
                              child: Card(
                                elevation: 4,
                                margin: EdgeInsets.all(0),
                                color: ThemeColors.cardColor(),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('°C',
                                    style: AppTextStyle.regular16.copyWith(color: ThemeColors.primaryTextColor()),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  isC = false;
                                });
                              },
                              child: Card(
                                elevation: 4,
                                margin: EdgeInsets.all(0),
                                color: ThemeColors.cardColor(),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('°F',
                                    style: AppTextStyle.regular16.copyWith(color: ThemeColors.primaryTextColor()),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),

                  // weather
                  Row(
                    children: [
                      Image.network("https://" + ModelVariable.data['current']['condition']['icon'].toString().split('//')[1],
                        height: Get.size.height * 0.06,
                      ),

                      SizedBox(width: 10),

                      Text(ModelVariable.data['current']['condition']['text'],
                        style: AppTextStyle.regular15.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                      )
                    ],
                  ),
                ],
              ),
            )
          ),

          // astronot
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('assets/icon/sunrise.png',
                    color: ThemeColors.primaryTextColor(),
                    height: Get.size.height * 0.04,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(ModelVariable.data['forecast']['forecastday'][0]['astro']['sunrise'],
                    style: TextStyle(
                      color: ThemeColors.primaryTextColor()
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Image.asset('assets/icon/sunset.png',
                    color: ThemeColors.primaryTextColor(),
                    height: Get.size.height * 0.04,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(ModelVariable.data['forecast']['forecastday'][0]['astro']['sunset'],
                    style: TextStyle(
                      color: ThemeColors.primaryTextColor()
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Image.asset('assets/icon/moonrise.png',
                    color: ThemeColors.primaryTextColor(),
                    height: Get.size.height * 0.03,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(ModelVariable.data['forecast']['forecastday'][0]['astro']['moonrise'],
                    style: TextStyle(
                      color: ThemeColors.primaryTextColor()
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Image.asset('assets/icon/moonset.png',
                    color: ThemeColors.primaryTextColor(),
                    height: Get.size.height * 0.03,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(ModelVariable.data['forecast']['forecastday'][0]['astro']['moonset'],
                    style: TextStyle(
                      color: ThemeColors.primaryTextColor()
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: Get.size.height * 0.03,
          ),

          // wind visibility humidity
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: ThemeColors.cardColor(),
            elevation: 4,
            child: Container(
              height: Get.size.height * 0.1,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: Get.size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Wind',
                            style: AppTextStyle.regular15.copyWith(color: ThemeColors.primaryTextColor()),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Visibility',
                            style: AppTextStyle.regular15.copyWith(color: ThemeColors.primaryTextColor()),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Humidity',
                            style: AppTextStyle.regular15.copyWith(color: ThemeColors.primaryTextColor()),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(ModelVariable.data['current']['wind_kph'].toString() + " K/H",
                            style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                          )
                        )
                      ),

                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(ModelVariable.data['current']['vis_km'].toString() + " KM",
                            style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                          )
                        )
                      ),

                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(ModelVariable.data['current']['humidity'].toString() + " %",
                            style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                          )
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: Get.size.height * 0.02,
          ),

          // hourly temprature
          Container(
            height: Get.size.height * 0.25,
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 7),
              itemCount: ModelVariable.data['forecast']['forecastday'][0]['hour'].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
                    color: ThemeColors.cardColor(),
                  child: Container(
                    width: Get.size.width * 0.4,
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Column(
                      children: [
                        Text(DateFormat('hh : mm').format(DateTime.parse(ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['time'])),
                          style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        imageView(
                          imageURL: "https://" + ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['condition']['icon'].toString().split('//')[1], 
                          shape: BoxShape.rectangle,
                          title: "Weather", 
                          isLocalImage: false,
                          backgroundColor: Colors.transparent
                        ),

                        SizedBox(height: 10),

                        Text(ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['condition']['text'],
                          style: AppTextStyle.regular12.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Icon(FontAwesomeIcons.wind,
                                size: Get.size.height * 0.025,
                                color: ThemeColors.primaryTextColor()
                              )
                            ),

                            Expanded(
                              child: Icon(Icons.visibility_outlined,
                                size: Get.size.height * 0.025,
                                color: ThemeColors.primaryTextColor()
                              )
                            ),

                            Expanded(
                              child: Icon(FontAwesomeIcons.droplet,
                                size: Get.size.height * 0.025,
                                color: ThemeColors.primaryTextColor()
                              )
                            )
                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['wind_kph'].toString() + "\nK/H",
                                  style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                )
                              )
                            ),

                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['vis_km'].toString() + "\nKM",
                                  style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                )
                              )
                            ),

                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(ModelVariable.data['forecast']['forecastday'][0]['hour'][index]['humidity'].toString() + " %",
                                  style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                )
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: Get.size.height * 0.02,
          ),

          // last update
          Container(
            alignment: Alignment.center,
            child: Text('Last Updated : ${DateFormat('dd-MM-yyyy – hh:mm').format(DateTime.parse(ModelVariable.data['current']['last_updated']))}',
              style: AppTextStyle.regular13.copyWith(color: ThemeColors.primaryTextColor()),
            ),
          ),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}

