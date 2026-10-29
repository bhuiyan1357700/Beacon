import 'package:flutter/material.dart';

/// アプリの見た目。
///
/// - 通常モード：明るく落ち着いた画面
/// - 緊急モード：暗い背景・大きい文字・ボタンは少なく
///
/// 担当：UI/UX（色・フォントはここだけで変える）
class AppTheme {
  AppTheme._();

  static const navy = Color(0xFF22355A);

  static ThemeData get normal => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        scaffoldBackgroundColor: const Color(0xFFF3F5F8),
      );

  static ThemeData get emergency => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0E1218),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      );
}
