

### Hashオブジェクトの作成


## ハッシュの種類

# キーが文字列のハッシュ
h = {"key" => "value"}
# キーがシンボルのハッシュ
h = {key: "value"}
# キーも値もシンボルのハッシュ
h = {key: :value}



## デフォルト値の設定

# デフォルト値は同一オブジェクトを参照する
default = "default"
h = Hash.new{default}

# デフォルト値は異なるオブジェクトを参照する
h = Hash.new{"default"}

# デフォルト値は異なるオブジェクトを参照する
h = Hash.new { |hash, key| hash[key] = "default"}

# https://docs.ruby-lang.org/ja/latest/method/Hash/i/default.html
h.default = "default"




# 以後、hashは以下のオブジェクトとして扱う
hash = {a: 1, b: 2, c: 3}
hash1 = {"a"=> 4, "b"=> 5, "c"=> 6}


### 参照

## keyの参照

# hash.keys ...全てのキーの配列を取得
hash.keys #=> [:a, :b, :c]

# each_key ...全てのキーを参照
hash.each_key do |key|
  p "key: #{key}"
end


## valueの参照

# hash["key"] ...指定要素を取得
hash[:a] #=> 1
hash1["a"] #=> 4

# hash.values ...全てのvalueの配列を取得
hash.values #=> [1, 2, 3]

# each_value ...全てのvalueを参照
hash.each_value do |value|
  p "value: #{value}"
end


## key, valueを参照

# [key,value]のネスト配列を取得

# ①
ary = []
hash.each do |key, value|
  ary << [key, value]
end

# ② to_a
hash.to_a


# select{|key, value| 条件} ...条件に合う要素の取得
hash.select{|key, value| value.even?} #=> {:b=>2}




## 要素数を取得

# size
#= length
hash.size #=> 3




### 削除

## 非破壊的に削除

# reject{ |key, value| 条件} ...条件にあう要素を削除
hash.reject{ |key, value| value.odd? } #=> {:b=>2 }


## 破壊的に削除

# delete(key)
hash.delete(:a) #=> {b: 2, c: 3 }

# delete(key) { |key| keyがなかった場合の処理 }

# delete_if { |key, value| 条件 } ...条件に合う要素を削除
#= reject!{}
hash.delete_if{ |key, value| value.even? } #=> {:a=>1, :c=>3}




### 順序を変える


## 昇順ソート

# (keyを基準にソート)

# hash.sort ...ソートされたネスト配列を返す
hash.sort
hash.sort{ |a, b| a <=> b }
hash.sort{ |(key1, val1), (key2, val2)| key1 <=> key2 }
hash.sort_by{ |key, val| val}
#=>  [[:a, 1], [:b, 2], [:c, 3]]


# (valueを基準にソート)
hash.sort { |(key1, val1), (key2, val2)| val1 <=> val2 }
#=> [[:a, 1], [:b, 2], [:c, 3]]



## 降順ソート
# (keyを基準にソート)
hash.sort.reverse 
hash.sort{ |a, b| b <=> a }
hash.sort{ |a, b| (-1) * (a <=> b) }
hash.sort{ |(key1, val1), (key2, val2)| key2 <=> key1 }
hash.sort_by{ |key, val| -val}
#=> [[:c, 3], [:b, 2], [:a, 1]]

# (valueを基準にソート)
hash.sort { |(key1, val1), (key2, val2)| val2 <=> val1 }
#=> [[:c, 3], [:b, 2], [:a, 1]]

