import 'package:beacon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ホーム画面が表示され、地震のシミュレーションで緊急画面に切り替わる',
      (tester) async {
    await tester.pumpWidget(const BeaconApp());
    expect(find.text('Beacon'), findsOneWidget);

    await tester.tap(find.widgetWithText(ActionChip, '地震'));
    await tester.pumpAndSettle();

    expect(find.text('地震の警報'), findsOneWidget);
    expect(find.text('地震に対応した近くの避難所'), findsOneWidget);
  });
}
