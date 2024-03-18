import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineIndigo90019 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.indigo90019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillLightblue50 => BoxDecoration(
        color: ColorConstant.lightBlue50,
      );
  static BoxDecoration get outlineIndigo903 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigo903,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
  static BoxDecoration get outline => BoxDecoration();
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get txtFillIndigo903 => BoxDecoration(
        color: ColorConstant.indigo903,
      );
  static BoxDecoration get fillIndigoA100 => BoxDecoration(
        color: ColorConstant.indigoA100,
      );
  static BoxDecoration get fillCyan50 => BoxDecoration(
        color: ColorConstant.cyan50,
      );
  static BoxDecoration get gradientLightblue40066Blue5066 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.2553191530279182,
            0.8936169729910354,
          ),
          end: Alignment(
            0.5319149128989218,
            0.3191488925061623,
          ),
          colors: [
            ColorConstant.lightBlue40066,
            ColorConstant.blue5066,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9000c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientIndigo901Indigo902 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            1.000000018398091,
            -0.007991376147639784,
          ),
          end: Alignment(
            2.8707422883300637e-8,
            0.9058019132218895,
          ),
          colors: [
            ColorConstant.indigo901,
            ColorConstant.indigo902,
          ],
        ),
      );
  static BoxDecoration get txtFillIndigoA101 => BoxDecoration(
        color: ColorConstant.indigoA101,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius txtCircleBorder19 = BorderRadius.circular(
    getHorizontalSize(
      19.00,
    ),
  );

  static BorderRadius roundedBorder35 = BorderRadius.circular(
    getHorizontalSize(
      35.00,
    ),
  );

  static BorderRadius circleBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30.00,
    ),
  );

  static BorderRadius circleBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius circleBorder60 = BorderRadius.circular(
    getHorizontalSize(
      60.00,
    ),
  );
}
