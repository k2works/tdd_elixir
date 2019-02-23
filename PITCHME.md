### テスト駆動開発から始める Elixir 入門

---

### 構成

- 自己紹介
- テストファーストから始める Elixir
- リファクタリングから始める Elixir
- ふりかえりから始める Elixir

---

### 自己紹介

- カキギカツユキ
- おっさんプログラマ
- メインの言語は Ruby と JavaScript

---

### テストファーストから始める Elixir

---

### **テツオ** 関数型言語、はじめるってよ

---

### テツオ

**テツ**ズキ型言語

+

**オ**ブジェクト指向言語

=

手続き型言語とオブジェクト指向言語マン

---

### たちまち、TDD（テスト駆動開発）

たちまち・・・for the time being

---

### お題は FizzBuzz 問題

> 1 から 100 までの数をプリントするプログラムを書け。

> ただし 3 の倍数のときは数の代わりに｢Fizz｣と、5 の倍数のときは｢Buzz｣とプリントし、3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントすること。

---

### TODO リスト

> 何をテストすべきだろうか --- 着手する前に、必要になりそうなテストをリストに書き出しておこう。

> テスト駆動開発

---

### TODO リスト

- 1 から 100 まで数をプリントできるようにする。
- 3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。
- 5 の倍数のときは｢Buzz｣とプリントできるようにする。
- 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

---

### テストファースト

> いつテストをかくべきだろうか --- それはテスト対象のコードを書く前だ。

> テスト駆動開発

---

### テストファースト

```elixir
defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  doctest FizzBuzz

  test "Hello, world!" do
    assert FizzBuzz.greeting() == "Hello, world!"
  end
end
```

---

### テストファースト

```elixir
defmodule FizzBuzz do
  @moduledoc false

  def greeting do
    "Hello, world!"
  end
end
```

---

### テストファースト

```bash
$ mix test test/fizz_buzz_test.exs
.

Finished in 0.02 seconds
1 test, 0 failures
```

---

### 学習用テスト

> テーム外の誰かが書いたソフトウェアのテストを書くのはどのようなときか --- そのソフトウェアの新機能を初めて使う際に書いてみよう。

> テスト駆動開発

---

### 学習用テスト

```elixir
  test "1から100までの数をプリントする" do
    FizzBuzz.print()
  end
```

---

### 学習用テスト

```ruby
  def print do
    IO.puts(1)
  end
```

---

### 学習用テスト

```bash
$ mix test test/fizz_buzz_test.exs
1
.

Finished in 0.02 seconds
1 test, 0 failures
```

---

### 1 から 100 までをプリントする

Ruby だとこんな感じ

```ruby
while i <= 100
  puts i
  i += 1
end
```

---

### 1 から 100 までをプリントする

JavaScript だとこんな感じ

```javascript
for (let i = 1; i <= 100; i++) {
  connsole.log(i);
}
```

---

### 1 から 100 までをプリントする

Python だとこんな感じ

```python
for i range(100):
    print(i)
```

---

### 1 から 100 までをプリントする

Elixir だとこんな感じ・・・か？

Elixir に for 文はない、代わりに再帰ループを使う

```elixir
defmodule FizzBuzz do
  def print do
    print(100, [])
  end

  def print(0, result) do
    result
  end

  def print(current, result) do
    IO.puts(current)
    print(current - 1, [ current | result] )
  end
end
```

---

### 1 から 100 までをプリントする

```elixir
  test "1から100までの数をプリントする" do
    list = FizzBuzz.print()
    assert List.first(list) == 1
    assert List.last(list) == 100
  end
```

---

### 1 から 100 までをプリントする

```bash
$ mix test test/fizz_buzz_test.exs
Compiling 1 file (.ex)
100
.
.
2
1
.

Finished in 0.02 seconds
1 test, 0 failures

Randomized with seed 141950
```

---

### TODO リスト

- ~~1 から 100 まで数をプリントできるようにする。~~
- 3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。
- 5 の倍数のときは｢Buzz｣とプリントできるようにする。
- 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

---

### 3 で割り切れる場合は Fizz を返す

> アサートファースト

> いつアサーションを書くべきだろうか----最初に書こう

> テスト駆動開発

---

