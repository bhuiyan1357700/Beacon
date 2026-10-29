import 'package:beacon/data/sample_shelters.dart';
import 'package:beacon/models/disaster_type.dart';
import 'package:beacon/services/shelter_finder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const finder = ShelterFinder(sampleShelters);

  test('津波のときは、津波に対応していない避難所を出さない', () {
    final results =
        finder.nearestFor(DisasterType.tsunami, demoLatitude, demoLongitude);
    expect(results.map((m) => m.shelter.id), ['sample-a']);
  });

  test('地震のときは、対応している避難所を近い順に出す', () {
    final results =
        finder.nearestFor(DisasterType.earthquake, demoLatitude, demoLongitude);
    expect(results.length, 3);
    for (var i = 1; i < results.length; i++) {
      expect(
        results[i].distanceMeters,
        greaterThanOrEqualTo(results[i - 1].distanceMeters),
      );
    }
  });

  test('対応している避難所がなければ空になる', () {
    final results =
        finder.nearestFor(DisasterType.volcano, demoLatitude, demoLongitude);
    expect(results, isEmpty);
  });

  test('距離の計算（三宮駅〜神戸駅 約2.3km）', () {
    final d = ShelterFinder.distanceMeters(34.6946, 135.1955, 34.6795, 135.1781);
    expect(d, closeTo(2313, 20));
  });

  test('距離の表示', () {
    expect(formatDistance(350.4), '350m');
    expect(formatDistance(1234), '1.2km');
  });
}
