import 'disaster_type.dart';

/// 避難所（指定緊急避難場所）1か所分のデータ。
class Shelter {
  const Shelter({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.supportedTypes,
  });

  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  /// この避難所が対応している災害の種類
  final Set<DisasterType> supportedTypes;

  /// [type] の災害のときに、ここへ避難してよいか
  bool supports(DisasterType type) => supportedTypes.contains(type);
}
