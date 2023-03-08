

### 概要

## 例外の発生を想定し、例外が発生した場合の処理を記述する

# 例外(Error) ...発生するとその後の処理が実行されず、停止する



### 基本構文

begin
  value = 10 / 0
  puts value
rescue
  puts '0で割り算はできません。'
end
#=> "0で割り算はできません。"


# bigin ~ rescueの間に、例外が想定されるコードを記述し、rescue ~ endの間に例外が発生した場合の処理を記述する。



## 例外オブジェクトの取得

# rescue => e ...ロケットを使って、変数eに例外オブジェクトを代入する

begin
  value = 10 / 0
  puts value
rescue => e
  p e
end



## 例外の種類ごとに処理を区別する

# rescue ErrorName ...想定されるエラーを指定する
begin
  #fooでエラーが発生
  foo
  10 / 0
rescue ZeroDivisionError => e
  puts '0で割らないでください'
rescue => e
  puts 'その他'
end

puts '終了'



## リトライ処理

# retry ...途中でエラーが発生した場合に、再度処理を実行する
#- 無限ループに注意

num = 0

begin
  p 10 / num
rescue ZeroDivisionError => e
  p e
  num = 3
  retry
end

#=> #<ZeroDivisionError: divided by 0>
#=> 3



## 明示的に例外を発生させる

# raise ErrorName ...指定した例外を発生させる。デフォルトはRuntimeError

begin
  raise ZeroDivisionError
rescue => e
  p e
end
#=> #<ZeroDivisionError: ZeroDivisionError>



## 独自の例外クラスを作成する

class SelfError < StandardError; end

begin
  raise SelfError
rescue => e
  p e
end

#=> #<SelfError: SelfError>



## 例外処理で必ず実行される処理

# ensure ...例外の有無によらず、必ず実行される処理

begin
  raise
rescue => e
  p e
ensure
  puts '必ず実行される'
end
#=> RuntimeError
#=> 必ず実行される




### 例外オブジェクトのメソッド


# backtrace ...エラーの発生順序を出力
begin
  value = 10 / 0
  puts value
rescue => e
  p e.backtrace
end


# full_message ...例外に関する整形されたメッセージを出力
begin
  value = 10 / 0
  puts value
rescue => e
  p e.full_message
end