# Beacon — notes for Claude

Offline disaster-evacuation app for a school team competition (Team BBC, Kobe). Flutter, Android first.
Core idea: pick the shelter that is approved for **this** disaster type (GSI 指定緊急避難場所 data has 8 types), then guide the user there by voice, with no signal.

## Team & roles
- Leader / backend: Anas (repo owner). Sub-leader: Kairi.
- Frontend: Kairi, Hiroto. UI/UX: Hinata, Rohit, Kairi. Research/data: Hiroto, Mitsuki. Presenter: Mitsuki.
- Teammates are Japanese: write README, UI text and code comments in Japanese. Talk to Anas in English.

## Schedule
- 12/11, 12/14 中間報告会 — live demo on a real phone, no slides
- 1/7–1/13 リハーサル (5 min talk + demo) → 1/22, 1/25 学年発表会 (5 min) → 1/26 展示会 (students try it and vote) → 2/4 デジタルワークス

## Version 1 scope (decided by team vote)
Must by 12/11: map, voice guidance, offline guidance, hazard-type shelter switching, push/voice alerts, auto-launch on emergency, demo simulation mode.
After midterm: buried-under-rubble alarm, large text/furigana, "I'm safe" to family, multilingual, supplies checklist.
Out: multiple routes, map hazard simulation, mode toggle, disaster learning, first aid, open-store display.

## Code
- `lib/services/shelter_finder.dart` — core logic (filter by type, sort by haversine distance). Tested in `test/`.
- `lib/data/sample_shelters.dart` — fake data + fixed demo location (三宮). To be replaced by real GSI data in SQLite and GPS.
- `lib/screens/` home (simulation buttons) → emergency (dark theme, shelter list) → navigation (map/route/TTS are placeholders).
- `TODO(フロントエンド)` / `TODO(バックエンド)` mark the next work.
- Planned packages: maplibre_gl (offline map), geolocator, flutter_tts, sqflite. Offline map: download the area around the user on first location permission.

## Build notes
- Android/iOS platform folders come from `flutter create --org jp.bbc --project-name beacon --platforms android,ios .` (package name must stay `beacon`).
- Android build needs NDK 28.2.13676358 installed via Android Studio SDK Manager (Show Package Details); Gradle's auto-download fails.
- Work on branches + Pull Requests; don't push straight to main.
