import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.ImageName,
  });

  final String text;
  final String? ImageName;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ImageName != null) ...[
            SvgPicture.asset('images/$ImageName.svg'),
            // (screenWidth(2)).pw,
          ],
          SizedBox(
            width: (screenWidth(20)),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth(20),
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: borderColor != null
            ? BorderSide(
                width: 1.0,
                color: borderColor!,
              )
            : null,
        backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
        shape: StadiumBorder(),
        fixedSize: Size(
          screenWidth(2),
          screenHieght(15),
          // size.height * 0.08,
        ),
      ),
    );
  }
}
