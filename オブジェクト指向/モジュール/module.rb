

### 概要
# https://qiita.com/shiopon01/items/fd6803f792398c5219cd


## モジュールの用途

# is_aの関係が成立しない(継承は不適である)が、共通の機能を定義したい場合

# 複数のクラスから呼び出せるメソッドを定義したい場合

# Gemの名前空間を設定(モンキーパッチを防ぐ)


## 特徴

# モジュールからインスタンスは作成できない

# モジュールやクラスの継承はできない


## モジュールの定義

class Sample
end

module SampleModule
  def some_methods
    puts "モジュールのメソッド!"
  end
end



### 参照

## MixIn ...モジュールの機能をクラスに追加すること(Include, Extend)。多重継承を実現する。
#- privateメソッドになる
#- self はMixIn先のオブジェクトになる


## メソッド参照


## モジュール関数として参照

# モジュール関数 ...MixInとしても、モジュールの特異メソッドとしても呼び出せるメソッド

# module_name_function :メソッド名 ...module定義内で記述すると、モジュール外部から参照可能になる。
module_function :some_methods

# privateキーワードのように、module_function 以下が全てモジュール関数となる
module_function
def some_method1
  puts "モジュールのメソッド1!"
end
def some_method2
  puts "モジュールのメソッド2!"
end

#- Module_name.メソッド名
=> SampleModule.some_methods



## インスタンスメソッドとして参照

# include ModuleName ...モジュールの中で定義したメソッドを、単に「メソッド名」だけで呼び出せる
include SampleModule

#- インスタンス.メソッド名
sample = Sample.new
=> sample.some_methods



## クラスメソッドとして参照

# extend ModuleName ...モジュールを対象のクラスにextendする
class Sample
  extend SampleModule
end

#- ClassName.メソッド名
=> Sample.SampleModule
# クラス構文直下と、クラスメソッド内で呼び出せる。



## インスタンスの特異メソッドとして参照

# インスタンス.extend ModuleName ...モジュールを特定のインスタンスにextendする。(そのインスタンスの特異メソッドとなる)
sample = Sample.new
sample.extend SampleModule

#- インスタンス.メソッド名
sample.some_methods #=> "モジュールのメソッド!"
sample1 = Sample.new
sample1.some_methods #=> NameError



## モジュールの特異メソッドとして参照

# self.メソッド名 ...モジュール単体でメソッドを呼び出す
module SampleModule
  def self.some_methods
    puts "モジュールのメソッド!"
  end
end

#- ModuleName.メソッド名
SampleModule.some_methods


# class << self でモジュールの特異メソッドを複数定義できる
module SampleModule
  class << self
    def some_method1
      puts "モジュールのメソッド1!"
    end
    def some_method2
      puts "モジュールのメソッド2!"
    end
  end
end



### Module関連メソッド


# クラス名.include?(モジュール名) ...モジュールがincludeされているか
Sample.include?(SampleModule) #=> true

# クラス名.included_modules ...includeされたモジュールの配列
Sample.included_modules #=> ["SampleModule"]

# クラス名.ancestors ...モジュールと継承の配列を返す
String.ancestors # => [String, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]

# obj.class.is_a?(モジュール名) ...継承の確認。モジュールならfalse。
sample = Sample.new
sample.class.is_a?(SampleModule) #=> false






### その他

# Object.include ModuleName ...あらゆるオブジェクトで参照可能にする


## 注意事項

# module内でインスタンス変数を参照すべきではない
#- インスタンス変数はそのクラスに依存する変数であるから、モジュールの定義に反する
#- アクセサメソッド経由でデータを取得するべき


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module NameChanger
  def change_name
    self.name = 'sample'
  end
end

class User
  include NameChanger
  attr_accessor :name
  #省略
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





## 外部ライブラリの設定値を保持

# 外部ライブラリでは、クラスインスタンス変数をモジュールの設定値(config)を保持するために利用
#- シングルトンパターン

# prepend ...メソッド探索において、モジュールを優先するMixIn
#- includeの代わり

# refinments ...独自メソッド, Overrideのスコープの設定
#- 思わぬバグやエラーの防止

module SampleModule
  refine String do
    def original_method
      puts "独自メソッド!"
    end
  end
end
#usingでrefinesを有効化
using SampleModule



