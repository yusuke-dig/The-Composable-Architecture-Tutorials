# The Composable Architecture Tutorials

[The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture) の公式チュートリアルを進めるための学習用リポジトリです。

## チュートリアルサイト

https://swiftpackageindex.com/pointfreeco/swift-composable-architecture/main/tutorials/composablearchitecture/01-01-yourfirstfeature

## 概要

Point-Free が提供する TCA の公式チュートリアルに沿って、Swift / SwiftUI アプリ開発における状態管理のパターンを学びます。

## 学習内容

### Chapter 1: Your First Feature

- `@Reducer` マクロを使った Feature の定義
- `@ObservableState` による状態の観測
- `State` / `Action` / `Reducer` の基本構造
- カウンターアプリの実装

## プロジェクト構成

```
The-Composable-Architecture-Tutorials/
├── The-Composable-Architecture-Tutorials/
│   ├── The_Composable_Architecture_TutorialsApp.swift  # アプリエントリーポイント
│   ├── ContentView.swift                               # メイン View
│   └── CounterFeature.swift                           # カウンター Feature (TCA)
└── READEME.md
```

## 実装済みの内容

### CounterFeature

`@Reducer` マクロで定義したシンプルなカウンター Feature。

```swift
@Reducer
struct CounterFeature {
    @ObservableState
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}
```

## 環境

| 項目 | バージョン |
|------|-----------|
| Xcode | 16.0+ |
| Swift | 6.0+ |
| iOS | 17.0+ |
| TCA | 1.x |

## 参考リンク

- [TCA GitHub](https://github.com/pointfreeco/swift-composable-architecture)
- [TCA ドキュメント](https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/)
- [Point-Free](https://www.pointfree.co/)