### 3 で割り切れる場合は Fizz を返す

```elixir
  test "3で割り切れる場合はFizzを返す" do
    assert FizzBuzz.generate(3) == "Fizz"
  end
```

---

### 3 で割り切れる場合は Fizz を返す

> 仮実装を経て本実装へ

> 失敗するテストを書いてから、最初に行う実装はどのようなものだろうか----ベタ書きの値を返そう。

> テスト駆動開発

---

### 3 で割り切れる場合は Fizz を返す

```elixir
  def generate(number) do
    "Fizz"
  end
```

---

### 3 で割り切れる場合は Fizz を返す

```bash
$ mix test test/fizz_buzz_test.exs
.100
99
.
.
1
.

Finished in 0.05 seconds
2 tests, 0 failures

Randomized with seed 554543
```

---

### 3 で割り切れる場合は Fizz を返す

> 三角測量

> テストから最も慎重に一般化を引き出すやり方はどのようなものだろうか----２つ以上の例があるときだけ、一般化を行うようにしよう。

> テスト駆動開発

---

### 3 で割り切れる場合は Fizz を返す

```elixir
  test "3で割り切れる場合はFizzを返す" do
    assert FizzBuzz.generate(3) == "Fizz"
    assert FizzBuzz.generate(1) == 1
  end
```

---

### 3 で割り切れる場合は Fizz を返す

```bash
$ mix test test/fizz_buzz_test.exs
.
.

  1) test 3で割り切れる場合はFizzを返す (FizzBuzzTest)
     test/fizz_buzz_test.exs:13
     Assertion with == failed
     code:  assert FizzBuzz.generate(3) == "Fizz"
     left:  3
     right: "Fizz"
     stacktrace:
       test/fizz_buzz_test.exs:14: (test)



Finished in 0.03 seconds
2 tests, 1 failure

Randomized with seed 888237
```

---

### 3 で割り切れる場合は Fizz を返す

```elixir
  def generate(number) do
    result = number
    if rem(number, 3) == 0 do
      result = "Fizz"
    else
      result = number
    end
    result
  end
```

---

### 3 で割り切れる場合は Fizz を返す

Elixir は関数型なのでこれではうまくいかない。

あと、Elixir では、等号（＝）は代入ではない。

```bash
$ mix test test/fizz_buzz_test.exs


  1) test 3で割り切れる場合はFizzを返す (FizzBuzzTest)
     test/fizz_buzz_test.exs:10
     Assertion with == failed
     code:  assert FizzBuzz.generate(3) == "Fizz"
     left:  3
     right: "Fizz"
     stacktrace:
       test/fizz_buzz_test.exs:11: (test)



Finished in 0.02 seconds
2 test, 1 failure
```

---

### 3 で割り切れる場合は Fizz を返す

```elixir
  def generate(number) do
    result =
      if rem(number, 3) == 0 do
        "Fizz"
      else
        number
      end
  end
```

---

### 3 で割り切れる場合は Fizz を返す

```bash
$ mix test test/fizz_buzz_test.exs
Compiling 1 file (.ex)
.100
99
.
.
2
1
.

Finished in 0.03 seconds
2 tests, 0 failures

Randomized with seed 600908
```

---

### TODO リスト

- ~~1 から 100 まで数をプリントできるようにする。~~
- ~~3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。~~
- 5 の倍数のときは｢Buzz｣とプリントできるようにする。
- 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

---

### 5 で割り切れる場合は Buzz を返す

```ruby
  test "5で割り切れる場合はBuzzを返す" do
    assert FizzBuzz.generate(5) == "Buzz"
  end
```

---

### 5 で割り切れる場合は Buzz を返す

Ruby だとこんな感じ

```ruby
def generate(number)
  result = number

  if (number % 3).zero?
    result = 'Fizz'
  elsif (number % 5).zero?
    result = 'Buzz'
  end

  result
end
```

---

### 5 で割り切れる場合は Buzz を返す

JavaScript だとこんな感じ

```javascript
function generate(number) {
  let result = number;

  if (number % 3 === 0) {
    result = "Fizz";
  } else if (number % 5 === 0) {
    result = "Buzz";
  }

  return result;
}
```

---

