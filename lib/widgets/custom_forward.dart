import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

class CustomFroward extends StatelessWidget {
  Function onTap;

  CustomFroward(
      {this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
     
      required this.onTap});

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  Widget? icon;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

 

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        child: Text(
          hintText ?? "",
          overflow: TextOverflow.ellipsis,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      isDense: true,
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: 18,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum DropDownFontStyle {
  UrbanistSemiBold18,
}
