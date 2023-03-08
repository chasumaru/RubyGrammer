


#### メソッド定義

### メソッドの種類

# グローバル関数
# Kernel モジュールのメソッド
# 特異メソッド
# クラスメソッド
# インスタンスメソッド



### キーワード引数

# メソッドの引数を明確化するために、キーワード引数を設定する
# ※キーワード引数はシンボルではないため参照時に注意

# 引数の順序に指定がない


## メソッドの比較

# 通常のメソッドの例
def greet(first_name, last_name, age)
  puts "#{first_name} #{last_name}、#{age}歳です。" 
end
greet("山田", "太郎", 20)


# キーワード引数を利用したメソッドの例
def greet(first_name:, last_name:, age:)
  puts "#{first_name} #{last_name}、#{age}歳です。"
end
greet(first_name: "山田", last_name: "太郎", age: "20")



## デフォルト値を設定したメソッドの比較

# 通常のメソッドの例
  def greet(first_name, last_name, age = 30)
    puts "#{first_name} #{last_name}、#{age}歳です。"
  end

# キーワード引数の例
def greet(first_name:, last_name:, age: 30)
  puts "#{first_name} #{last_name}、#{age}歳です。"
end


#- 任意のキーワード引数を受けとりたい場合、メソッドの引数に**hashを設定する(double splat parameter)

# コード例①
def greet(**params)
  first_name=params[:first_name]
  last_name=params[:last_name]
  age=params[:age]
  puts "#{first_name} #{last_name}、#{age}歳です。" # -> 山田 太郎、20歳です。
end
greet(first_name: "山田", last_name: "太郎", age: "20")


#- メソッド呼び出し時、キーワード引数のメソッドにhashを引数として渡す場合は、**hashとすることが必要

# コード例②
params = {sample: 1, sample2: 2}
buy_burger('fish', params) #=> #ArgumentError!
buy_burger('fish', **params)



### その他

# 通常の引数としてhashを受け取る場合、hashを最後の引数にすると、メソッド呼び出し時の()が省略できるらしい。
# **nil ...キーワード引数を受け取らない(ruby>=2.7)

## 通常のメソッド, 呼び出し側の余分な引数を配列として取得
# コード例
def greed(need, *array)
  allgreeding = ""
  array.each do |greeding|
    allgreeding << greeding << ", "
  end
  puts(need + "," + allgreeding)
end
greed("Yuki", "Hi", "Hello")





#### トップレベル


### 概要

# クラスを定義する
# メソッドを定義する

# self ...レシーバとしてmainを返す
#- レシーバ ...メソッドを実行しているオブジェクト
#- main ...Object クラスのインスタンス




#### メソッド詳細


### インスタンスメソッド ...インスタンスから呼び出されるメソッド

#インスタンスメソッド内で、クラスメソッドを呼び出せる。

## インスタンスメソッドの種類

# initializeメソッド ...インスタンス生成時に必ず実行する処理
#- 特別なインスタンスメソッド



### クラスメソッド ...クラスから呼び出されるメソッド

# インスタンスのデータを扱わない処理
#- クラスメソッド内では、インスタンスメソッドを呼び出せない。


## クラスメソッド定義

# 定義例①
class Sample
  def self.class_method
    puts "クラスメソッド!"
  end
end

# 定義例②
class Sample
  def Sample.class_method
    puts "クラスメソッド!"
  end
end

# 定義例③
class Sample
  class << self
    def class_method
      puts "クラスメソッド!"
    end
  end
end

# 定義例④
class Sample
end
class << self
  def class_method
    puts "クラスメソッド!"
  end
end




### 特異メソッド(Singleton Method) ...インスタンスに対して定義されるメソッド

# ※Numericには特異メソッドを定義できない

# クラスメソッド ...Classクラスのインスタンス(○○クラス)に対して定義する
# 特異メソッド ...○○クラスのインスタンス(○○.new)に定義する
#- 特異クラス(Singleton Class)に定義される


# 特異メソッドの例

sample1 = Sample.new
def sample1.bar
  '特異メソッド!'
end

sample1.bar #=> '特異メソッド!'
sample2.bar #=> undefined method `bar' for #<Sample:0x000001d3b576ff40> (NoMethodError)


## 特異メソッドの関連メソッド

# Class.singleton_methods ...特異メソッドを出力
sample1.singleton_methods #=> [:bar]
Sample.singleton_methods #=> [:class_method]

# defeine_singleton_method :method {} ...レシーバのオブジェクトに対して、特異メソッドを定義する
array = []
array.defeine_singleton_method :add do |item|
  self << (item * 2)
end
array.add 'foo'
array.add 'bar'

p array #=> ['foofoo', 'barbar']
p array.singleton_methods #=> [:add]



### アクセス制限 ...メソッドに以下の目的で設ける

# 外部からメソッドを隠蔽する場合
# 機能実装のために、他のインスタンスを参照する必要がある場合

## public ...デフォルト。クラス内外から参照できる
# self以外のレシーバで呼び出しが可能

## protected
# クラスとサブクラスからのみ呼び出し可能で、外部からは呼び出せない。
# self以外のレシーバで呼び出しが可能

## private
# クラスとサブクラスからのみ呼び出し可能で、外部からは呼び出せない。
# レシーバを指定できない。(2.7~)
# https://qiita.com/kidach1/items/055021ce42fe2a49fd66




### 注意事項

# method というメソッド名はエラー
# respond_to?(メソッド名) ... メソッドの有無を判定


## モンキーパッチ ...メソッドのオーバーライドのこと
# https://lhiroki1205.hatenablog.com/entry/2019/10/06/094356
#- 予期せぬバグ,曖昧なメソッド定義, バージョン不整合に注意






