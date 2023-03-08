
# https://qiita.com/Hayate_0807/items/2e9705091b181a104621

## 標準入力
Tokyo

# #一行の一要素を取得
# line = gets
# p line
# #=> "Tokyo\n"

# 一行の一要素を取得(改行文字を除去)
line = gets.chomp
p line
#=> "Tokyo"

#数値の場合
line = gets.to_i
p line