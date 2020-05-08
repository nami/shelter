## As the library Gmaps.js has stopped working, this app is WIP until further funding. 

<h1 align="center"><a href="https://www.shelter-jp.com/">Shelter</a></h1><br>
<p align="center">
  <a href="https://www.shelter-jp.com/">
    <img alt="Shelter" title="Shelter" src="https://res.cloudinary.com/dpttkxync/image/upload/v1555848962/shelter_logov1.png" width="200">
  </a>
</p>

<p align="center">
  Even in times of disaster, you can always find shelter. 
</p>
<p align="center">
  避難所案内と避難所支援のウェブアプリ 📱
</p>
<br>

## Table of Contents | コンテンツ一覧

- [Introduction](#introduction)
- [Features](#features)
- [Feedback](#feedback)
- [Contributors](#contributors)
- [Build Process](#build-process)
- [Acknowledgments](#acknowledgments)
<br>

## Introduction
<h3>初めに</h3>

A web app for Japan that 
1. Guides you to your nearest evacuation shelter during a disaster 
2. Allows you to make requests for lacking necessities/services at that shelter
3. Lets you offer help to those in crisis through searching and responding to those requests

**Available for both mobile and desktop.**

主な機能は以下の通りです：
1. 災害時に最寄りの避難所まで案内します
2. 避難所で必要な物資・サービスをお願いすることができます
3. 被災者を助けられます。お願いを見つけられる検索と地図の機能

**パソコンとスマホ用のアップリ**

<p align="center">
  <img src = "https://res.cloudinary.com/dpttkxync/image/upload/v1555861672/mobile-web.png" width=750>
</p>
<br>

## Features
<h3>機能</h3>

A few of the things you can do with Shelter:

Shelterができる機能：

##### Seek Help
* Filter shelters by disasters
* Be guided to the closest evacuation shelter 
* Check into a shelter 
* Make requests on the shelter page as a verified user
* Filter requests by category 

##### 助けを探す
* 災害ごとに避難所を分ける
* 最寄りの避難所まで案内する
* 避難所にチェックインする
* 認証済みユーザーとして避難所のページにお願いを投稿する
* カテゴリごとにお願いを分けれる

<p align="center">
  <img src = "https://res.cloudinary.com/dpttkxync/image/upload/v1555862226/need-help.png" width="1000">
</p>

<h4>Offer Help</h4>

* Look at the most important needs of an area
* Look at the top requests of all the shelters in an area
* Search the map and shelters for specific requested items
* Respond to requests as a verified user

<h4>助ける</h4>

* エリアの大事なお願いを見つける
* エリアの避難所ごとのトップの投稿を見る
* 物資が必要な避難所を探す
* 認証済みユーザーとしてお願いに返信する

<p align="center">
  <img src = "https://res.cloudinary.com/dpttkxync/image/upload/v1555862617/offer-help.png" width=1000>
</p>

<strong>NOTE: To make or respond to requests you must become a verified user by providing government id during signup</strong>
<strong>注意： 投稿や返信には登録時に身分証明書によるユーザー認証が必要です</strong>

<br>

## Feedback
<h3>フィードバック</h3>

Feel free to send us feedback [here](mailto:contact@shelter-jp.com) or [file an issue](https://github.com/pomlego/shelter/issues/new). We especially welcome feedback from those living in Japan or working in disaster related recovery. If you wish to contribute, please drop us Nami a [line](mailto:izarra@shelter-jp.com).

アップリ品質向上のための[フィードバック](mailto:contact@shelter-jp.com)や[issueの報告](https://github.com/pomlego/shelter/issues/new)をお待ちしております。　特に日本にお住まいの方々や災害・防災関連の職業の方々からのフィードバックを是非お聞かせください。もし、Shelterへの貢献をお考えであれば[イザラ](mailto:izarra@shelter-jp.com)までご連絡ください。

<br>

## Contributors

* [Nami Izarra](https://github.com/pomlego) - Lead dev & designer
* [Derek Johnson](https://github.com/D-a-Johnson) - Notifications back-end
* [Aya Kashihara](https://github.com/ayakshr) - Check-in & upvoting back-end
* [Peter Hsieh](https://github.com/PiiterH) - Notifications front-end

<h3>開発者</h3>

* [イザラなみ](https://github.com/pomlego) - 開発リーダーとデザイナー
* [Derek Johnson](https://github.com/D-a-Johnson) - 通知機能のバックエンド
* [樫原彩](https://github.com/ayakshr) - チェックインとライク機能のバックエンド
* [Peter Hsieh](https://github.com/PiiterH) - 通知ページのデザイン

<br>

## Build Process

- This app uses Rails 5 and node v11.12 
- Clone or download the repo 
- `yarn install` & `bundle install` to install dependencies
- `rails db:create db:migrate db:seed` to run the database

**Development Keys**: 
1. Please enable Google's `Places API`, `Maps JavaScript API`, `Geocoding API` and `Cloud Translation API`. 
2. You will need to configure `GOOGLE_API_SERVER_KEY`, `GOOGLE_API_BROWSER_KEY`, and 
`CLOUDINARY_URL` in your .env file to access the map functions 
3. To set up Google's `Cloud Translation API` please follow this [guide](https://dev.to/nodefiend/quick-start-google-translation-api-in-rails-4j81).

<h3>開発セットアップ</h3>

- このアプリは Rails 5 と node v11.12 を利用しています
- リポジトリを Clone か　ダウンロードしてください
- 依存関係をインストールのコマンド： `yarn install` と `bundle install` 
- DBのセットアップコマンド：　`rails db:create db:migrate db:seed`

**開発用のキー**: 
1. Googleの`Places API`　と `Maps JavaScript API`, `Geocoding API`, `Cloud Translation API` をコンソールでオンにしてください
2. アプリのマップ機能利用するために .env ファイルで　`GOOGLE_API_SERVER_KEY`　と `GOOGLE_API_BROWSER_KEY`, 
`CLOUDINARY_URL` をセットアップしてください
3. Googleの `Cloud Translation API` を利用するためにこちらの[ガイド](https://dev.to/nodefiend/quick-start-google-translation-api-in-rails-4j81)に沿ってください

<br>

## Acknowledgments

Thank you to the Le Wagon Kyoto team, especially [Maria Altyeva](https://github.com/maltyeva), Yann Klein and [Zachary Gian](https://github.com/zacharygian) for all their guidance and assistance. We couldn't have done this without you.

