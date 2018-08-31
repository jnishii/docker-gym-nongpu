# このDockerイメージの使い方(Macの場合)

## インストール

1. [Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac)からDockerをダウンロードしてインストールする
2. Dockerを起動する
3. ターミナルを開く
4. 演習用Dockerイメージをダウンロードする
```
$ docker pull jnishii/docker-gym-ple-nongpu
```
5. 以下をダウンロードして，`run.sh`という名前にする
```
https://github.com/jnishii/docker-gym-ple-nongpu/tree/master/bin/run.sh
```
6. 以下を実行していく
```
$ chmod 755 run.sh　# run.shに実行権限を付与
$ mkdir jovyan # 作業用ディレクトリを作る
```

##　実行

```
$ ./run.sh
```
ブラウザで以下にアクセスする。
```
http://localhost:8080/
```
初回の起動時には，`run.sh`実行時に表示される，jupyter接続用キーも入力する。

`jovyan/`以下はDockerからマウントされるので，Docker側と共有したいファイルはここに置く。

## 実行終了

- `Ctrl-C`で`run.sh`を終了する
- dockerが実行中でないか確認する
```
$ docker ps -a
```
もし実行中になっていたら停止する
```
$ docker rm <docker ID>
```
`<docker ID>`には，`docker ps -a`で表示されるID(数字)のはじめの3桁のみ入れれば良い。

## おまけ
[ここ](http://bcl.sci.yamaguchi-u.ac.jp/~jun/notebook/docker)にもDockerの使い方メモがある。でもgoogle先生に聞くほうが良いかもしれない。