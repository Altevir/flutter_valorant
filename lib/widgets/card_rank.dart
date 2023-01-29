import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_valorant/utils/app_theme.dart';

class CardRank extends StatefulWidget {
  const CardRank({
    super.key,
    required this.rankValue,
  });

  final int rankValue;

  @override
  State<CardRank> createState() => _CardRankState();
}

class _CardRankState extends State<CardRank> {
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 36,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        color: AppTheme.colorBackground,
      ),
      margin: const EdgeInsets.only(left: 24),
      width: mediaQuerySize.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rank',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.colorTitle,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'images/img_diamond.png',
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 4,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DIAMOND 2',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.colorDiamond,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.linear,
                        tween: Tween<double>(
                            begin: 0, end: widget.rankValue.toDouble() / 100),
                        builder: (context, value, _) {
                          return LinearProgressIndicator(
                            value: value,
                            backgroundColor: const Color(0xff1E2024),
                            color: AppTheme.colorDiamond,
                            minHeight: 4,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FittedBox(
                child: Text(
                  '${widget.rankValue}/100',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.colorTitle),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
