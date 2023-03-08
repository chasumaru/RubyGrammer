
### 標準出力

# p ...改行, デバッグ
#- 内部でinspect

# puts ...改行, 文字列
#- 内部でto_s

# print ...改行なし, 文字列
#- 内部でto_s




### 同値性の判定

# equal? ...(=[==])。オブジェクトの値が等しければtrue
# - case式では[===]が利用される
"a".equal?("a") #=> true
"a".equal?("b") #=> false
1.equal?(1.0) #=> true

"foo" == "bar" #=> false
4 == 4.0 #=> true


# eql? ...object_idが等しければtrue。

"a".equal?("a") #=> true
"a".equal?("b") #=> false
1.equal?(1.0) #=> false







#### 定数


### 定義

# アルファベット大文字 ([A-Z]) で始まる識別子は定数
#- クラス名の参照は、文法上は定数を参照している

## 定義できる位置

#1 トップレベル
#2 クラス構文の直下
# ※メソッド内では定義できない



### 参照


## 定数を直接参照できる場合

#1 スーパークラスの定数をサブクラスから参照
class Foo
  FOO = 'FOO!'
end

class Bar << Foo
  p FOO #=> "FOO!"
end


#2 ネストの外側の定数をネストしたクラスから参照
class Foo
  FOO = 'FOO!'
  class Bar
    p FOO #=> "FOO!"
  end
end


## 定数を外部から参照する場合

# ClassName(/ModuleName)::ConstantName ...外部のクラス、またはモジュールから定数を参照する

class Foo
  FOO = 'FOO!'
end

module Baz
  BAZ = 'BAZ!'
end

class Bar
  p Foo::FOO #=> "FOO!"
  p Baz::BAZ #=> "BAZ!"
end




### アクセス制限

# private_constant :ConstantName ...クラス外から参照させない制限
#- クラスの可視性も変更可能

TAX = 2
private_constant :TAX



### オブジェクトについて

## Mutable ...変更可能なオブジェクト。破壊的な変更が適用される

# String
# Array
# Hash

# freeze ...破壊的なメソッドを無効化する
#- Array, Hashでは要素に対してもfreezeメソッドを呼べる


## Imutable ...変更できないオブジェクト。
#- 破壊的な変更が適用されないため、ブロックを使うデフォルト値の設定は不要

# Numeric
# Symbol
# True
# False
# Nil
# Range




### 変数

## 概要
# https://www.javadrive.jp/ruby/var/index1.html
# https://qiita.com/Haya4Taka/items/652f7b9147f5b1750f1d
# 予約語は使用不可



### 各変数について

#- クラス定義内 ...class ~ endまでのブロックの中で、関数定義ブロック(def ~ end)を含まない領域
#- インスタンスメソッド内 ...Initializeメソッドを含む



## ローカル変数 ...定義されたスコープ内でのみ、参照ができる変数
#- 英小文字かアンダーバー(_)で始まる
#- クラス定義内で定義したローカル変数は、クラス定義内でのみ参照できる
#- メソッド内で定義したローカル変数は、そのメソッド内でのみ参照できる



## インスタンス変数 ...クラスをインスタンス化(ClassName.new)した際に、オブジェクト毎に管理される変数
#- @変数名
#- インスタンスメソッド内で参照される
#- インスタンスメソッド内で定義する

# クラス外からの参照は、アクセサメソッドが必要
#- attr_accessor = attr_reader + attr_writer



## クラスインスタンス変数 ...クラス自身が保持するデータの変数
#- @変数名
#- クラス定義内や, クラスメソッド内で参照される。継承したクラスでは参照不可。
#- クラス定義内で定義する

# SuperクラスとSubクラスで、同名であっても必ず異なる。



## クラス変数 ...SuperクラスとSubクラスで共有される変数
#- @@変数名
#- クラス内のどこでも参照できる。継承したクラスでも参照可。
#- クラス内のどこでも定義ができる
# gemの設定情報(config値)の格納で稀に使われる



