import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_valorant/models/match.dart';

class CardMatch extends StatelessWidget {
  const CardMatch({
    super.key,
    required this.match,
  });

  final PlayerMatch match;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff2b393f),
            Color(0xff222629),
          ],
          tileMode: TileMode.mirror,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff66BEA9),
            offset: Offset(-2, 0),
          )
        ],
      ),
      height: 84,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/thumb_raze.png',
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/img_diamond.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
              Text(
                '+23',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff51A9A5),
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'KDA',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    match.kDA,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'SCORE',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0Xff9A9A9A),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    match.score.toStringAsFixed(3),
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0Xff9A9A9A),
                    ),
                  ),
                ],
              )
            ],
          ),
          const VerticalDivider(
            width: 1,
            color: Color(0xff1F2326),
            thickness: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'VICTORY',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff51A9A5),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                match.victory,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0Xff9A9A9A),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
