# dotfiles

作成時の参考サイト：https://qiita.com/yutkat/items/c6c7584d9795799ee164

## 利用方法

1. Cloneする
2. 設定を展開する

```bash
 source ./.bin/install.sh
```

## 設定を追加した時

.gitignoreの対象になっていないかどうか注意する

※ ホワイトリスト方式のため、許可しないとアップロードされない。

（変なシークレットキーが流出するのを防ぐために設定している。）

## 認証情報

公開鍵を設定しよう

[ローカルからSSH鍵を使ってGithubにデプロイする方法](https://kamenleon.github.io/for-blog/p/%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%81%8B%E3%82%89ssh%E9%8D%B5%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6github%E3%81%AB%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/)

環境変数などの設定は、`.config/bashrc_private`に記述することで、PCごとのフルパス設定などをGit管理から外すことができる。
