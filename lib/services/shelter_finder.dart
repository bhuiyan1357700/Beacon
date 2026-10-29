import 'dart:math' as math;

import '../models/disaster_type.dart';
import '../models/shelter.dart';

/// 避難所と、現在地からの距離（メートル）のセット
class ShelterMatch {
  const ShelterMatch(this.shelter, this.distanceMeters);

  final Shelter shelter;
  final double distanceMeters;
}

/// このアプリの中心機能：
/// 「災害の種類」に対応している避難所だけを選び、近い順に並べる。
///
/// 例：地震で安全な避難所でも、津波には対応していないことがある。
/// その場合、津波のときはその避難所を候補から外す。
class ShelterFinder {
  const ShelterFinder(this.shelters);

  final List<Shelter> shelters;

  /// [type] に対応している避難所を、([latitude], [longitude]) から近い順に最大 [limit] 件返す。
  List<ShelterMatch> nearestFor(
    DisasterType type,
    double latitude,
    double longitude, {
    int limit = 3,
  }) {
    final matches = shelters
        .where((s) => s.supports(type))
        .map((s) => ShelterMatch(
              s,
              distanceMeters(latitude, longitude, s.latitude, s.longitude),
            ))
        .toList()
      ..sort((a, b) => a.distanceMeters.compareTo(b.distanceMeters));
    return matches.take(limit).toList();
  }

  /// 2地点間の直線距離（メートル）。ハバーサイン公式。
  /// ※ 実際に歩く距離ではない。歩く距離はルート計算で出す。
  static double distanceMeters(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    const earthRadius = 6371000.0;
    final dLat = _toRadians(lat2 - lat1);
    final dLng = _toRadians(lng2 - lng1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLng / 2) *
            math.sin(dLng / 2);
    return 2 * earthRadius * math.asin(math.sqrt(a));
  }

  static double _toRadians(double degrees) => degrees * math.pi / 180;
}

/// 距離を「350m」「1.2km」の形にする
String formatDistance(double meters) {
  if (meters < 1000) return '${meters.round()}m';
  return '${(meters / 1000).toStringAsFixed(1)}km';
}
