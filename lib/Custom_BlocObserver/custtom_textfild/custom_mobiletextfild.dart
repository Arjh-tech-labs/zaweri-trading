import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mobiletextfild {
  static Widget textField(labletext, focuscolor, preicon, lablecolor, iconcolor,
      textcolor, bordercolor) {
    return ScreenUtilInit(
        builder:  (_,child)
        {
          return Container(
            height: 65.h,
            width: 300.w,
            child: TextField(
              style: TextStyle(color: textcolor),
              onChanged: (value) {
                print(value);
              },
              keyboardType: TextInputType.number,
              maxLength: 10,
              // obscureText: hidePassword, //show/hide password
              decoration: InputDecoration(
                label: Text(labletext),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                prefixIcon: Icon(preicon, color: iconcolor),
                labelStyle: TextStyle(color: lablecolor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bordercolor, width: 1),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focuscolor, width: 1),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ),
          );
        }

    );
  }
}