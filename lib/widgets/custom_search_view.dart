import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

import '../ui/lock_page/controller/four_controller.dart';
import '../ui/lock_page/models/four_model.dart';

class CustomSearchView extends StatefulWidget {
  CustomSearchView(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints});

  SearchViewShape? shape;
  SearchViewPadding? padding;

  SearchViewVariant? variant;

  SearchViewFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  @override
  State<CustomSearchView> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView> {
  LockPageController lockPageController =
      Get.put(LockPageController());

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildSearchViewWidget(),
          )
        : _buildSearchViewWidget();
  }

  _buildSearchViewWidget() {
    return Container(
      width: getHorizontalSize(widget.width ?? 0),
      margin: widget.margin,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: widget.prefix,
      prefixIconConstraints: widget.prefixConstraints,
      suffixIcon: widget.suffix,
      suffixIconConstraints: widget.suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (widget.fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.gray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (widget.shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (widget.variant) {
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (widget.variant) {
      default:
        return ColorConstant.gray101;
    }
  }

  _setFilled() {
    switch (widget.variant) {
      case SearchViewVariant.FillGray101:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (widget.padding) {
      default:
        return getPadding(
          all: 19,
        );
    }
  }
}

enum SearchViewShape {
  RoundedBorder12,
}

enum SearchViewPadding {
  PaddingAll19,
}

enum SearchViewVariant {
  FillGray101,
}

enum SearchViewFontStyle {
  UrbanistRegular14,
}
