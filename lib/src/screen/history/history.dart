import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/src/config/colors.dart';
import 'package:weather/src/config/text_style.dart';
import 'package:weather/src/constant/theme_color.dart';
import 'package:weather/src/model/model.dart';
import 'package:weather/src/model/model_variable.dart';
import 'package:weather/src/services/currnent_location.dart';
import 'package:weather/src/widget/comman_widget/image_view.dart';


class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  
  DateTime _dateTime = DateTime.now();
  String? date;
  Timer? t;

  String load = "0";

  @override
  void dispose() {
    t!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: Get.size.height * 0.02,
            ),

            // date button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Card(
                elevation: 5,
                color: ThemeColors.cardColor(),
                child: InkWell(
                  onTap: () {
                    show();
                  },
                  child: Container(
                    width: Get.size.width,
                    padding: EdgeInsets.all(20),
                    child: Text('Tap to Select Date',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular16.copyWith(color: ThemeColors.primaryTextColor()),
                    ),
                  ),
                ),
              )
            ),

            SizedBox(
              height: Get.size.height * 0.09,
            ),

            // data
            load == "0"
            ? SizedBox()
            : load == "1"
              ? CircularProgressIndicator()
              : Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('EEEE dd-MM-yyyy').format(DateTime.parse(ModelVariable.history['forecast']['forecastday'][0]['date'])),
                        style: AppTextStyle.regular16.copyWith(color: ThemeColors.primaryTextColor(),fontWeight: FontWeight.normal),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "https://" + ModelVariable.history['forecast']['forecastday'][0]['day']['condition']['icon'].toString().split('//')[1],
                                  errorWidget: (context, url, error) => Text('W'),
                                  height: Get.size.height * 0.08,
                                  fit: BoxFit.fill,
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: Text(ModelVariable.history['forecast']['forecastday'][0]['day']['condition']['text'],
                                    style: AppTextStyle.regular18.copyWith(color: ThemeColors.primaryTextColor()),
                                    maxLines: 2,
                                  ),
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
                            Text((ModelVariable.history['forecast']['forecastday'][0]['day']['mintemp_c']).toString()+"°C",
                              style: AppTextStyle.regular18.copyWith(color: ThemeColors.primaryTextColor()),
                            ),

                            SizedBox(width: 10),

                            Icon(Icons.arrow_downward_outlined,color: ThemeColors.primaryTextColor(),),
                            Text((ModelVariable.history['forecast']['forecastday'][0]['day']['maxtemp_c']).toString()+"°C",
                              style: AppTextStyle.regular18.copyWith(color: ThemeColors.secondaryTextColor()),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),

                      // sun and moon
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

                              Text(ModelVariable.history['forecast']['forecastday'][0]['astro']['sunrise'],
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

                              Text(ModelVariable.history['forecast']['forecastday'][0]['astro']['sunset'],
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

                              Text(ModelVariable.history['forecast']['forecastday'][0]['astro']['moonrise'],
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

                              Text(ModelVariable.history['forecast']['forecastday'][0]['astro']['moonset'],
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
                          itemCount: ModelVariable.history['forecast']['forecastday'][0]['hour'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int i) {
                            return Card(
                              borderOnForeground: true,
                              margin: EdgeInsets.only(left: i == 0 ? 15 : 0, right: 15),
                              color: ThemeColors.cardColor(),
                              child: Container(
                                width: Get.size.width * 0.4,
                                padding: EdgeInsets.symmetric(vertical: 13),
                                child: Column(
                                  children: [
                                    Text(DateFormat('hh : mm').format(DateTime.parse(ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['time'])),
                                      style: AppTextStyle.regular14.copyWith(color: ThemeColors.primaryTextColor()),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),

                                    imageView(
                                      imageURL: "https://" + ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['condition']['icon'].toString().split('//')[1], 
                                      shape: BoxShape.rectangle,
                                      title: "Weather", 
                                      isLocalImage: false,
                                      backgroundColor: Colors.transparent
                                    ),

                                    SizedBox(height: 10),

                                    Text(ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['condition']['text'],
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
                                            child: Text(ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['wind_kph'].toString() + "\nK/H",
                                              style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                            )
                                          )
                                        ),

                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['vis_km'].toString() + "\nKM",
                                              style: AppTextStyle.regular11.copyWith(fontWeight: FontWeight.normal,color: ThemeColors.primaryTextColor()),
                                            )
                                          )
                                        ),

                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(ModelVariable.history['forecast']['forecastday'][0]['hour'][i]['humidity'].toString() + " %",
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
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  show () {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              initialDateTime: _dateTime,
              maximumYear: DateTime.now().year,
              maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime){
                setState(() {
                  _dateTime = dateTime;
                });
              },
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Done',
            style: AppTextStyle.regular16,
          ),
          onPressed: () async {
            date = _dateTime.year.toString() + "-" + _dateTime.month.toString() + "-" + _dateTime.day.toString();
            print(date);
            Navigator.pop(context);
            setState(() {
              load = "1";
            });
            ModelVariable.history = await getHistoryData(date: date, city: place.locality);
            t = Timer.periodic(Duration(seconds: 1), (timer) {
              if(ModelVariable.history != null) {
                setState(() {
                  load = "2";
                });
                timer.cancel();
              }
            });
          },
        ),
      ),
    );
                  
  }
}