### 5 で割り切れる場合は Buzz を返す

Python だとこんな感じ

```Python
def generate(number):
      result = number

      if number % 3 == 0:
          result = 'Fizz'
      elif number % 5 == 0:
          result = 'Buzz'

      return result
```

---

### 5 で割り切れる場合は Buzz を返す

Elixir では・・・とりあえずこんな感じで

```elixir
  def generate(number) do
    cond do
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
```

---

### 5 で割り切れる場合は Buzz を返す

```bash
$ mix test test/fizz_buzz_test.exs
Compiling 1 file (.ex)
.100
99
.
.
2
1
.

Finished in 0.03 seconds
3 tests, 0 failures

Randomized with seed 600908
```

---

### TODO リスト

- ~~1 から 100 まで数をプリントできるようにする。~~
- ~~3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。~~
- ~~5 の倍数のときは｢Buzz｣とプリントできるようにする。~~
- 3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。

---

### 3 と 5 で割り切れる場合は FizzBuzz を返す

```elixir
  test "3と5で割り切れる場合はFizzBuzzを返す" do
    assert FizzBuzz.generate(15) == "FizzBuzz"
  end
```

---

### 3 と 5 で割り切れる場合は FizzBuzz を返す

```elixir
  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
```

---

### 3 と 5 で割り切れる場合は FizzBuzz を返す

```bash
$ mix test test/fizz_buzz_test.exs
Compiling 1 file (.ex)
.100
99
.
.
2
1
.

Finished in 0.03 seconds
4 tests, 0 failures

Randomized with seed 600908
```

---

### TODO リスト

- ~~1 から 100 まで数をプリントできるようにする。~~
- ~~3 の倍数のときは数の代わりに｢Fizz｣をプリントできるようにする。~~
- ~~5 の倍数のときは｢Buzz｣とプリントできるようにする。~~
- ~~3 と 5 両方の倍数の場合には｢FizzBuzz｣とプリントできるようにする。~~

---

### FizzBuzz

1 から 100 までをプリントするのではなく・・・

```elixir
 test "1から100までの数をプリントする,ただし3で割り切れる場合はFizz,5で割り切れる場合はBuzz,両方で割り切れる場合はFizzBuzzをプリントする" do
    list = FizzBuzz.print()
    assert List.first(list) == 1
    assert Enum.at(list, 2) == "Fizz"
    assert Enum.at(list, 4) == "Buzz"
    assert Enum.at(list, 14) == "FizzBuzz"
    assert List.last(list) == "Buzz"
  end
```

---

### FizzBuzz

`generate`関数を呼び出すようにする

```elixir
  def print do
    print(100, [])
  end

  def print(0, result) do
    result
  end

  def print(current, result) do
    value = generate(current)
    IO.puts(value)
    print(current - 1, [ value | result] )
  end
```

---

### FizzBuzz

```bash
$ mix test test/fizz_buzz_test.exs
.Buzz
Fizz
.
.
91
FizzBuzz
89
.
.
1
...

Finished in 0.04 seconds
4 tests, 0 failures

Randomized with seed 490968
```

---

### 他の言語だと・・・

---

### FizzBuzz

Ruby だとこんな感じ

```ruby
class FizzBuzz
  def self.generate(number)
    result = number

    if (number % 3).zero? && (number % 5).zero?
      result = 'FizzBuzz'
    elsif (number % 3).zero?
      result = 'Fizz'
    elsif (number % 5).zero?
      result = 'Buzz'
    end

    result
  end
end
```

---

### FizzBuzz

JavaScript だとこんな感じ

```javascript
function generate(number) {
  let result = number;

  if (number % 3 === 0 && number % 5 === 0) {
    result = "FizzBuzz";
  } else if (number % 3 === 0) {
    result = "Fizz";
  } else if (number % 5 === 0) {
    result = "Buzz";
  }

  return result;
}
```

---

### FizzBuzz

Python だとこんな感じ

```Python
def generate(number):
      result = number

      if (number % 3 == 0) and (number % 5 == 0):
          result = 'FizzBuzz'
      elif number % 3 == 0:
          result = 'Fizz'
      elif number % 5 == 0:
          result = 'Buzz'

      return result
```

---

### リファクタリングから始める Elixir

