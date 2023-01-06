import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xffFF8B38);
Color titleColor = const Color(0xff303733);
Color subTitleColor = const Color(0xff7D8FAB);
Color greyColor = const Color(0xffE8ECF2);
Color orangeColor = const Color(0xffFA662E);

TextStyle titleColorTextstyle = GoogleFonts.poppins(
  color: titleColor,
  fontSize: 14,
  fontWeight: regular,
);
TextStyle subTitleColorTextstyle = GoogleFonts.poppins(
  color: subTitleColor,
  fontSize: 14,
  fontWeight: regular,
);
TextStyle orangeColorTextstyle = GoogleFonts.poppins(
  color: orangeColor,
  fontSize: 14,
  fontWeight: regular,
);

TextStyle primTextstyle = GoogleFonts.poppins(
  fontSize: 14,
  color: orangeColor,
  fontWeight: regular,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

double defaultMargin = 30;
