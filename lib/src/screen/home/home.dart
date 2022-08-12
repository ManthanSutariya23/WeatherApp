import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.secondaryGreyColor.shade300,
                                ),
                                child: Text('°C',
                                  style: AppTextStyle.regular16,
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
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.secondaryGreyColor.shade300,
                                ),
                                child: Text('°F',
                                  style: AppTextStyle.regular16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                
                  
                ],
              ),
            )
          ),

          Container(
            height: Get.size.height * 0.3,
          ),

          Container(
            alignment: Alignment.center,
            child: Text('Last Updated : ${DateFormat('dd-MM-yyyy – hh:mm').format(DateTime.parse(ModelVariable.data['current']['last_updated']))}',
              style: AppTextStyle.regular13.copyWith(color: ThemeColors.primaryTextColor()),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

