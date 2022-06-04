import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final nav = GoogleFonts.poppins();
  static final tipSpotlight = GoogleFonts.poppins();
  static final title = GoogleFonts.poppins(
    fontSize: 32,
  );
  static final titleBold = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final titleLogo = GoogleFonts.cabin(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final body = GoogleFonts.poppins(
    fontSize: 16,
  );
  static final small = GoogleFonts.poppins(
    fontSize: 13,
  );
}
