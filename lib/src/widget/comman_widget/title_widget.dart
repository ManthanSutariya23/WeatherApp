
import 'package:flutter/material.dart';
import '../../config/colors.dart';
import '../../config/text_style.dart';

Widget titleHeading ({
  @required String? title,
  bool isViewall = false,
  Function()? viewallOntap,
  double? leftPadding,
  double? rightPadding,
}) {
  return Container(
    padding: EdgeInsets.only(left: leftPadding ?? 15,right: rightPadding ?? 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,
              style: AppTextStyle.regular14.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            Row(
              children: [

                Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.appGreenColor,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),

                SizedBox(width: 5),

                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: AppColors.appGreenColor,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),

                SizedBox(width: 5),

                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: AppColors.appGreenColor,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ],
            ),
          ],
        ),

        isViewall 
        ? InkWell(
          onTap: viewallOntap,
          child: Text('View all',
            style: AppTextStyle.regular14.copyWith(fontWeight: FontWeight.bold,fontSize: 13),
          ),
        )
        : SizedBox(),
      ],
    ),
  );
}

