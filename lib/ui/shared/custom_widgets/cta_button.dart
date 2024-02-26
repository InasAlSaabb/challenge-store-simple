import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

enum ButtonTypeEnum {
  PROFILE,
  NORMAL,
  SMALL,
  CUSTOM,
}

class CtaButton extends StatelessWidget {
  final ButtonTypeEnum? buttonTypeEnum;

  final String title;
  final Function onTap;
  final double? textSize;
  final bool? isDisabled;
  final bool? isBusy;
  final Color? borderColor;
  final Color? fillColor;
  final Color? disableColor;
  final double? borderThickness;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final VisualDensity? visualDensity;
  final FontWeight? textWeight;
  final String? startSvgPath;
  final String? centerSvgPath;
  final Color? centerSvgColor;
  final bool? stadiumShape;
  final double? width;
  final double? height;
  final bool titleInCaps;
  final bool enableOverflow;

  const CtaButton({
    Key? key,
    this.buttonTypeEnum,
    this.centerSvgColor,
    this.margin,
    this.centerSvgPath,
    this.visualDensity,
    this.textWeight,
    required this.title,
    required this.onTap,
    this.startSvgPath,
    this.textSize,
    this.isDisabled = false,
    this.isBusy = false,
    this.borderColor,
    this.fillColor,
    this.borderThickness = 1,
    this.padding,
    this.textColor,
    this.disableColor,
    this.stadiumShape = false,
    this.width,
    this.height,
    this.titleInCaps = true,
    this.enableOverflow = false,
  }) : super(key: key);

  Map<String, dynamic> chooseButtonType(BuildContext context) {
    switch (buttonTypeEnum!) {
      case ButtonTypeEnum.NORMAL:
        return {
          "width": screenWidth(1.25),
          "height": screenHieght(13),
          "fillColor": AppColors.maingrey,
          "textColor": AppColors.mainWhiteColor,
          "borderColor": borderColor,
          "textSize": screenWidth(21),
          // "textSize": screenHeightPercent(32),
          "textWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.SMALL:
        return {
          "width": screenWidth(1.2),
          "height": screenHieght(12),
          "fillColor": AppColors.mainRedColor,
          "textColor": AppColors.mainWhiteColor,
          "borderColor": borderColor,
          "textSize": screenWidth(21),
          "textWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.PROFILE:
        return {
          "width": screenWidth(1.25),
          "height": screenHieght(13),
          "fillColor": AppColors.mainWhiteColor.withOpacity(0.93),
          "textColor": AppColors.mainlightgrey,
          "borderColor": AppColors.mainbluecolor.withOpacity(0.52),
          "textSize": screenWidth(21),
          "textWeight": FontWeight.bold,
        };
      case ButtonTypeEnum.CUSTOM:
        return {
          "width": width,
          "height": height,
          "fillColor": fillColor,
          "textColor": textColor,
          "borderColor": borderColor,
          "textSize": textSize,
          "textWeight": textWeight,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: chooseButtonType(context)["width"] ?? width ?? screenWidth(1.2),
      height: chooseButtonType(context)["height"] ?? height ?? screenHieght(12),
      child: Padding(
        padding: margin ?? EdgeInsets.all(0),
        child: Opacity(
          opacity: isDisabled! ? 0.5 : 1,
          child: Material(
            color: AppColors.transparentColor,
            elevation: 16,
            shadowColor: AppColors.mainback.withOpacity(0.2),
            child: Opacity(
              opacity: isBusy! ? 0.5 : 1,
              child: ElevatedButton(
                  //    visualDensity: visualDensity,
                  onPressed: isBusy! || isDisabled!
                      ? () {}
                      : () {
                          onTap();
                        },
                  style: ElevatedButton.styleFrom(
                    visualDensity: visualDensity,
                    backgroundColor:
                        chooseButtonType(context)["fillColor"] ?? fillColor,
                    shape: stadiumShape!
                        ? StadiumBorder()
                        : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                width: borderThickness!,
                                color: isDisabled!
                                    ? disableColor ?? AppColors.mainGrey
                                    : borderColor ?? fillColor!),
                          ),
                    padding: padding ?? EdgeInsets.symmetric(vertical: 0),
                    disabledBackgroundColor: disableColor ?? AppColors.mainGrey,
                    side: stadiumShape!
                        ? BorderSide(
                            width: borderThickness!,
                            color: isDisabled!
                                ? disableColor ?? AppColors.mainGrey
                                : borderColor ?? fillColor!,
                          )
                        : null,
                  ),

                  // splashColor: fillColor,
                  // disabledColor: disableColor ?? AppColors.grey200Color,
                  //

                  //     borderRadius: BorderRadius.circular(size.shortestSide / 24)),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (centerSvgPath != null)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: SvgPicture.asset(
                                centerSvgPath ?? '',
                                color: centerSvgColor,
                                width: size.width / 14,
                              ),
                            ),
                          SizedBox(
                            width: enableOverflow ? screenWidth(1.75) : null,
                            child: Text(
                              buttonTypeEnum == ButtonTypeEnum.NORMAL &&
                                      titleInCaps == false
                                  ? title
                                  : buttonTypeEnum == ButtonTypeEnum.PROFILE &&
                                          titleInCaps == false
                                      ? title
                                      : buttonTypeEnum ==
                                                  ButtonTypeEnum.CUSTOM &&
                                              titleInCaps == false
                                          ? title
                                          : title.toUpperCase(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              // overflow:
                              //     enableOverflow ? TextOverflow.ellipsis : null,
                              style: TextStyle(
                                fontWeight:
                                    chooseButtonType(context)["textWeight"] ??
                                        textWeight ??
                                        FontWeight.w400,
                                fontSize:
                                    chooseButtonType(context)["textSize"] ??
                                        textSize ??
                                        size.width / 25,
                                color: chooseButtonType(context)['textColor'] ??
                                    textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (startSvgPath != null)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width / 24),
                          child: SvgPicture.asset(
                            startSvgPath ?? '',
                            width: size.height / 14,
                          ),
                        ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
