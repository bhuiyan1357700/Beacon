import '../models/disaster_type.dart';
import '../models/shelter.dart';

/// 開発・デモ用の仮データ（実在の避難所ではありません）。
///
/// 本物のデータ（国土地理院の指定緊急避難場所データ）を
/// SQLiteで読み込めるようになったら、このファイルは使わなくなる。
/// 担当：リサーチ（データ準備）＋ バックエンド
const sampleShelters = <Shelter>[
  Shelter(
    id: 'sample-a',
    name: 'テスト避難所A（高台の公園）',
    address: '神戸市中央区（仮）',
    latitude: 34.7010,
    longitude: 135.1925,
    supportedTypes: {
      DisasterType.earthquake,
      DisasterType.tsunami,
      DisasterType.flood,
      DisasterType.stormSurge,
      DisasterType.fire,
    },
  ),
  Shelter(
    id: 'sample-b',
    name: 'テスト避難所B（海沿いの学校）',
    address: '神戸市中央区（仮）',
    latitude: 34.6880,
    longitude: 135.1960,
    // 海に近いので、津波・高潮には使えない
    supportedTypes: {
      DisasterType.earthquake,
      DisasterType.fire,
    },
  ),
  Shelter(
    id: 'sample-c',
    name: 'テスト避難所C（体育館）',
    address: '神戸市中央区（仮）',
    latitude: 34.6950,
    longitude: 135.1880,
    supportedTypes: {
      DisasterType.earthquake,
      DisasterType.flood,
      DisasterType.inlandFlood,
      DisasterType.landslide,
    },
  ),
];

/// デモで使う現在地（三宮駅付近）。
/// 位置情報（GPS）をつないだら、本当の現在地に置き換える。
const demoLatitude = 34.6946;
const demoLongitude = 135.1955;