---

### リファクタリング

> リファクタリング（名詞）：外部から見たときの振る舞いを保ちつつ、理解や修正が簡単になるように、ソフトウェアの内部構造を変化させること。

> 新装版 リファクタリング―既存のコードを安全に改善する

---

### リファクタリング

> リファクタリングする（動詞）：一連のリファクタリングを適用して、外部から見た振る舞いの変更なしに、ソフトウェアを再構築すること。

> 新装版 リファクタリング―既存のコードを安全に改善する

---

### リファクタリング

まずは`print`関数から

```elixir
  def print do
    print(100, [])
  end

  def print(0, result) do
    result
  end

  def print(current, result) do
    value = generate(current)
    IO.puts(value)
    print(current - 1, [ value | result] )
  end
```

---

### リファクタリング

一行のブロックのときには do:形式

複数行に渡るときには do..end 形式を使う

```elixir
  def print, do: print(100, [])
  def print(0, result), do: result

  def print(current, result) do
    value = generate(current)
    IO.puts(value)
    print(current - 1, [ value | result] )
  end
```

---

### リファクタリング

> テストを完全に自動化して、その結果もテストにチェックさせること。

> 新装版 リファクタリング―既存のコードを安全に改善する

```bash
 $ mix test test/fizz_buzz_test.exs
....
.
1
...

Finished in 0.03 seconds
4 tests, 0 failures

Randomized with seed 474353
```

---

### Chage Function Declaration

名前が処理をうまく表せていない

```elixir
  def print, do: print(100, [])
  def print(0, result), do: result

  def print(current, result) do
    value = generate(current)
    IO.puts(value)
    print(current - 1, [ value | result] )
  end
```

---

### Chage Function Declaration

関数名を変更する

```elixir
  def print, do: downto(100, [])

  def downto(0, result), do: result
  def downto(current, result) do
    value = generate(current)
    IO.puts(value)
    downto(current - 1, [ value | result] )
  end
```

---

### Hide Delegate

`downto`関数は公開すべきではない

```elixir
  def print, do: downto(100, [])

  def downto(0, result), do: result
  def downto(current, result) do
    value = generate(current)
    IO.puts(value)
    downto(current - 1, [ value | result] )
  end
```

---

### Hide Delegate

プライベート関数

```elixir
  def print, do: _downto(100, [])

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    IO.puts(value)
    _downto(current - 1, [ value | result] )
  end
```

---

### Pull Up Method

`IO.puts`が`_downto`で呼び出されている

```elixir
  def print, do: _downto(100, [])

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    IO.puts(value)
    _downto(current - 1, [ value | result] )
  end
```

---

### Pull Up Method

`IO.puts`は`print`で呼び出す

```elixir
  def print() do
    list = _downto(100, [])
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    _downto(current - 1, [ value | result] )
  end
```

---

### Extract Function

`_downto`はリストを生成しているので

```elixir
  def print() do
    list = _downto(100, [])
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    _downto(current - 1, [ value | result] )
  end
```

---

### Extract Function

`generate_linst`関数を抽出する

```elixir
  def print() do
    list = generate_list()
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  def generate_list(), do: _downto(100, [])

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    _downto(current - 1, [ value | result] )
  end
```

---

### Replace Loop with Pipeline

`_downto`の繰り返しをなんとかしたい

```elixir
  def print() do
    list = generate_list()
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  def generate_list(), do: _downto(100, [])

  defp _downto(0, result), do: result
  defp _downto(current, result) do
    value = generate(current)
    _downto(current - 1, [ value | result] )
  end
```

---

### Replace Loop with Pipeline

ループからパイプラインに

```elixir
  def print() do
    list = generate_list()
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  def generate_list() do
    range = 1..100
    Enum.map range, fn (number) -> generate(number) end
  end
```

---

### Inline Variable

説明変数いらない

```elixir
  def print() do
    list = generate_list()
    Enum.map list, fn (value) -> IO.puts(value) end
  end

  def generate_list() do
    range = 1..100
    Enum.map range, fn (number) -> generate(number) end
  end
```

---

### Inline Variable

do:表記でスッキリ

