import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/config/colors.dart';
import 'package:weather/src/config/text_style.dart';
import 'package:weather/src/constant/theme_color.dart';
import 'package:weather/src/model/model_variable.dart';
import 'package:weather/src/widget/comman_widget/image_view.dart';

class Forecast extends StatefulWidget {
  Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: ModelVariable.data['forecast']['forecastday'].length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 15, top: index == 0 ? 15 : 0),
            child: Card(
              elevation: 5,
              color: ThemeColors.cardColor(),
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  iconColor: ThemeColors.secondaryTextColor()
                ),
                header: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('EEEE dd-MM-yyyy').format(DateTime.parse(ModelVariable.data['forecast']['forecastday'][index]['date'])),
                        style: AppTextStyle.regular16.copyWith(color: ThemeColors.primaryTextColor(),fontWeight: FontWeight.normal),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "https://" + ModelVariable.data['forecast']['forecastday'][index]['day']['condition']['icon'].toString().split('//')[1],
                                  errorWidget: (context, url, error) => Text('W'),
                                  height: Get.size.height * 0.08,
                                  fit: BoxFit.fill,
                                ),

                                Text(ModelVariable.data['forecast']['forecastday'][index]['day']['condition']['text'],
                                  style: AppTextStyle.regular18.copyWith(color: ThemeColors.primaryTextColor()),
                                )
                              ],
                            )
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            
                            Icon(Icons.arrow_upward_outlined,color: ThemeColors.primaryTextColor(),),
                            Text((ModelVariable.data['forecast']['forecastday'][index]['day']['mintemp_c']).toString()+"°C",
                              style: AppTextStyle.regular18.copyWith(color: ThemeColors.primaryTextColor()),
                            ),

                            SizedBox(width: 10),

                            Icon(Icons.arrow_downward_outlined,color: ThemeColors.primaryTextColor(),),
                            Text((ModelVariable.data['forecast']['forecastday'][index]['day']['maxtemp_c']).toString()+"°C",
                              style: AppTextStyle.regular18.copyWith(color: ThemeColors.secondaryTextColor()),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),
                    ],
                  ),
                ),
                collapsed: Container(), 
                expanded: Column(
                  children: [
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

                            Text(ModelVariable.data['forecast']['forecastday'][index]['astro']['sunrise'],
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

                            Text(ModelVariable.data['forecast']['forecastday'][index]['astro']['sunset'],
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

                            Text(ModelVariable.data['forecast']['forecastday'][index]['astro']['moonrise'],
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

                            Text(ModelVariable.data['forecast']['forecastday'][index]['astro']['moonset'],
                              style: TextStyle(
                                color: ThemeColors.primaryTextColor()
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Container(
                      height: Get.size.height * 0.25,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 7),
                        itemCount: ModelVariable.data['forecast']['forecastday'][index]['hour'].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          return Card(
                            borderOnForeground: true,
                            margin: EdgeInsets.only(left: i == 0 ? 15 : 0, right: 15),
                            color: ThemeColors.secondCardColor(),
                            child: Container(
                              width: Get.size.width * 0.4,
                              padding: EdgeInsets.symmetric(vertical: 13),
                              child: Column(
                                children: [
                                  Text(DateFormat('hh : mm').format(DateTime.parse(ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['time'])),
                                    style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  imageView(
                                    imageURL: "https://" + ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['condition']['icon'].toString().split('//')[1], 
                                    shape: BoxShape.rectangle,
                                    title: "Weather", 
                                    isLocalImage: false,
                                    backgroundColor: Colors.transparent
                                  ),

                                  SizedBox(height: 10),

                                  Text(ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['condition']['text'],
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
                                          child: Text(ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['wind_kph'].toString() + "\nK/H",
                                            style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                          )
                                        )
                                      ),

                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['vis_km'].toString() + "\nKM",
                                            style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                          )
                                        )
                                      ),

                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(ModelVariable.data['forecast']['forecastday'][index]['hour'][i]['humidity'].toString() + " %",
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


