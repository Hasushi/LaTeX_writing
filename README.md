# LaTeX Writing Environment

Docker を利用した LaTeX 執筆環境です。
`TikZ` や `pgfplots` を含むパッケージがプリインストールされた、最新の TeX Live 環境を使用して PDF をビルドできます。

## セットアップ

はじめに、Docker イメージをビルドする必要があります。

```bash
make build-image
```

## 使用方法

`src/` ディレクトリ配下にあるプロジェクトを指定して PDF をコンパイルします。

```bash
make build-pdf PROJECT=project_1
```

生成された PDF は、該当するプロジェクトのディレクトリ（例: `src/project_1/main.pdf`）に出力されます。

### クリーンアップ

中間ファイルと生成された PDF を削除するには、以下のコマンドを実行します。

```bash
make clean PROJECT=project_1
```

## ディレクトリ構造

- `Dockerfile`: TeX Live 環境を定義する Docker 設定
- `makefile`: ビルドおよび管理用コマンド
- `src/`: LaTeX ソースファイルを配置するディレクトリ
    - `project_1/`: 個別のプロジェクトディレクトリ
        - `main.tex`: メインの TeX ファイル
