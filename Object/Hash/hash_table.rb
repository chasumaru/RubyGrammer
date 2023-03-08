

### ハッシュテーブル

## 配列の特定の文字列要素をkeyに、その出現回数をvalueに持つハッシュテーブル

# ① 基本形
a = ["c", "a", "b", "b", "b", "b", "c"]
h = Hash.new(0)
a.each{ |e| h[e] += 1 }
p h #=> {"c"=>2, "a"=>1, "b"=>4}

# ② tallyメソッド
p a.tally #=> {"c"=>2, "a"=>1, "b"=>4}



## 文字列のRangeオブジェクト()とindexの対応)
column_map = {}
("A".."Z").each_with_index do |c, i|
  column_map[c] = i
end

p column_map #=> {"A"=>0, "B"=>1, .., "Z"=>25}
