# TddElixir

## 概要

テスト駆動開発から始める Elixir 入門

## 仕様

> 1 から 100 までの数をプリントするプログラムを書け。
> ただし 3 の倍数のときは数の代わりに｢Fizz｣と、5 の倍数のときは｢Buzz｣とプリントし、3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントすること。

## 設計

### TODO リスト

- [x] 1 から 100 まで数をプリントできるようにする。
- [x] 3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。
- [x] 5 の倍数のときは｢Buzz｣とプリントできるようにする。
- [x] 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

### 開発

テストとリンターとフォーマットの自動実行

```bash
mix test.watch
```

アプリケーションの実行

```bash
iex -S mix
iex(2)> TddElixir.fizz_buzz_print
```

静的型チェックの実行

```bash
mix dialyzer
```

## 参照

- [elixir](https://elixir-lang.org/)
- [プログラミング Elixir](https://www.amazon.co.jp/dp/B01KFCXP04/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1)
- [FizzBuzz in Elixir](https://sublimecoding.com/fizzbuzz-in-elixir/)
- [mix test.watch](https://github.com/lpil/mix-test.watch)
- [Credo](https://github.com/rrrene/credo)
- [Elixir 1.6 の code formatter で自動フォーマット](https://qiita.com/shufo/items/f5e3ccd4892288449ff9)
- [静的型チェックツールDialyzerをElixirから使う](https://qiita.com/niku/items/826f3c39c2b8bd99eb5a)
