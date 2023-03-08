
# https://docs.ruby-lang.org/ja/latest/class/Proc.html
# https://losenotime.jp/ruby-proc/

### 概要

# lambda ...Proc_objの一種。以下の特徴を持つ。


###1 引数チェック ...引数の個数を厳密に指定する

## Procの場合 ...実引数が多い場合、先頭から必要な実引数のみ参照する。実引数が少ない場合、不足分にnilを割り当てる。

# procサンプルコード①
proc = proc { |var1| p var1 }
proc.call( 'proc', 'lambda') #=> "proc"

# procサンプルコード②
proc = proc { |var1, var2| p [var1, var2] }
proc.call( 'proc') #=> ["proc", nil]


## lambdaの場合 ...エラーが発生する

# lambdaサンプルコード①
lambda = lambda { |var| p var }
lambda.call('lambda!')
lambda.call('lambda!', 'lamb!') #=> wrong number of arguments (given 2, expected 1) (ArgumentError)

# lambdaサンプルコード①
lambda = lambda { |var1, var2| p [var1, var2] }
lambda.call('lambda!', 'lamb!')
lambda.call('lambda!') #=> wrong number of arguments (given 1, expected 2) (ArgumentError)



###2 returnの挙動

## Procの場合 ...return後にメソッドを抜ける

# procサンプルコード
def proc_method
  proc = Proc.new { return p "proc"} # <=ここで抜ける
  proc.call
  p "proc method"
end
proc_method #=> "proc"


## lambdaの場合 ...returnで抜けずに、最後まで実行する

def lambda_method
  lambda1 = lambda { return p "lambda"} # <=抜けない
  lambda1.call
  p "lambda method"
end

lambda_method #=> "lambda"
              #=> "lambda method"






### lambdaオブジェクトを作成する

# lambda{}
lambda = lambda { |var| puts var}

# ->(){}
lambda = ->(var) {puts var}

# ->{} ...ブロック引数を利用しない場合
lambda = -> {puts "lambda" }