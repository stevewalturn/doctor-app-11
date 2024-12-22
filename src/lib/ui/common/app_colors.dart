import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF2D5AF0);
const Color kcPrimaryColorLight = Color(0xFF5B7FF9);
const Color kcPrimaryColorDark = Color(0xFF1A3CB0);
const Color kcSecondaryColor = Color(0xFF29B6F6);
const Color kcAccentColor = Color(0xFF00BFA5);

const Color kcBackgroundColor = Color(0xFFF8F9FA);
const Color kcSurfaceColor = Colors.white;

const Color kcTextColor = Color(0xFF1A1B1E);
const Color kcTextColorLight = Color(0xFF6C757D);

const Color kcErrorColor = Color(0xFFDC3545);
const Color kcSuccessColor = Color(0xFF28A745);
const Color kcWarningColor = Color(0xFFFFC107);
const Color kcInfoColor = Color(0xFF17A2B8);

const Color kcDividerColor = Color(0xFFE9ECEF);
const Color kcDisabledColor = Color(0xFFADB5BD);

// Gradients
const LinearGradient kcPrimaryGradient = LinearGradient(
  colors: [kcPrimaryColor, kcPrimaryColorLight],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient kcSecondaryGradient = LinearGradient(
  colors: [kcSecondaryColor, kcAccentColor],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