## グローバル変数 ...クラス内外を問わず、プログラムのどこからでも参照できる
#- $変数名
# むやみに設定しない




#### 名前空間(name space)


### 用途

# クラスのカテゴリ分け(巨大プログラム)

# クラス名が重複した場合



### クラス, モジュール定義
# https://qiita.com/noraworld/items/947f6725a4d617820265

##1 ネスト記法 ...クラス,モジュールを明確に定義する

#- 未定義の場合、新たに定義される。

class Sample1
  class Sample2
    def hello
      puts "hello!"
    end
  end
end


#1 ネストされたクラスはインスタンス作成時に指定が必要

# Incorrect.
sample = Sample2.new #=> uninitialized constant Sample2 (NameError)

# Correct.
sample = Sample1::Sample2.new


#2 Sample2で定義されたメソッドをSample2のインスタンスから呼び出し
sample = Sample1::Sample2.new
sample.hello #=> "hello!"


#3 Sample2で定義されたメソッドをSample1のインスタンスから呼び出し(エラー)
sample = Sample1.new
sample.hello #=> undefined method `hello' for #<Sample1:0x0000025e572c9a68> (NoMethodError)




##2 コンパクト記法 ...末端の名前空間に対してクラス,モジュールを指定する記法

#- 末端の名前空間以外は、クラス,モジュールか識別できない
#- 未定義の場合、例外となる (NameError)

class Sample1::Sample2
  def hello
    puts "hello!"
  end
end




### モジュールに属するクラス


##1 モジュール内のネストされたクラス

module Baseball
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

beginner = Baseball::Second.new('素人', '77')



##2 名前空間として利用するモジュール(Secondクラスは定義済み)

class Baseball::Second
  def sample
    puts "サンプル!"
  end
end



##3 トップレベルの同名クラスを、名前空間内にある同名クラスで参照

# ::ClassName で参照

class Second
  def initialize(player, uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

class Baseball::Second
  def initialize(digits)
    @digits = digits
    @baseball_second = ::Second.new('sample', 18)
  end
end




### クラス探索 ...(名前空間の)記法の有無によって、参照するクラスの指定方法が異なる

## 「Baseballモジュール内のネストされたSecondクラス内でFileクラスを参照する場合」
#1 Baseball::Second::File
#2 Baseball::File
#3 File


## 「Baseball::Secondクラス(コンパクト記法)でFileクラスを参照する場合」
#1 Baseball::Second::File
#2 File




### 継承関係(その他)


## クラス,モジュールの分類

# String, Numeric, Array, Hash などはClassクラスのインスタンス
# Kernelモジュールや、EnumerableモジュールはModuleクラスのインスタンス


## マメ知識

# ClassクラスはModuleクラスを継承

# ModuleクラスはObjectクラスを継承

# ObjectクラスはKernelモジュールをincludeしている

# トップレベルのself はmain(Objectクラスのインスタンス)

# トップレベルで定義されたメソッドはObjectクラスのprivateメソッドとなる
#- 不思議。mainクラスのメソッドじゃないの？






### その他

# alias ...メソッドのエイリアスを作成

# undef ...定義済みのメソッドを削除


# キャメルケースからスネークケースに変換
def underscore
  self.
end







### 用語まとめ

# https://docs.ruby-lang.org/ja/latest/doc/spec=2fdef.html#module


## Class ...オブジェクトの設計図

# ハッシュよりもデータを安全に扱える
#- クラス外からのデータを参照を制限する
#- hashと異なり、keyのタイプミスでエラーを出力する

# 継承ができる


## Instance ...クラスから作成される。
#- 共通: 属性, メソッド
#- 差異: データ


## レシーバー ...メソッドを呼び出すオブジェクト


## メソッド ...オブジェクトの振る舞い、動作

# initializeメソッド ...newメソッドで呼び出し
#- インスタンスの初期化処理
#- privateメソッドなので、クラス外からの参照は不可。インスタンスからも呼び出し不可


## 状態(State) ...オブジェクトのデータ


## 属性(attribute, property) ...オブジェクトから取得可能な値
