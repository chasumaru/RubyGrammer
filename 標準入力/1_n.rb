

## 標準入力
Tokyo Osaka Kyoto

## 一行の複数要素(スペース区切り)を取得
line = gets.split
#  line = gets.split(' ')の省略形
p line
#=> ["Tokyo", "Osaka", "Nara"]


## 数値の場合
line = gets.split.map(&:to_i)
# line = gets.split.map{ |e| e.to_i }