```elixir
 def print(), do: Enum.map generate_list(), fn (value) -> IO.puts(value) end

 def generate_list(), do: Enum.map 1..100, fn (number) -> generate(number) end
```

---

### Inline Variable

&記法

```elixir
  def print(), do: Enum.map generate_list(), &IO.puts/1

  def generate_list(), do: Enum.map 1..100, &generate/1
```

---

### Inline Variable

パイプ演算子

```elixir
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1
```

---

### Extract Parameter

任意の範囲でリストを生成しよう

```elixir
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1
```

---

### Extract Parameter

引数パラメータを抽出する

```elixir
  def print(), do: generate_list(100) |> Enum.map &IO.puts/1

  def generate_list(max_range), do: 1..max_range |> Enum.map &generate/1
```

---

### Replace Magic Number with Symbolic Constant

マジックナンバー良くない

```elixir
  def print(), do: generate_list(100) |> Enum.map &IO.puts/1

  def generate_list(max_range), do: 1..max_range |> Enum.map &generate/1
```

---

### Replace Magic Number with Symbolic Constant

モジュールの属性は Ruby や Java の定数

```elixir
  @max_range 100

  def print(), do: generate_list(@max_range) |> Enum.map &IO.puts/1

  def generate_list(max_range), do: 1..max_range |> Enum.map &generate/1
```

---

### Extract Variable

次は`generate`関数

まずは判定してる意味を明確にする

```elixir
  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
```

---

### Extract Variable

説明変数を抽出する

```elixir
  def generate(number) do
    fizz = rem(number, 3) == 0
    buzz = rem(number, 5) == 0

    cond do
      fizz and buzz -> "FizzBuzz"
      fizz -> "Fizz"
      buzz -> "Buzz"
      true -> number
    end
  end
```

---

### Extract Function

変数にバインドしている内容だけど

```elixir
  def generate(number) do
    fizz = rem(number, 3) == 0
    buzz = rem(number, 5) == 0

    cond do
      fizz and buzz -> "FizzBuzz"
      fizz -> "Fizz"
      buzz -> "Buzz"
      true -> number
    end
  end
```

---

### Extract Function

問い合わせ関数にして

```elixir
 def generate(number) do
    fizz = _fizz?(number)
    buzz = _buzz?(number)

    cond do
      fizz and buzz -> "FizzBuzz"
      fizz -> "Fizz"
      buzz -> "Buzz"
      true -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3) == 0
  defp _buzz?(number), do: rem(number, 5) == 0
```

---

### Replace Temp with Query

一時変数をインライン化したら出来上がり

```elixir
  def generate(number) do
    cond do
      _fizz?(number) and _buzz?(number) -> "FizzBuzz"
      _fizz?(number) -> "Fizz"
      _buzz?(number) -> "Buzz"
      true -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3) == 0
  defp _buzz?(number), do: rem(number, 5) == 0
```

---

### Substitue Argolrith

`cond`節だけど

```elixir
  def generate(number) do
    cond do
      _fizz?(number) and _buzz?(number) -> "FizzBuzz"
      _fizz?(number) -> "Fizz"
      _buzz?(number) -> "Buzz"
      true -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3) == 0
  defp _buzz?(number), do: rem(number, 5) == 0
```

---

### Substitue Argolrith

Elixir の`case`を試してみる

```elixir
  def generate(number) do
    case {_fizz?(number), _buzz?(number)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3)
  defp _buzz?(number), do: rem(number, 5)
```

---

### Replace Nested Conditional with Guard Clauses

もう少し可読性をあげたいな

```elixir
  def generate(number) do
    case {_fizz?(number), _buzz?(number)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3)
  defp _buzz?(number), do: rem(number, 5)
```

---

### Replace Nested Conditional with Guard Clauses

ガード節に変更

```elixir
  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  def generate(number) when rem(number, 3) == 0 , do: "Fizz"
  def generate(number) when rem(number, 5) == 0 , do: "Buzz"
  def generate(number), do: number
```

---

### Replace Magic Number with Symbolic Constant

マジックナンバーじゃないけど

```elixir
  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  def generate(number) when rem(number, 3) == 0 , do: "Fizz"
  def generate(number) when rem(number, 5) == 0 , do: "Buzz"
  def generate(number), do: number
```

---

