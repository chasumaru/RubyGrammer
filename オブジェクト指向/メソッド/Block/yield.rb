
# https://losenotime.jp/ruby-proc/

### 概要

# ブロック付きメソッドを定義する。メソッド内のyieldでblockを参照する

# procとの違いは、メソッドの仮引数を省略できるcallメソッドであること。


### 基本の流れ

##1 ブロックを指定してメソッドを実行

##2 メソッド内のyieldにより、指定したブロックが呼び出される。このとき、yieldの引数はブロック変数に渡される。



### ルール

## yieldの基本①

# サンプルコード①

def method1
  yield
end
method1 { p 'block' } #=> "block"
method1 #=>  `method1': no block given (yield) (LocalJumpError)

# メソッド内にyieldがある場合、ブロックが渡されないとエラー。

# block_given? ...メソッドにblockが渡されたかの真偽値を返す。

# サンプルコード②
def method1
  if block_given?
    yield
  else
    puts "ブロックがないよ!"
  end
end

method1 { p 'block' } #=> "block"
method1 #=> "ブロックがないよ!"


## yieldの基本②

# ブロックに引数を渡すサンプルコード

def method2
  # ブロック変数varに実引数'arg'を渡す
  yield('arg')
end
method2 { |var| p var } #=> "arg"


# ※ブロック変数とyield引数の個数は、対応してなくてもエラーにならない。








# # 不明
# ブロックを引数として明示的に受け取る

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# def hi(&引数)
#   sample = 引数.call('やあ')
#   greeting_en(&引数)
# end

# def greeting_en(&引数)
#   greeting = 引数.call('hello')
# end

# hi do |ブロック変数|
#  処理
# end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 1. メソッド呼び出しにより、ブロックをメソッドに渡す
# 2. [&引数] でブロックを引数として受け取る
# 3. [引数.call]によりブロックを実行
# 4. call()の引数をブロックに、ブロック変数として渡す

# ※ブロック引数はメソッド定義に１つしか指定できない
# - ブロック引数は外部のメソッドに引数として渡すことが可能




