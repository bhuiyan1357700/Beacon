import 'package:flutter/material.dart';

/// 災害の種類。
///
/// 国土地理院「指定緊急避難場所データ」の8つの災害種別に合わせている。
/// 避難所ごとに「どの災害に対応しているか」がこの8種類で決まっている。
enum DisasterType {
  flood('洪水', Icons.water, Color(0xFF1E6FD9)),
  landslide('土砂災害', Icons.landslide, Color(0xFF8D5524)),
  stormSurge('高潮', Icons.waves, Color(0xFF0E8C9B)),
  earthquake('地震', Icons.vibration, Color(0xFFE0661B)),
  tsunami('津波', Icons.tsunami, Color(0xFF1F4E9E)),
  fire('大規模な火事', Icons.local_fire_department, Color(0xFFD32F2F)),
  inlandFlood('内水氾濫', Icons.water_drop, Color(0xFF3D8BD9)),
  volcano('火山現象', Icons.volcano, Color(0xFF6D4C41));

  const DisasterType(this.label, this.icon, this.color);

  /// 画面に表示する日本語名
  final String label;

  /// アイコン
  final IconData icon;

  /// 緊急モードで使う、この災害のテーマカラー
  final Color color;
}
