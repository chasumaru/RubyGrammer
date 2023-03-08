


### 参照・取得

str = “ABCDE”

## 特定の一文字を取得

# “ABCDE”[index]
“ABCDE”[0] #=> A

# “ABCDE”.slice(index)
“ABCDE”.slice(0) #=> "A"
“ABCDE”.slice(0..2) #=> "ABC"

## 特定の部分文字列を取得

# “ABCDE”[index,length]
“ABCDE”[1,2] #=> BC

# “ABCDE”[start,end]
“ABCDE”[1..2] #=> BC



### 挿入

# "ABCDE"[index, lnegth] = "insert_str"
“ABCDE”[2,0] = "やあ"

# insert(index, string)
“ABCDE”.insert(2, "やあ！")



### 検索

# index(search_str) #=> indexを返す
“ABCDE”.index("やあ！")

# include?(search_str) #=> 真偽値を返す
“ABCDE”.include?("パワー！")


# count(str) ...文字列の出現回数を数える
# https://docs.ruby-lang.org/ja/latest/class/String.html#I_COUNT
  '123456789'.count('27') #=> 2   
  '123456789'.count('2-8', '^4-6')   # => 4



### 文字列の削除

## 非破壊的に文字列を削除する

# delete(string) ...指定した一文字を削除
# - (-)範囲指定, (^)否定 を使用できる
s = “ABCDE”

s.delete(“BD”) #=> "ACE"
s.delete(“B-D”) #=> "AE"
s.delete(“^AB”) #=> "AB"

p s #=> "ABCDE"

## 破壊的に文字列を削除する

# delete!(string)
“ABCDE”.delete(“BD”) #=> "ACE"

p s #=> "ACE"


## 空白文字列の削除

空白文字 ...(\r, \r\n, \n, \t)
# chomp() ...末尾の空白文字を一つ削除する
# chomp!()
# chomp("") ...末尾の空白文字を全て削除する

# strip ...両端の空白文字を全て削除
# strip!

# ltrip ...先頭のの空白文字を全て削除
# rstrip ...(=chomp(""))



### 文字列の処理


## 非破壊的に文字列を追加

# (+)演算子
“ABC” + “DE” #=> "ABCDE"

# (*) 演算子
“ABC” * 2 #=> "ABCABC"


## 破壊的に文字列を追加

# concat('add_str')
s = “ABCDE”
s.concat(“BD”) 
p s #=> "ABCDEBD



### 配列に変換

# split(pattern,limit) ...patternで分割した配列を取得

# ①一文字ずつ分割
“ABC”.split("") #=> ["A", "B", "C"]

# ②正規表現で分割
“AB,CDE*F”.split(/[,|*]/) #=> ["AB", “CDE”, “F”]


# chars ...(= split(""))
“ABC”.chars #=> ["A", "B", "C"]


# scan(length) ...指定した部分文字列(,正規表現)にマッチした配列を返す
# https://docs.ruby-lang.org/ja/latest/method/String/i/scan.html

# ①部分文字列に一致した配列を返す
“ABCA”.scan("A") #=> ["A", "A"]

# ②正規表現にマッチした配列を返す
“abcdef”.scan(/../) #=> ["ab", "cd", "ef"]
“abc”.scan(/(.)/) #=> ["a", "b", "c"]
“foobarbizbaz”.scan(/(ba.)/) #=> ["bar", "baz"]
“foobarbizbaz”.scan(/(ba)(.)/) #=> [["ba", "r"], ["ba", "z"]\]


### その他

#