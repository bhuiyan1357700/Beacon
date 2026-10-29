import 'package:flutter/material.dart';

import '../models/disaster_type.dart';
import '../services/shelter_finder.dart';
import '../theme/app_theme.dart';

/// 避難所までの道案内画面。
///
/// TODO(フロントエンド)：地図にルートを表示する（本ルート＋別ルート）
/// TODO(フロントエンド)：音声案内（flutter_tts）
/// TODO(バックエンド)：オフラインでのルート計算
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
    required this.match,
    required this.disasterType,
  });

  final ShelterMatch match;
  final DisasterType disasterType;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.emergency,
      child: Builder(
        builder: (context) {
          final textTheme = Theme.of(context).textTheme;
          return Scaffold(
            appBar: AppBar(title: Text(match.shelter.name)),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: disasterType.color, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'ここにルート付きの地図が入ります',
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '直線距離 ${formatDistance(match.distanceMeters)}',
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(match.shelter.address, style: textTheme.bodyLarge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
