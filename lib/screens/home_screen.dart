import 'package:flutter/material.dart';

import '../models/disaster_type.dart';
import 'emergency_screen.dart';

/// ホーム画面（通常モード）。
///
/// TODO(フロントエンド)：ここにオフライン地図（MapLibre）を表示する。
/// 今は「デモ用シミュレーション」のボタンだけ置いてある。
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _startSimulation(BuildContext context, DisasterType type) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => EmergencyScreen(disasterType: type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Beacon')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 220,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('ここに地図が入ります'),
          ),
          const SizedBox(height: 24),
          Text('デモ用シミュレーション', style: textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            '災害を選ぶと、警報が来たときの画面になります。',
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final type in DisasterType.values)
                ActionChip(
                  avatar: Icon(type.icon, color: type.color),
                  label: Text(type.label),
                  onPressed: () => _startSimulation(context, type),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
