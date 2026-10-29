import 'package:flutter/material.dart';

import '../data/sample_shelters.dart';
import '../models/disaster_type.dart';
import '../services/shelter_finder.dart';
import '../theme/app_theme.dart';
import 'navigation_screen.dart';

/// 緊急モード画面。警報が来たら最初に開く。
///
/// 災害の種類に対応した避難所だけを、近い順に表示する。
class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key, required this.disasterType});

  final DisasterType disasterType;

  @override
  Widget build(BuildContext context) {
    // TODO(バックエンド)：sampleShelters を本物のデータ（SQLite）に置き換える
    // TODO(フロントエンド)：demoLatitude/demoLongitude を GPS の現在地に置き換える
    final matches = const ShelterFinder(sampleShelters)
        .nearestFor(disasterType, demoLatitude, demoLongitude);

    return Theme(
      data: AppTheme.emergency,
      child: Builder(
        builder: (context) {
          final textTheme = Theme.of(context).textTheme;
          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: disasterType.color,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(disasterType.icon, size: 40, color: Colors.white),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${disasterType.label}の警報',
                            style: textTheme.headlineLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text(
                      '${disasterType.label}に対応した近くの避難所',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: matches.isEmpty
                        ? Center(
                            child: Text(
                              '近くに対応している避難所が見つかりません',
                              style: textTheme.bodyLarge,
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: matches.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, i) {
                              final m = matches[i];
                              return Card(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16),
                                  title: Text(
                                    m.shelter.name,
                                    style: textTheme.titleLarge,
                                  ),
                                  subtitle: Text(
                                    '直線距離 ${formatDistance(m.distanceMeters)}',
                                    style: textTheme.bodyLarge,
                                  ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => NavigationScreen(
                                        match: m,
                                        disasterType: disasterType,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('シミュレーションを終了'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
