import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_valorant/utils/app_theme.dart';

import '../models/player.dart';

class CardPlayer extends StatelessWidget {
  const CardPlayer({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 24,
        top: 32,
        bottom: 12,
      ),
      margin: const EdgeInsets.only(left: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppTheme.colorBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Agent',
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.colorTitle),
          ),
          const SizedBox(height: 33),
          FadeInDown(
            from: 50,
            duration: const Duration(milliseconds: 1200),
            child: Text(
              player.name,
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: AppTheme.colorRed,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Played ${player.hoursPlayed}H ${player.minutesPlayed}M',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.colorTitle,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppTheme.colorDivider,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Win Ratio',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.colorTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FadeInDown(
                    from: 50,
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      '${player.winRatio.toStringAsFixed(2)}%',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.colorWhite),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'K/D Ratio',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.colorTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FadeInDown(
                    from: 50,
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      player.winKd.toStringAsFixed(2),
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.colorWhite),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dmg/Round',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.colorTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FadeInDown(
                    from: 50,
                    duration: const Duration(milliseconds: 1200),
                    child: Text(
                      player.dmgRound.toStringAsFixed(1),
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.colorWhite),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppTheme.colorDivider,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ability Kills/Match',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colorTitle,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'icons/ic_raze_c.svg',
                        width: 32,
                        height: 32,
                        color: AppTheme.colorTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '2.34',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'icons/ic_raze_q.svg',
                        width: 32,
                        height: 32,
                        color: AppTheme.colorTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '1.34',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'icons/ic_raze_e.svg',
                        width: 32,
                        height: 32,
                        color: AppTheme.colorTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '3.54',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'icons/ic_raze_x.svg',
                        width: 32,
                        height: 32,
                        color: AppTheme.colorTitle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '16.02',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
