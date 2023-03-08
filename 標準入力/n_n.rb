
## 標準入力
Tokyo Osaka Kyoto
Japan USA China

lines = []
# 行が存在する限り、行ごとの内容(line)をlines配列に追加する
while line = gets
  lines << line.chomp.split
end
p lines
#=> [["Tokyo", "Osaka", "Kyoto"], ["Japan", "USA", "China"]]

## 短い記法①
lines = readlines(chomp: true).map{|line| line.split}
p lines

## 短い記法② ...n行m列の標準入力
lines = Array.new(n){ gets.chomp.split }



## 数値の場合

# 標準入力
1 2 3
4 5 6

lines = []
while line = gets
  lines << line.chomp.split.map(&:to_i)
end
p lines
#=> [[1, 2, 3], [4, 5, 6]]

## 短い記法 ...n行m列の標準入力
m = Array.new(n){ gets.split.map{ |e| e.to_i } }