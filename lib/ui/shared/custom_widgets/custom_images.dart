import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImages extends StatelessWidget {
  const CustomImages({
    super.key,
    required this.imageName,
    this.imageSize,
    this.imageColor,
    this.networkImage = false,
  });

  final String imageName;
  final double? imageSize;
  final Color? imageColor;
  final bool networkImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: networkImage
          ? CachedNetworkImage(
              imageUrl: imageName,
              width: imageSize ?? screenWidth(2),
              height: imageSize,
              color: imageColor,
              fit: BoxFit.cover,
            )
          : SvgPicture.asset(
              'assets/svgs/$imageName.svg',
              width: imageSize ?? screenWidth(2),
              height: imageSize,
              color: imageColor,
            ),
    );
  }
}
