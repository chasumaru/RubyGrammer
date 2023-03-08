

### Numeric Class
# https://docs.ruby-lang.org/ja/latest/class/Numeric.html


## n進数表記 (接頭辞)

# 0b ...2進数
num = 0b1010
puts num #=> 10

# 0 ...8進数
num = 012
puts num #=> 10

# 0x ...16進数
num = 0x0A
puts num #=> 10


## n進数 → 10進数

# 2進数
binary = "1010"
num = binary.to_i(2)
puts num

# 8進数
octal = "12"
num = octal.to_i(8)
puts num

# 16進数
hex = "0A"
num = hex.to_i(16)
puts num


## 10進数 → n進数

# 2進数
num = 10
binary = num.to_s(2)
puts binary #=> "1010"

# 8進数
num = 10
octal = num.to_s(8)
puts octal #=> "12"

# 16進数
num = 10
binary = num.to_s(16)
puts binary #=> "a"



## 丸めメソッド

# round ...四捨五入
1.4.round #=> 1.4

# ceil ...切り上げ
(-1.6).ceil #=> -1
1.1.ceil #=> 2

# floor ...切り下げ
(-1.3).floor #=> -2
1.9.floor #=> 1

# truncate ...0に近づける
(-1.7).truncate #=> -1
(-1.4).truncate #=> -1
1.8.truncate #=> 1


# 丸めメソッドの拡張例①

def rtruncate(num)
  if num > 0
    num.ceil
  else
    num.floor
  end
end

rtruncate(99.2) #=> 100




## 四則演算

# div(other) ...selfをotherで割った商(Int)を取得する。内部でfloorを呼び出している。
3.div(2) #=> 1
(-3.0).div(2) #=> -2

# fdiv(other) ...selfをotherで割った商(Float)を取得する。

# quo(other) ...selfをotherで割った商(Rational/Complex)を取得する。
1.quo(3) #=> (1/3)
1.0.quo(3) #=> 0.33333333
1.quo(3.0) #=> 0.33333333
Complex(1, 1).quo(1)  #=> ((1/1)+(1/1)*i)
1.quo(Complex(1, 1))  #=> ((1/2)-(1/2)*i)


# modulo(other) ...selfをotherで割った余りを取得する。
13.modulo(4) #=> 1
11.5.modulo(3.5)

# modulo(other) ...selfをotherで割った余りを取得する。
13 % 4 #=> 1
11.5 % 3.5 #=> 1.0

# divmod(other) ...selfをotherで割った商qと余りrを取得する。[q, r]
11.divmod(3) #=> [3, 2]
11.5.divmod(3.5) #=> [3, 1.0]
(-11).divmod(3.5) #=> [-4, 3.0]



## 絶対値

# abs ...絶対値を返す
12.abs #=> 12
(-2.8).abs #=> 2.8

# abs2 ...絶対値の二乗を返す
(-2.0).abs2 #=> 4



## 正負の判定

# positive?
# negative?


### オブジェクトの変換

# to_r ...有理数に変換