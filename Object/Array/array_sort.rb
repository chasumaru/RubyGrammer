
# DBやcsvなどのデータを取得した後に並び替える

require 'date'
data = [
  {id: 1, name: '吉田(A)', ruby: 'yoshida', join_date: Date.new(2009, 4, 1)},
  {id: 2, name: '鈴木', ruby: 'suzuki', join_date: Date.new(2015, 4, 1)},
  {id: 3, name: '吉田(B)', ruby: 'yoshida', join_date: Date.new(2009, 4, 1)},
  {id: 4, name: '佐藤', ruby: 'sato', join_date: Date.new(2006, 10, 1)},
  {id: 5, name: '田中', ruby: 'tanaka', join_date: Date.new(2009, 4, 1)},
]


# idの降順でソート
pp data.sort { |a, b| b[:id] <=> a[:id] }

# nameの昇順でソート
pp data.sort { |a, b| a[:ruby] <=> b[:ruby] }

# マルチソート(name昇順, id降順)
pp data.sort { |a, b| [a[:ruby], -a[:id]] <=> [b[:ruby], -b[:id]] }

# 入社年月日(join_date)の降順
#- Dateクラスなので、(-)は算術演算子でしか使えない
pp data.sort { |a, b| b[:join_date] <=> a[:join_date] }

# マルチソート(nameの昇順, 入社年月日(join_date)の降順)
#- 降順ソートをunixtime化して直感的なコードにする
pp data.sort { |a, b|
  a_time = a[:join_date].to_time.to_i
  b_time = b[:join_date].to_time.to_i
  [a[:ruby], -a_time] <=> [b[:ruby], -b_time] }


## sort_byメソッド ...複雑なソートの実装に便利

# マルチソート(nameの昇順, 入社年月日の降順, idの昇順)
pp data.sort_by { |v|
  [v[:ruby], -v[:join_date].to_time.to_i, v[:id]] }