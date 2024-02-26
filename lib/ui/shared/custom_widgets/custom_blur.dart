import 'package:challenge_2/ui/shared/custom_widgets/csutom_blur_widget.dart';
import 'package:flutter/material.dart';

enum CustomBlurChildType {
  BOTTOMSHEET,
  DRAWER,
  DIALOUG,
}

class CustomPopupWithBlurWidget extends StatelessWidget {
  const CustomPopupWithBlurWidget({
    super.key,
    required this.child,
    required this.customBlurChildType,
  });
  final CustomBlurChildType customBlurChildType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CustomBlurWidget(),
        ),
        if (customBlurChildType == CustomBlurChildType.BOTTOMSHEET) ...[
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: child,
          )
          // PositionedDirectional(
          //   bottom: 0,
          //   start: 0,
          //   end: 0,
          //   child: child,
          // )
        ],
        if (customBlurChildType == CustomBlurChildType.DRAWER) ...[
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            child: child,
          ),
        ],
        if (customBlurChildType == CustomBlurChildType.DIALOUG) ...[
          Center(child: child),
        ],
      ],
    );
  }
}
