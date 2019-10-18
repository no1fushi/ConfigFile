# 【紹介】
主に様々なマシンで共有するために  
設定ファイルやbat,shell scriptなどを置いていきます  

## ディレクトリ構成
* bat  
バッチファイル
* sh  
シェルスクリプト
* soft  
いろいろなソフトウェアの設定ファイル

## 中身

#### **- bat -**  

* kakushi.bat  
Make Hidden folder  
* makedolders.bat  
リストアップされた名前のフォルダを一度に作成する
* makelist.bat  
フォルダのリストを作成する
* testserver.bat  
vagrant  
* sudo.bat  
runasをどうしてもsudoにしたかっただけ   

#### **- sh -**  

* fwset.sh  
iptablesの設定
* mc  
Memory Clean
* monit.sh  
Rubyのプロセス数を監視して下回るとメールする
* prov_rasbian.sh  
raspbian用のプロビジョニングスクリプト
* prov_ubuntu.sh  
Ubuntu用のプロビジョニングスクリプト(上よりこちらを推奨)
* proxy.sh  
学内のbash,gitにプロキシ設定をするスクリプト
* sendip  
IPアドレスが変わるとメールするスクリプト

#### **- soft -**  

* vim  
.vimrc  
いろいろな方のを参考にさせてもらってます。  
* bash  
bashrc,bash_profile  
* SublimeText3.zip
SublimeText3のパッケージディレクトリ  
* node_webdev  
node,grupのweb開発環境  
これもいろいろな方のを参考。  
* emacs  
init.el
