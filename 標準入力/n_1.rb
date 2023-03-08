

## 標準入力
Tokyo
Osaka
Kyoto

## 複数行の要素を行ごとの配列として取得
# lines = readlines
# p lines
# #=> ["Tokyo\n", "Osaka\n", "Kyoto\n"]

lines = readlines.map(&:chomp)
p lines
# #=> ["Tokyo", "Osaka", "Kyoto"]


## 上記のメソッドと同じ意味①
# lines = readlines
# len = lines.length
# i = 0
# while i < len
#     lines[i] = lines[i].chomp
#     i += 1
# end


## 上記のメソッドと同じ意味②
lines = Array.new(3){ gets.to_s}


## 数値の場合
lines = readlines.map(&:to_i)
