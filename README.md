# PokeCon-Installer

[Poke-Controller MODIFIED]()のWindows向けインストーラ

- 1ファイルで完結、1クリックで仮想環境の構築まで実行
- Git不要
- pyランチャーを使用し、他バージョンのPythonをインストール済みでも干渉しない
- PokeCon自体はフォルダ内で完結するので、複数箇所にインストール可能

## Requirement

- 普通に更新されているWindows
  - `winget`, `py`
  - PowerShell: `Invoke-WebRequest`, `Expand-Archive`

## Download

[Right click here to download...](./PokeCon-Installer.bat)

上記リンクを右クリックし、「名前を付けてリンクを保存」から適当なフォルダにダウンロードしてください。

## Usage

適当なフォルダを作成し、`PokeCon-Installer.bat`を配置します。

```
sample
`-- PokeCon-Installer.bat
```

`PokeCon-Installer.bat`を実行し、管理者権限を与えると、以下を自動的に実行します。

1. Pythonのダウンロードとインストール
2. Poke-Controller MODIFIEDのダウンロード
3. Poke-Controller MODIFIEDの環境構築
4. 起動用バッチファイルの作成

```
sample
|-- Poke-Controller-Modified
|-- Poke-Controller-Modified.bat
`-- PokeCon-Installer.bat
```

なお、生成される起動用バッチファイル`Poke-Controller-Modified.bat`は`Poke-Controller-Modified`フォルダを絶対パスで参照するため、バッチファイル自体はどこに移動しても構いませんが、インストールしたフォルダ（例では`sample`）を移動することはできません。
