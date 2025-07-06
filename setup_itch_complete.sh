#!/bin/bash

# ゲーム名
GAME_NAME="dragon_pythonic_quest"
PROJECT_DIR="${GAME_NAME}_itch_release"

echo "🎮 ドラゴンPythonicクエスト - itch.io完全自動セットアップ"
echo "=================================================="

# プロジェクトディレクトリ作成
echo "📁 ディレクトリ構造を作成中..."
mkdir -p "${PROJECT_DIR}"
mkdir -p "${PROJECT_DIR}/assets/images"
mkdir -p "${PROJECT_DIR}/assets/audio"

# 元のHTMLファイルが存在するか確認
if [ ! -f "dragon_pythonic_quest_perfect.html" ]; then
    echo "❌ エラー: dragon_pythonic_quest_perfect.html が見つかりません"
    echo "このスクリプトと同じディレクトリに配置してください"
    exit 1
fi

# 音声ファイルのダウンロード
echo "🎵 音声ファイルをダウンロード中..."
declare -A audio_files=(
    ["bgmCastle.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/fbb2bdd4-c87a-49d9-a051-f78616b9567b.mp3"
    ["bgmField.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/0088f21f-c57d-4676-968f-440cd6160b7e.mp3"
    ["bgmBattle.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/bc225d10-7226-4656-aee6-201cdd976312.mp3"
    ["bgmVictory.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/83456f78-a30f-4a5d-ab05-07f9d391a114.mp3"
    ["bgmDungeon.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/0cbfbef7-124d-48bc-9f31-5f0cd70cfdc0.mp3"
    ["bgmFinalBoss.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/b8a2c1fa-2339-4d46-8293-f2f6d5bdb7f7.mp3"
    ["bgmGameOver.mp3"]="https://cdn1.genspark.ai/user-upload-image/3/026930d9-7323-427d-97e6-6a13cf5fbcfe.mp3"
)

for filename in "${!audio_files[@]}"; do
    url="${audio_files[$filename]}"
    echo "  ⬇️  ${filename} をダウンロード中..."
    curl -L -o "${PROJECT_DIR}/assets/audio/${filename}" "${url}"
done

# 画像ファイルのダウンロード
echo "🖼️  画像ファイルをダウンロード中..."
declare -A image_files=(
    ["monster_01_fire_dragon.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/a6530ef9-fa65-4d19-8c32-ca3db1eafa8b"
    ["monster_02_water_spirit.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/7bb67bc0-9071-4d34-80bc-77143642a49c"
    ["monster_03_earth_golem.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/11d81f71-1abd-48b1-a7d0-27aff2b71340"
    ["monster_04_wind_gargoyle.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/f0b94a99-bd7f-4d09-9e29-18ab434db048"
    ["monster_05_light_angel.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/ead61a85-7ccd-49c4-a7be-417b59842f3a"
    ["monster_06_dark_demon.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/4e9494fe-09ac-461c-9446-6743f745c31d"
    ["monster_07_thunder_elemental.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/e0bdd65c-930c-44fd-a144-4a3a86d23b9e"
    ["monster_08_poison_plant.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/1875688c-42fc-4a20-a520-02ca24aa5e47"
    ["monster_09_ice_slime.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/f742ee7d-1d9c-4076-aa55-00247de09085"
    ["monster_10_robot.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/46b60d8b-6ea6-4a1b-8836-a4f172d8c350"
    ["monster_11_fire_dragon_advanced.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/7b6b232c-5750-486c-86b8-1d9947904043"
    ["monster_12_water_spirit_advanced.png"]="https://cdn1.genspark.ai/user-upload-image/22_generated/f120aae7-bb9f-414c-821c-9790dd786554"
)

for filename in "${!image_files[@]}"; do
    url="${image_files[$filename]}"
    echo "  ⬇️  ${filename} をダウンロード中..."
    curl -L -o "${PROJECT_DIR}/assets/images/${filename}" "${url}"
done

# HTMLファイルをコピーして修正
echo "📝 HTMLファイルを処理中..."
cp "dragon_pythonic_quest_perfect.html" "${PROJECT_DIR}/index.html"

# 音声ファイルのURLを置換
echo "🔧 音声ファイルのパスを更新中..."
for filename in "${!audio_files[@]}"; do
    url="${audio_files[$filename]}"
    # sedでURLをローカルパスに置換
    sed -i.bak "s|${url}|assets/audio/${filename}|g" "${PROJECT_DIR}/index.html"
done

# 画像ファイルのURLを置換
echo "🔧 画像ファイルのパスを更新中..."
# JavaScriptコード内の画像URLを対応するローカルファイルに置換
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/a6530ef9-fa65-4d19-8c32-ca3db1eafa8b|assets/images/monster_01_fire_dragon.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/7bb67bc0-9071-4d34-80bc-77143642a49c|assets/images/monster_02_water_spirit.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/11d81f71-1abd-48b1-a7d0-27aff2b71340|assets/images/monster_03_earth_golem.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/f0b94a99-bd7f-4d09-9e29-18ab434db048|assets/images/monster_04_wind_gargoyle.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/ead61a85-7ccd-49c4-a7be-417b59842f3a|assets/images/monster_05_light_angel.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/4e9494fe-09ac-461c-9446-6743f745c31d|assets/images/monster_06_dark_demon.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/e0bdd65c-930c-44fd-a144-4a3a86d23b9e|assets/images/monster_07_thunder_elemental.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/1875688c-42fc-4a20-a520-02ca24aa5e47|assets/images/monster_08_poison_plant.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/f742ee7d-1d9c-4076-aa55-00247de09085|assets/images/monster_09_ice_slime.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/46b60d8b-6ea6-4a1b-8836-a4f172d8c350|assets/images/monster_10_robot.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/7b6b232c-5750-486c-86b8-1d9947904043|assets/images/monster_11_fire_dragon_advanced.png|g" "${PROJECT_DIR}/index.html"
sed -i.bak "s|https://cdn1.genspark.ai/user-upload-image/22_generated/f120aae7-bb9f-414c-821c-9790dd786554|assets/images/monster_12_water_spirit_advanced.png|g" "${PROJECT_DIR}/index.html"

# バックアップファイルを削除
rm "${PROJECT_DIR}/index.html.bak"

# manifest.jsonを作成
echo "📋 manifest.jsonを作成中..."
cat > "${PROJECT_DIR}/manifest.json" << 'EOF'
{
    "name": "ドラゴンPythonicクエスト：プログラマーの大冒険",
    "short_name": "DragonPythonicQuest",
    "description": "プログラミング学習とRPGが融合した革新的な教育ゲーム",
    "version": "1.0.0",
    "orientation": "landscape",
    "display": "fullscreen",
    "start_url": "index.html"
}
EOF

# README.mdを作成
echo "📖 README.mdを作成中..."
cat > "${PROJECT_DIR}/README.md" << 'EOF'
# Dragon Pythonic Quest

An educational RPG game for learning Python OOP concepts.

## Play Instructions
1. Open index.html in your web browser
2. Use WASD keys to move
3. Touch monsters to start battles
4. Answer programming questions to win!

## Educational Content
Learn 12 essential Python OOP concepts through gameplay.
EOF

# ZIPファイル作成
echo "📦 ZIPファイルを作成中..."
cd "${PROJECT_DIR}"
zip -r "../${GAME_NAME}_itch_v1.0.0.zip" . -x "*.DS_Store"
cd ..

echo ""
echo "✅ 完了！"
echo "=================================================="
echo "📦 作成されたZIPファイル: ${GAME_NAME}_itch_v1.0.0.zip"
echo ""
echo "📝 itch.ioへのアップロード手順:"
echo "1. itch.ioにログイン"
echo "2. 'Upload new project'をクリック"
echo "3. ${GAME_NAME}_itch_v1.0.0.zip をアップロード"
echo "4. 'This file will be played in the browser'にチェック"
echo "5. Embed options で index.html を指定"
echo ""
echo "🎮 成功を祈っています！"