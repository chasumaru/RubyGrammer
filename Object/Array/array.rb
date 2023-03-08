

### 配列オブジェクトの作成

ary = ["a", "b", "c"]
ary = Array["a", "b", "c"]
ary = Array.new(ary)
ary = Array.new(3, 'default') #=> ['default', 'default', 'default']
trucks = Array.new(5){|n| (n * n)} #=> [0, 1, 4, 9, 16]



# 以下、ary = ["a", "b", "c"] とする


### 条件判定

# empty? ...空の配列であるか
[].empty? #=> true
[].nil? #=> false

# include?(value) ...指定した値の要素が含まれているか
["a", "b", "c"].include?("a") #=> true
[].include?(nil) #=> false

# any?{条件} ...条件を満たす要素が存在するか
[].any? #=> false
["a", "b", "c"].any? #=> true
["a", "b", "c"].any?{|s| s == "d"} #=> false

# all?{条件} ...全ての要素が条件を満たすか
[nil, nil, nil].all?{|s| s.nil?} #=> true
[nil, nil, "str"].all?{|s| s.nil?} #=> false




### 参照

## 要素の参照

# array[index] ...指定要素を取得
ary[0]

# array[start..end] ...指定要素を取得
#= array.slice(start..end)
ary[0..2]
ary.slice(0..2)

# select{条件} ...条件に一致した要素を取得
#= find_all{条件}
["a", "b", "c"].select{|n| n == "a"} #=> ["a"]

# (応用例：入れ子配列の出力)
array = [1,2,3,4,5]
array.each_with_index.select {|num,index| index > 2}
#=> [[4, 3], [5, 4]]


## 重複・共通・差分の要素を参照

# uniq ...重複する要素を除去した配列を取得
["a", "a", "b"].uniq #=> ["a", "b"]

# difference(array) ...引数と差分の要素を取得
["a", "b", "c"].difference(["a", "b"]) #=> ["c"]

# intersection(array) ...引数と共通の要素を取得
["a", "b", "c"].intersection(["a", "b"]) #=> ["a", "b"]


## indexの参照

# index(val) ...指定した値の要素のindexを取得
index("a")


## 要素数の参照

# size ...配列の要素数を取得
#= length
ary.size

# count() ...指定した値の要素数を取得
ary.count(nil) #=> nilの要素数
ary.count{|a| a.nil?}
ary.count{|a| !a.nil?} #=> nilを除いた要素数を取得




### 追加 (破壊的)

## 要素の追加

# array[index] = val
ary[4] = "5個目"

# << ...末尾に要素を追加
ary << "d" #=> ["a", "b", "c", "d"]

# push() ...末尾に(複数)要素を追加
#= append()
ary.push("d", "e") #=> ["a", "b", "c", "d", "e"]
ary.append(["ab", "c"]) #=> ["a", "b", "c", ["ab", "c"]]

# unshift() ...先頭に要素を追加
#= prepend
ary.unshift("z") #=> ["z", "a", "b", "c"]
ary.prepend("abc") #=> ["abc", "a", "b", "c"]


## 配列の追加

# concat(array) ...末尾に配列を追加
ary.concat(["abc"]) #=>  ["a", "b", "c", "abc"]




### 削除

## 非破壊的に削除

# compact ...nilの要素を削除
["a", "b", nil].compact #=> ["a", "b"]

# reject{条件} ...条件の要素を削除
["a", "b", nil].reject{|n| n.nil?} #=> ["a", "b"]


## 破壊的に削除

# shift ...先頭の要素を削除
ary.shift #=> ["b", "c"]

# pop ...末尾の要素を削除
ary.pop #=> ["a", "b"]

# delete(value){デフォルト値} ...指定した値の要素を削除
ary.delete("c") #=> ["a", "b"]

# delete_at(index) ...指定したindexの要素を削除
ary.delete_at(1) #=> ["a", "c"]

# delete_if{条件} ...条件の要素を削除
[0,1,2,3].delete_if{ |n| n % 2 == 0} #=> [0, 2]




### オブジェクトの変換

## Stringへの変換

# join(string) ...引数で区切った文字列に変換
ary.join #=> "abc"
ary.join(",") #=> "a,b,c"


## Numericへの変換

# sum ...Numeric要素の合計を返す
[1, 2, 3].sum #=> 6
[1, 2, 3].sum {|e| e * e} #=> 二乗和


## Hashへの変換

# ネスト配列のハッシュ化①
ary = [["suzuki", 87], ["itou", 76], ["yamada", 69]]
hash = Hash[*ary.flatten]

# ネスト配列のハッシュ化②
ary = [["suzuki", 87], ["itou", 76], ["yamada", 69]]
hash = ary.to_h




### 順序を変える

# reverse ...逆順にする
[1, 3, 2].reverse #=> [2, 3, 1]

## 昇順ソート
[1, 3, 2].sort
[1, 3, 2].sort{ |a, b| a <=> b }
[1, 3, 2].sort_by{ |a| a[1] }
#=> [1, 2, 3]


## 降順ソート
[1, 3, 2].sort.reverse
[1, 3, 2].sort{ |a, b| b <=> a }
[1, 3, 2].sort{ |a, b| (-1) * (a <=> b) }
[1, 3, 2].sort_by{ |a| -a[1] }
#=> [3, 2, 1]


## 特殊なソート

# 二次元配列の特定の要素で並び替え
[[0,"name", "age"], [1, "Aki", "15"], [2, "chasu", "18"]].sort{ |a, b| a[2] <=> b[2] }

[[0,"name", "age"], [1, "Aki", "15"], [2, "chasu", "18"]].sort_by{  |a| a[2] }







### その他

# flatten ...ネスト配列の平坦化
["a", "b", "c", ["ab", "c"]].flatten #=>  ["a", "b", "c", "ab", "c"]

# transpose ...ネスト配列の行と列を入れ替える
#- 一次元配列 => TypeError
#- 要素数が異なる => IndexError

# ①基本形
[[1, 2],
 [3, 4],
 [5, 6]].transpose #=>  [[1, 3, 5], [2, 4, 6]]





### 応用アルゴリズム

# アルファベットの配列を整数の配列に変換
array = ["A", "B", "C", "D", "E"]
array.map{ |n| (n.ord - 65)}
#=> [0, 1, 2, 3, 4]

# 整数の配列をアルファベットの配列に変換
array = [0, 1, 2, 3, 4]
array = array.map{ |n| (n + 65).chr}
#=> ["A", "B", "C", "D", "E"]




# 参考サイト
# https://tech.raksul.com/2018/02/06/ruby_array_to_hash/
#- ハッシュへの変換