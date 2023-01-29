import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.mediaQuerySize,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final Size mediaQuerySize;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: mediaQuerySize.height < 900
              ? mediaQuerySize.height * 0.011
              : mediaQuerySize.height * 0.014,
          right: mediaQuerySize.height < 900
              ? mediaQuerySize.height * 0.011
              : mediaQuerySize.height * 0.014,
          child: Center(
            child: SizedBox(
              width: mediaQuerySize.width,
              height: 48,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  backgroundColor: const Color(0xffFF4657),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/line_top.svg',
              width: mediaQuerySize.width * 0.79,
            ),
            SizedBox(
                height: mediaQuerySize.height < 900
                    ? mediaQuerySize.height * 0.030
                    : mediaQuerySize.height * 0.010),
            SvgPicture.asset(
              'images/line_bottom.svg',
              width: mediaQuerySize.width * 0.79,
            ),
          ],
        ),
      ],
    );
  }
}
