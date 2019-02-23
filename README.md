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
- [ ] 5 の倍数のときは｢Buzz｣とプリントできるようにする。
- [ ] 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

### 開発

テストとリンターとフォーマットの自動実行

```bash
mix test.watch
```

## 参照

- [elixir](https://elixir-lang.org/)
- [プログラミング Elixir](https://www.amazon.co.jp/dp/B01KFCXP04/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1)
- [FizzBuzz in Elixir](https://sublimecoding.com/fizzbuzz-in-elixir/)
- [mix test.watch](https://github.com/lpil/mix-test.watch)
- [Credo](https://github.com/rrrene/credo)
- [Elixir 1.6のcode formatterで自動フォーマット](https://qiita.com/shufo/items/f5e3ccd4892288449ff9)