### Replace Magic Number with Symbolic Constant

他の関数でも使うかもしれないので

```elixir
  @fizz_buzz "FizzBuzz"
  @fizz "Fizz"
  @buzz "Buzz"

  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: @fizz_buzz
  def generate(number) when rem(number, 3) == 0 , do: @fizz
  def generate(number) when rem(number, 5) == 0 , do: @buzz
  def generate(number), do: number
end
```

---

### Extract Module

仕上げはモジュール化

```elixir
defmodule TddElixir.FizzBuzz do
  @max_range 100
  def print, do: generate_list(@max_range) |> Enum.map(&IO.puts/1)
  def generate_list(max_range), do: 1..max_range |> Enum.map(&generate/1)

  @fizz_buzz "FizzBuzz"
  @fizz "Fizz"
  @buzz "Buzz"
  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: @fizz_buzz
  def generate(number) when rem(number, 3) == 0, do: @fizz
  def generate(number) when rem(number, 5) == 0, do: @buzz
  def generate(number), do: number
end
```

---

### ふりかえりから始める Elixir

---

### リファクタリングされたコードは他の言語でも似てね？

---

### Refactored Ruby

```ruby
class FizzBuzz
  MAX_RANGE = 100
  FIZZ_BUZZ = 'FizzBuzz'
  FIZZ = 'Fizz'
  BUZZ = 'Buzz'

  def self.print
    puts generate_list
  end

  def self.generate_list
    (1..MAX_RANGE).map(&method(:generate))
  end

  def self.generate(number)
    return FIZZ_BUZZ if (fizz?(number)).zero? && (buzz?(number)).zero?
    return FIZZ if (fizz?(number)).zero?
    return BUZZ if (buzz?(number)).zero?
    number
  end

  def self.fizz?(number)
    number % 3
  end

  def self.buzz?(number)
    number % 5
  end

  private_class_method :buzz?,:fizz?
end
```

---

### Refactored JavaScript

```javascript
const MAX_RANGE = 101;
const FIZZ_BUZZ = "FizzBuzz";
const FIZZ = "Fizz";
const BUZZ = "Buzz";
const FizzBuzz = {
  print() {
    this._renderTable(this.generateList());
  },
  generateList() {
    return [...Array(MAX_RANGE).keys()].map(this.generate.bind(this)).slice(1);
  },
  generate(number) {
    if (this._isFizz(number) && this._isBuzz(number)) return FIZZ_BUZZ;
    if (this._isFizz(number)) return FIZZ;
    if (this._isBuzz(number)) return BUZZ;
    return number;
  },
  _isFizz(number) {
    return number % 3 === 0;
  },
  _isBuzz(number) {
    return number % 5 === 0;
  },
  _renderTable: function(list) {
    let columnCount = 1;
    let html = "<table>";
    html += "<thead>";
    [...Array(10).keys()].forEach(key => {
      html += `<th>${key + 1}</th>`;
    });
    html += "</thead>";
    html += "<tbody>";
    html += "<tr>";
    list.forEach(v => {
      if (columnCount < 10) {
        html += `<td>${v}</td>`;
        columnCount += 1;
      } else {
        html += `<td>${v}</td>`;
        html += "</tr>";
        columnCount = 1;
      }
    });
    html += "</tbody>";
    html += "</table>";
    const app = document.querySelector("#app");
    app.innerHTML = html;
  }
};
```

---

### Refactored Python

```python
MAX_RANGE = 101
BUZZ = 'Buzz'
FIZZ = 'Fizz'
FIZZ_BUZZ = 'FizzBuzz'


class FizzBuzz:
    @staticmethod
    def print():
        [print(v) for v in FizzBuzz.generate_list()]

    @staticmethod
    def generate_list():
        return list(map(FizzBuzz.generate, range(MAX_RANGE)))

    @staticmethod
    def generate(number):
        if (FizzBuzz.__is_fizz(number)) and (FizzBuzz.__is_buzz(number)):
            return FIZZ_BUZZ
        if FizzBuzz.__is_fizz(number):
            return FIZZ
        if FizzBuzz.__is_buzz(number):
            return BUZZ
        return number

    @staticmethod
    def __is_buzz(number):
        return number % 5 == 0

    @staticmethod
    def __is_fizz(number):
        return number % 3 == 0

```

