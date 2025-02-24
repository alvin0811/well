import 'dart:io';

import 'package:flutter/services.dart';
import 'package:well_path/corewidgets/global_keys.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';

const uploadToS3Channel = MethodChannel('app.wellPath.channel/imageuploading');

const uploadToS3Events = EventChannel('event/uploadS3');

const uploadToS3MethodName = 'uploadS3';

const minImageSizeInBytes = 20000;

const maxImageSizeInBytes = 8000000;

const minFileSize = 1024;

const uploadType = 'IMAGE';

int imageQuality = (Platform.isIOS) ? 20 : 50;

ColorCode? getColorCode(int value) {
  switch (value) {
    case 1:
      return ColorCode(textColor: "0xff15D282", backGroundColor: "0xffCAFFE9");
    case 2:
      return ColorCode(textColor: "0xffc3e600", backGroundColor: "0xffF7FFC9");
    case 3:
      return ColorCode(textColor: "0xffF63E16", backGroundColor: "0xffFFE3C9");
    case 4:
      return ColorCode(textColor: "0xffe60000", backGroundColor: "0xffFFC9C9");
    case 5:
      return ColorCode(textColor: "0xff008ee6", backGroundColor: "0xffC9EAFF");
    default:
      return ColorCode(textColor: "0xffF63E16", backGroundColor: "0xffC9EAFF");
  }
}


double kgToLb(double kilograms) {
  const double kgToLbConversionFactor = 2.20462;
  double pounds = kilograms * kgToLbConversionFactor;
  return double.parse(pounds.toStringAsFixed(1));
}

void navigateToNotification() {
  navigatorKey.currentState?.pushNamed("noti");
}