
# https://speakerdeck.com/k_tsj/rubyconf2019-pattern-matching-new-feature-in-ruby-2-dot-7?slide=20
# https://qiita.com/jnchito/items/9bb4aa1dcefa00257815


### 概要

# 関数型言語で利用される条件分岐
# Ruby「多重代入ができるcase式」
#- 配列やハッシュの構造による分類



#### 基本構文(case式との比較)

# case式では「case/when」だが、パターンマッチでは「case/in」
# in ...ローカル変数の宣言と代入
#「in節のオブジェクト === case節のオブジェクト」が成立すれば、節が実行される



# case式の場合
case 1
when 0
  'zero'
when 1
  'one'
end
#=> "one"

# パターンマッチの場合
case 1
in 0
  'zero'
in 1
  'one'
end
#=> "one"




### case式との共通点

## 戻り値を変数に代入できる

## else節の指定

## thenを省略している

## in節でRangeオブジェクトやクラス名を指定できる

#1 コード例(Rangeオブジェクト指定)
case 2000
in 1926..1988
  '昭和'
in 1989..2018
  '平成'
else
  '令和'
end
#=> "平成"

#2 コード例(クラス名を指定)
case 'abc'
in Object
  'オブジェクトです'
in Integer
  '整数です'
in String
  '文字列です'
end
#=> "オブジェクトです"




### case式との相違点

## when節がin節に変わった

## 複数の条件を並べる場合の、節の記法
#- パターンマッチでは(,)の代わりに(|)を用いる

# case式の場合
case 'melon'
when 'tomato', 'potato', 'carrot'
  '野菜です'
when 'orange', 'melon', 'banana'
  '果物です'
end
#=> "果物です"

# パターンマッチの場合
case 'melon'
in 'tomato' | 'potato' | 'carrot'
  '野菜です'
in 'orange' | 'melon' | 'banana'
  '果物です'
end
#=> 果物です


## case節のオブジェクトがどの条件にも一致しない場合の挙動
#- 予想外の値が返ってきた場合に、例外を発生させるコードを書かずに済むメリット。
# https://qiita.com/jnchito/items/9bb4aa1dcefa00257815

# case式ではnilが返る
case 'chicken'
when 'tomato', 'potato', 'carrot'
  '野菜です'
when 'orange', 'melon', 'banana'
  '果物です'
end
#=> nil

# パターンマッチ（どの条件にも一致しなければ例外が発生する）
case 'chicken'
in 'tomato' | 'potato' | 'carrot'
  '野菜です'
in 'orange' | 'melon' | 'banana'
  '果物です'
end
#=> NoMatchingPatternError (chicken)


# https://qiita.com/jnchito/items/9bb4aa1dcefa00257815
#- コラム:代入ではなく束縛？ 以降を読み飛ばす






### 各種パターン

# https://tech.medpeer.co.jp/entry/2019/05/13/090000
# https://qiita.com/natsuokawai/items/cc897ffeef8fb48ce89d



## Valueパターン ...パターンとして単一のリテラルを指定する

case 0
in 0
in -1..1
in Integer
end



## valiableパターン ...任意の値にマッチし、マッチした値はローカル変数としてバインドされる

case 0
in a
  puts a #=> 0
end


# (_) ...変数として利用しない場合にin節で指定

case [0, 1]
in [_, _]
  :reachable
end


# ピン演算子(^変数)

#1 事前に定義したローカル変数を参照する場合

a = 1
b = 2
case [1,2]
in [^a, ^b] 
  puts "correct!"
end

#2 in節で定義した変数を参照する場合

case [1,2,3]
in [a, ^a, ^a]
  puts "値が全て同じ!"
end



## Alternativeパターン ...(|)を利用して複数のpatternにマッチさせる
# AlternativeパターンとVarialbleパターンは組み合わせられない
#- 変数にnilが格納されることを防ぐ

case 0
in 0 | 1 | 2
  :reachable
end



## Asパターン ...(=>)ロケットを利用して、マッチした値を変数に代入する
#- rescueと似た記法

case 0
in Integer => a
  a #=> 0
end

#マッチしたオブジェクト単体を指定する場合
case {name: "Alice", age: 20}
  in {name: String => name, age: 18..60 => age}
  p [name, age]
end

#マッチしたオブジェクト全体を指定
case {name: "Alice", age: 20}
in {name: String, age: 18..60} => person
  p person
end




## Arrayパターン...Arrayによるパターンマッチ
#- deconstructメソッドを利用している
# https://tech.medpeer.co.jp/entry/2019/05/13/090000

class Array
  def deconstruct
    self
  end