---

### Refactored Elixir

```elixir
defmodule TddElixir.FizzBuzz do
  @max_range 100
  def print, do: generate_list(@max_range) |> Enum.map(&IO.puts/1)
  def generate_list(max_range), do: 1..max_range |> Enum.map(&generate/1)

  @fizz_buzz "FizzBuzz"
  @fizz "Fizz"
  @buzz "Buzz"
  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: @fizz_buzz
  def generate(number) when rem(number, 3) == 0, do: @fizz
  def generate(number) when rem(number, 5) == 0, do: @buzz
  def generate(number), do: number
end
```

---

- Elixir(関数型言語？)だとよりコンパクト
- 関数型の流儀に従うとリファクタリングされたコードになりやすい
- パイプ演算子は(・∀・)ｲｲ!!

---

### Elixir あるある

- Elixir では、等号（＝）は代入ではない。
- Elixir のリストは連結リスト。
- Elixir に for 文はない、代わりに再帰ループ処理。
- Elixir には、ほんの少しの制御構文しかない。if, unless, cond, case,それから raise。
- Elixir は名前付き関数を呼ぶ時、はじめの定義（節）のパラメータリストにマッチさせようとする。

---

### Ruby は楽しい

> 開発者のまつもとゆきひろは、「Ruby の言語仕様策定において最も重視しているのはストレスなくプログラミングを楽しむことである (enjoy programming)」と述べている。

> Ruby - [Wikipedia](https://ja.wikipedia.org/wiki/Ruby)

---

### Elixir も楽し(・∀・)ｲｲ!!

<img src="https://d2dcan0armyq93.cloudfront.net/photo/odai/600/40224305201b1ae5379640064e694995_600.jpg" width="600x600">

みんなも Elixir をキメようぜ！

---

### おわり

---

### 参照

- [サンプルコード](https://github.com/k2works/tdd_elixir)
- [テスト駆動開発](https://www.amazon.co.jp/%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA-Kent-Beck/dp/4274217884/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=&sr=)
- [Refactoring: Improving the Design of Existing Code (2nd Edition)](https://www.amazon.co.jp/Refactoring-Improving-Existing-Addison-Wesley-Signature/dp/0134757599/ref=pd_sbs_14_1/357-0788753-0519007?_encoding=UTF8&pd_rd_i=0134757599&pd_rd_r=531da6c3-3670-11e9-8479-6b76599af025&pd_rd_w=IozYn&pd_rd_wg=yCXVP&pf_rd_p=ad2ea29d-ea11-483c-9db2-6b5875bb9b73&pf_rd_r=T7JA13SSRSYEJJNQAT6D&psc=1&refRID=T7JA13SSRSYEJJNQAT6D)
- [新装版 リファクタリング―既存のコードを安全に改善する― (OBJECT TECHNOLOGY SERIES)](https://www.amazon.co.jp/%E3%83%AA%E3%83%95%E3%82%A1%E3%82%AF%E3%82%BF%E3%83%AA%E3%83%B3%E3%82%B0%E2%80%95%E6%97%A2%E5%AD%98%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E5%AE%89%E5%85%A8%E3%81%AB%E6%94%B9%E5%96%84%E3%81%99%E3%82%8B%E2%80%95-OBJECT-TECHNOLOGY-Martin-Fowler/dp/427405019X/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=&sr=)
- [リファクタリング:Ruby エディション](https://www.amazon.co.jp/%E3%83%AA%E3%83%95%E3%82%A1%E3%82%AF%E3%82%BF%E3%83%AA%E3%83%B3%E3%82%B0-Ruby%E3%82%A8%E3%83%87%E3%82%A3%E3%82%B7%E3%83%A7%E3%83%B3-Jay-Fields/dp/4048678841/ref=sr_1_2?ie=UTF8&qid=1550819257&sr=8-2&keywords=refactoring+ruby+edition)
- [プログラミング Elixir](https://www.amazon.co.jp/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0Elixir-Dave-Thomas/dp/4274219151/ref=sr_1_1?ie=UTF8&qid=1550819313&sr=8-1&keywords=elixir+%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0)

---
