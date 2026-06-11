import 'package:flutter/material.dart';

// ==============================================
// ALU CONNECT — constants.dart
// Central source of truth for all design tokens.
// Every color, font size, radius, and spacing
// value lives here so the whole app stays consistent.
// ==============================================

class AppColors {
  AppColors._();

  // Primary palette
  static const Color primary        = Color(0xFF1B5E3B); // deep 
forest green
  static const Color primaryLight   = Color(0xFF2E7D52); // medium 
green
  static const Color primarySurface = Color(0xFFE8F5EE); // very 
light green tint

  // Secondary palette
  static const Color secondary      = Color(0xFFF5A623); // warm 
amber
  static const Color secondaryLight = Color(0xFFFFF3DC); // pale 
gold tint

  // Accent
  static const Color accent         = Color(0xFFBF4E30); // 
terracotta
  static const Color accentLight    = Color(0xFFFAEDE9); // pale 
rust tint

  // Neutrals
  static const Color background     = Color(0xFFF9FAFB);
  static const Color surface        = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF2F4F7);
  static const Color textPrimary    = Color(0xFF111827);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color textHint       = Color(0xFF9CA3AF);
  static const Color divider        = Color(0xFFE5E7EB);

  // Semantic
  static const Color success        = Color(0xFF16A34A);
  static const Color error          = Color(0xFFDC2626);
  static const Color warning        = Color(0xFFF59E0B);
  static const Color info           = Color(0xFF2563EB);

  // Category tag colors
  static const Color tagHackathon   = Color(0xFF7C3AED);
  static const Color tagWorkshop    = Color(0xFF0891B2);
  static const Color tagLeadership  = Color(0xFF1B5E3B);
  static const Color tagStartup     = Color(0xFFF5A623);
  static const Color tagCommunity   = Color(0xFFBF4E30);
  static const Color tagInternship  = Color(0xFF0F766E);
}

class AppFonts {
  AppFonts._();
  static const String heading = 'Fraunces';
  static const String body    = 'DM Sans';
}

class AppSpacing {
  AppSpacing._();
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;
}

class AppRadius {
  AppRadius._();
  static const double sm   = 8.0;
  static const double md   = 12.0;
  static const double lg   = 16.0;
  static const double xl   = 24.0;
  static const double full = 999.0;
}

const Map<String, Color> kCategoryColors = {
  'Hackathon'  : AppColors.tagHackathon,
  'Workshop'   : AppColors.tagWorkshop,
  'Leadership' : AppColors.tagLeadership,
  'Startup'    : AppColors.tagStartup,
  'Community'  : AppColors.tagCommunity,
  'Internship' : AppColors.tagInternship,
};
