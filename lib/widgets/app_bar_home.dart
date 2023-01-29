import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    super.key,
    this.height = 80,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Row(
            children: [
              Image.asset(
                'images/img_user.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                'icons/ic_valorant_mini.svg',
                width: 22,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Text(
                'KreKaH',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  SvgPicture.asset(
                    'icons/ic_notify.svg',
                    width: 17,
                    height: 20,
                    color: Colors.white,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xffFF4657),
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
