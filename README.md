## 概要

スマホからPCへのカメラ画像のコピー作業を半自動化する目的で作成したプログラムです。

設定ファイルで指定した入力元の画像を出力先へコピーします。(あくまで入力元と出力先に指定したディレクトリ間のコピープログラムなので、デバイスに依存しません)

また、コピーする際は出力先に存在しない画像のみを既存の画像とは別のディレクトリに保存するので、新たに撮影した画像に素早くアクセスできます。

※ 注意

このプログラムの実行後は、出力先に「過去の画像」と「最新の画像」のディレクトリが作成されます。

プログラムを実行する度に、以下の作業が行われます。

1. 「最新の画像ディレクトリ」に存在する画像は全て「過去の画像ディレクトリ」へ移動します。

2. その後、「過去の画像ディレクトリ」に存在しない入力元の画像が「最新の画像ディレクトリ」へコピーされます。


## 入力元と出力先の設定方法

#### 1. copy_image フォルダ内に.env ファイルを作成し、以下の内容を保存する

```sh
cd ~/***/copy_image
touch .env
```

```
# .env
SOURCE      = "" # 入力元となるディレクトリを表記する
DESTINATION = "" # 出力先となるディレクトリを表記する
```

#### 2. 画像のコピーに必要な「入力元」と「出力先」のパスを.env に保存する
※ 保存元と保存先は絶対パスで表記してください

例：

```
# .env
SOURCE      = "/media/alice/device/backup"
DESTINATION = "/home/alice/Pictures"
```


## 使い方

### 実行方法

※ Rubyプログラムとして実行する場合は、必ず copy_image ディレクトリへ移動してください。

```
# 各OS共通
# Rubyプログラムとして実行する場合
cd ~/***/copy_image
ruby main.rb

# Linux
# セットアッププログラムを実行した場合は
# コマンド実行できます
copy_image

# Windows
# セットアッププログラムを実行した場合は
# デスクトップ上のショートカットから実行できます
```

### 実行結果の確認

バックアップの実行後は copy_image フォルダ内に log.txt が生成され、結果が記録されます。


## 導入

### ruby プログラムとして実行する場合 (各OS共通)

#### 1. 任意の場所で git clone する

```sh
cd ./hogehoge
git clone https://github.com/ymmtd0x0b/copy_image.git
```

#### 2. gem をインストール

プログラムで使用する gem をインストールします。

```
# 事前に git clone したディレクトリへ移動
cd ~/bin/lib/copy_image
bundle install
```

#### 3. コピー元とコピー先を設定する

[設定](https://github.com/ymmtd0x0b/copy_image#コピー元とコピー先の設定方法)を参照


#### 4. Rubyプログラムとして main.rb を実行するとバックアップが行われる

```sh
cd ~/***/copy_image
ruby main.rb
```

### コマンドとして実行したい場合 (Linux / Mac)

保存場所は任意のディレクトリで大丈夫です。

以下は `~/bin/lib` で保存することを想定していますが、別の場所に保存する場合はパスを読み替えてください。

#### 1. `~/bin/lib` に git clone する

```sh
# ホームに bin ディレクトリがない場合は作成しておく
mkdir -p ~/bin/lib

# git clone
cd ~/bin/lib
git clone https://github.com/ymmtd0x0b/copy_image.git
```

#### 2. gem をインストール

プログラムで使用する gem をインストールします。

```
# 事前に git clone したディレクトリへ移動
cd ~/bin/lib/copy_image
bundle install
```

### 3. セットアッププログラムを実行する

```sh
cd ~/bin/lib/copy_image
ruby bin/setup.rb
```

#### 4. シェルスクリプトに実行権を付与する

```sh
cd ~/bin/lib/copy_image/bin
chmod u+x copy_image
```

#### 5. 環境変数を設定する

※自作コマンドを `~/bin` から実行できるように設定している場合は、この作業は不要です。

`.bash_profile` や `.profile`、`.bashrc` 等のファイルに下記を追記して環境変数を設定する。(自身の環境に合わせてください)

```
# copy_image
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi
```

#### 6. 設定を再読込みする

手順5で設定した内容を下記コマンドで反映させる。

```sh
# 手順4で追記したファイル名を指定する
source ~/.profile
```

#### 7. コピー元とコピー先を設定する

[設定](https://github.com/ymmtd0x0b/copy_image#コピー元とコピー先の設定方法)を参照

以降はターミナルにて `copy_image` と入力して Enter すると画像のコピーを実行できます。


### バッチファイルとして実行したい場合 (Windows)

保存場所は任意のディレクトリで大丈夫です。

以下は `C:\Users\ユーザー名\Documents` で保存することを想定していますが、別の場所に保存する場合はパスを読み替えてください。

#### 1. `C:\Users\ユーザー名\Documents` に git clone する

```sh
# git clone
cd C:\Users\ユーザー名\Documents
git clone https://github.com/ymmtd0x0b/copy_image.git
```

#### 2. gem をインストール

プログラムで使用する gem をインストールします。

```
# 事前に git clone したディレクトリへ移動
cd C:\Users\ユーザー名\Documents\copy_image
bundle install
```

### 3. セットアッププログラムを実行する

```sh
cd C:\Users\ユーザー名\Documents\copy_image
ruby bin\setup.rb
```

※ セットアッププログラムが上手く動作しない場合は、手動でバッチファイルのリンクをデスクトップ等の任意の場所に作成してください

#### 4. コピー元とコピー先を設定する

[設定](https://github.com/ymmtd0x0b/copy_image#コピー元とコピー先の設定方法)を参照

以降はデスクトップにある `copy_image.bat` を起動させるとバックアップを実行できます。



