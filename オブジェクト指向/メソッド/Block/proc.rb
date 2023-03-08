
# https://qiita.com/k-penguin-sato/items/7f98335ef631ea5ce7ad
# https://docs.ruby-lang.org/ja/latest/class/Proc.html
# https://losenotime.jp/ruby-proc/

### 概要

# Proc ...ブロックのオブジェクト。callで呼び出せる。

# ブロックをprocオブジェクト化すると、メソッドの引数にprocを渡すことができる。


### Procオブジェクトを作成

# Prock.new {}
proc = Proc.new { p "proc!" } #=> "proc!"

# Prock.new do ~ end
proc = Proc.new do
  p "proc!"
end
#=> "proc!"

# proc {}
proc = proc { p "proc!"} #=> "proc!"


#  Prock.new { |var| ... }
proc =  Prock.new { |var| p var}
proc.call("variable") #=> "variable"



# 以下、proc = Proc.new { p "proc!" }として扱う。



### Procオブジェクトの参照

# proc.call
proc.call #=> "proc!"





### ブロック引数の利用

# ブロック引数 ...(&オブジェクト)として定義。to_procが内部で呼ばれる。

## 基本の流れ

# サンプルコード

def method2(&proc)
  proc.call 
end
method2 { p 'block' } #=> "block"

#1 仮引数(&proc)に渡されたブロックをprocオブジェクトに変換し、proc変数に代入する
#2 proc.call でprocオブジェクトを参照する









## 不明
# proc = proc {処理} #Kernelモジュール

# #lamdaリテラル
# ->(ブロック変数) {処理}
# lamda  {|ブロック変数| 処理}




# • arity ...ブロックパラメータの個数を取得



# Lamdaリテラル
# • 呼び出す際にcallメソッドの引数の過不足でエラーが生じる。
# → 引数の個数を厳密に指定

# • lamda? ...Proc_objがlamdaであるか




# まとめ
# - Proc はBlockと異なり、複数のオブジェクトを引数としてメソッドに渡せる。
# - 
