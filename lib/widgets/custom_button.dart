import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll10:
        return getPadding(
          all: 10,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillIndigoA100:
        return ColorConstant.indigoA100;
      case ButtonVariant.FillRed500:
        return ColorConstant.red500;
      case ButtonVariant.FillDeeporangeA700:
        return ColorConstant.deepOrangeA700;
      case ButtonVariant.GradientIndigo901Indigo902:
      case ButtonVariant.GradientIndigo906Indigo900:
      case ButtonVariant.GradientIndigo907Indigo905:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder13:
        return BorderRadius.circular(
          getHorizontalSize(
            13.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.GradientIndigo906Indigo900:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            ColorConstant.indigo906,
            ColorConstant.indigo900,
          ],
        );
      case ButtonVariant.GradientIndigo907Indigo905:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            ColorConstant.indigo907,
            ColorConstant.indigo905,
          ],
        );
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.FillRed500:
      case ButtonVariant.FillDeeporangeA700:
        return null;
      default:
        return LinearGradient(
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
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.UrbanistSemiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder24,
  RoundedBorder13,
}

enum ButtonPadding {
  PaddingAll18,
  PaddingAll10,
}

enum ButtonVariant {
  GradientIndigo901Indigo902,
  FillIndigoA100,
  FillRed500,
  FillDeeporangeA700,
  GradientIndigo906Indigo900,
  GradientIndigo907Indigo905,
}

enum ButtonFontStyle {
  UrbanistRomanBold16,
  UrbanistSemiBold12,
}
