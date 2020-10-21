import 'package:flutter/material.dart';

class ScreenSize{

    BuildContext context;
    Size size;
    List<double> hSize;
    List<double> wSize;

    ScreenSize(this.context){
      size = MediaQuery.of(context).size;
      hSize = [
        null,
        size.height * 0.1,
        size.height * 0.2,
        size.height * 0.3,
        size.height * 0.4,
        size.height * 0.5,
        size.height * 0.6,
        size.height * 0.7,
        size.height * 0.8,
        size.height * 0.9
      ];
      wSize = [
        null,
        size.width * 0.1,
        size.width * 0.2,
        size.width * 0.3,
        size.width * 0.4,
        size.width * 0.5,
        size.width * 0.6,
        size.width * 0.7,
        size.width * 0.8,
        size.width * 0.9
      ];
    }

    double unikueHight(double y) => size.height * y;

    double unikueWidth(double x) => size.height * x;

}