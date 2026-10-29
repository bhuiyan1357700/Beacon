# Beacon（ビーコン）

電波がなくても、**災害の種類に合った避難所**まで音声で案内する避難ナビアプリ。
チーム BBC（Beneficial Bit Computing）

---

## はじめての人：動かし方

> 先にグループで共有した「Flutter開発環境セットアップガイド」を終わらせておいてください（`flutter doctor` で Flutter と Android toolchain に ✓ が付いていればOK）。

```bash
git clone https://github.com/bhuiyan1357700/Beacon.git
cd Beacon
flutter pub get
flutter run
```

テストの実行：

```bash
flutter test
```

---

## いま動くもの

- ホーム画面の「デモ用シミュレーション」で災害を選ぶ
- 緊急モード画面に切り替わり、**その災害に対応した避難所だけ**を近い順に表示
- 避難所をタップすると道案内画面（地図・ルート・音声はこれから）

※ 避難所は今は仮データ（`lib/data/sample_shelters.dart`）。現在地も三宮駅付近で固定。

---

## フォルダ構成と担当

```
lib/
├── main.dart                     アプリの入口
├── models/
│   ├── disaster_type.dart        災害の種類（国土地理院データの8種類）
│   └── shelter.dart              避難所1か所分のデータ
├── services/
│   └── shelter_finder.dart       災害の種類で避難所を選び、近い順に並べる（中心機能）
├── data/
│   └── sample_shelters.dart      開発用の仮データ → 本物のデータに置き換える
├── screens/
│   ├── home_screen.dart          ホーム（地図＋シミュレーション）
│   ├── emergency_screen.dart     緊急モード（避難所リスト）
│   └── navigation_screen.dart    道案内（地図・ルート・音声）
└── theme/
    └── app_theme.dart            色・文字（通常モード／緊急モード）
test/                             テスト
```

| 場所 | 担当 |
| --- | --- |
| `screens/` | フロントエンド（かいり、ひろと） |
| `theme/` とデザイン | UI/UX（ひなた、ロヒット、かいり） |
| `services/`、`data/`、オフライン地図・ルート計算 | バックエンド（アナス） |
| 避難所データ・ハザードマップの準備 | リサーチ（ひろと、みつき） |

コードの中の `TODO(フロントエンド)` などが、次にやることの目印です。

---

## チームのルール

1. **`main` に直接pushしない。** 作業ごとにブランチを作る
   ```bash
   git switch -c feature/作業内容   # 例：feature/map
   ```
2. 終わったら GitHub で **Pull Request** を作り、誰か1人に見てもらってから `main` に入れる
3. 作業を始める前に必ず最新にする
   ```bash
   git switch main
   git pull
   ```
4. コミットメッセージは何をしたか分かるように（例：「避難所リストに距離を表示」）
5. 困ったらグループに**エラーのスクショ**を貼る
