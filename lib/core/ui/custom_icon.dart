import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const CustomIcon(this.assetName, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final fileExtension = assetName.split('.').last.toLowerCase();

    return SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: _buildImage(fileExtension),
    );
  }

  Widget _buildImage(String fileExtension) {
    if (fileExtension == 'svg') {
      return SvgPicture.asset(
        assetName,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      );
    } else if (['png', 'jpg', 'jpeg'].contains(fileExtension)) {
      return Image.asset(
        assetName,
        width: size ?? 24,
        height: size ?? 24,
        color: color,
        colorBlendMode: color != null ? BlendMode.srcIn : null,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