end

# 以下の記法すべてにマッチする

case [0, 1, 2]
in Array(0, *a, 2)
in Object[0, *a, 2]
in [0, *a, 2]
in 0, *a, 2   #[]は省略可能
end


# (_)アンダースコア ...任意の一要素

# (*変数) ...任意の長さの要素(>=0)
#- (*) ... 代入が不要な場合  




## Hashパターン ...Hashによるパターンマッチ
#- deconstruct_keysメソッドを利用している
# https://tech.medpeer.co.jp/entry/2019/05/13/090000

case { a: 0, b: 1 }
in { a: 0, b: 1 }
end


# キーの指定がシンボルのみ
#- 明示的に指定しない場合、keyに対応する名前のローカル変数に代入される

# パターンの部分一値の判定
#- 順序に注意する

# (**変数) ...任意の長さの要素(>=0)
#- (**) ...変数への代入が不要な場合
#- パターンの最後に指定できる

# **nil ...他の要素がないこと




## findパターン ...任意の要素( * )をパターンとして指定するパターンマッチ


#1から始まり5で終わる任意の配列
case [1 ,2 ,3 ,4 ,5]
  in [1, *, 5]
end

# JSON文字列

[{
"request_id": "1",
"path": "/products/1",
"status": 200,
"duration": 651.7
},
{
"request_id": "2",
"path": "/wp-login.php",
"status": 404,
"duration": 48.1,
"error": "Not found"
},
{
"request_id": "3",
"path": "/products",
"status": 200,
"duration": 1023.8
},
{
"request_id": "4",
"path": "/dangerous",
"status": 500,
"duration": 43.6,
"error": "Internal server error"
}]



## ガード式 ...in節にif文やunless文を追加
#- 最初にパターンマッチした部分にのみ、ガード条件が適用される

case [1, 2, 3, 4, 5]
in [*,n,2,*] if n == 3
  "matched: #{n}"
else
  "not matched"
end
#=> not matched



## 一行パターンマッチ ...case節を省略した記法

# 基本形

[1,2] in [Integer, Integer]


# コード例① ...キーに:name, :chidrenを持ち、かつ:childrenの値が要素一つの配列であること
person = {name: 'Alice', children: ['Bob']}
if person in {name:, children:[_]}
  "Hello #{name}"
end


# コード例② ...キーに:name, :motorを持つHashの抽出
cars = [
  {name: 'The Beatle', engine: '105ps'}
  {name: 'Prius', engine: '98ps', motor: '72ps'}
  {name: 'Prius', engine: '306ps'}
]

cars.select do |car|
  car in {name:, motor:}
end




## 右代入 ...一行パターンマッチの応用

# 式 => パターン

{name: 'Alice', children: ['Bob']} => {name:, children: [child]}
name #=> 'Alice'
children #=> 'Bob'


# その他
123 => n #=> 123

# ※注意
#- Ruby2.7ではエラーになる
#- Ruby3.0ではマッチに失敗しても、変数に値が代入されてしまう。




### 自作クラスのパターンマッチ

# deconstruct ...arrayパターンにマッチさせる
# deconstruct_keys ...hashパターンにマッチ


class Point
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def deconstruct
    [@x, @y]
  end
  
  def deconstruct_keys(_keys)
    {x: @x, y: @y}
  end
  
  def to_s
    "x:#{@x}, y:#{@y}"
  end
end

point = Point.new(10, 20)

case point
in [10, 20]
  'matched'
else
  'unmatched'
end
#=> matched

case point
in {x: 10, y: 20}
  'matched'
end



## クラス名(パターン), クラス名[パターン]

#- arrayパターン, hashパターンを利用しつつ、マッチさせたいオブジェクトの型を指定

data = [
  Point.new(10, 20),
  [10, 20]
]
data.each do |obj|
  case obj
  in Point(10, 20)
  #同じ意味 Point[10, 20]
    puts "point=#{obj}"
  in Array(10, 20)
    puts "obj=#{obj}"
  end
end


# hashパターンの場合

in Point(x: 10, y: 20)
#または
in Point[x: 10, y: 20]


## deconstrate_keys(keys)
#- 引数にはkeyの配列が格納される
#- **変数, **nil の場合、すべての要素を返す必要があるため、必ずnilが戻り値となる





### 参考

# https://qiita.com/natsuokawai/items/cc897ffeef8fb48ce89d
#- JSONのpurseを参照
# https://tech.medpeer.co.jp/entry/2019/05/13/090000
# https://tech.medpeer.co.jp/entry/2021/01/12/100000
#- Ruby3.0での変更店