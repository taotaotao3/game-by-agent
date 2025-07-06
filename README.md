# 🎮 Dragon Pythonic Quest - Educational Python OOP Game

プログラミング学習とRPGが融合した革新的な教育ゲーム！Pythonのオブジェクト指向プログラミングを楽しく学習できます。

![Game Title](https://img.shields.io/badge/Genre-Educational%20RPG-blue)
![Python](https://img.shields.io/badge/Learn-Python%20OOP-green)
![Platform](https://img.shields.io/badge/Platform-HTML5-orange)
![Language](https://img.shields.io/badge/Language-Japanese-red)

## 🌟 概要

古代プログラミング王国を舞台に、12体の邪悪なモンスターを倒しながら、Pythonのオブジェクト指向プログラミングを学習できる教育RPGゲームです。各モンスターは異なるプログラミング概念を表しており、クイズに正解することで倒すことができます。

## 🎯 学習内容

1. クラスとオブジェクト
2. 継承とsuper()
3. カプセル化と@property
4. ポリモーフィズム
5. モジュールとimport
6. 特殊メソッド
7. @staticmethod/@classmethod
8. 例外処理
9. イテレーター
10. デコレーター
11. シングルトンパターン
12. ファクトリーパターン

## 🎮 プレイ方法

- **WASD**キーで勇者を移動
- モンスターに触れると戦闘開始
- プログラミングクイズに正解してモンスターを倒す
- 全12体のモンスターを倒して王国を救おう！

## 🚀 Windows 11 + WSLでの環境構築とitch.io公開手順

### 前提条件

- Windows 11
- WSL2がインストール済み（Ubuntu推奨）

### ステップ

```powershell
# PowerShellを管理者権限で実行
wsl --install

# Ubuntuをインストール（既にWSLがある場合はスキップ）
wsl --install -d Ubuntu-22.04

git clone repo
chmod +x -sh
./-sh
Upload that zip to itch.io

