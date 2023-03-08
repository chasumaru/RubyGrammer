

### 概要

# 組み込みクラスでない #=> require "date"



### Dateオブジェクトの作成

## 現在日時のDateオブジェクトを作成
d = Date.today


## 指定時刻のTime_obj作成

# d = Date.new(year, month, day)
#- mon(1~12), day(~31)
d = Date.new(2001,3,18) #=> <Date: 2001-03-18 ((2451987j,0s,0n),+0s,2299161j)>
d = Date.new(2001,3,-1) #=> <Date: 2001-03-31 ((2452000j,0s,0n),+0s,2299161j)>




### 参照

## 基本的なデータを参照

# d.day
# d.month
# d.year
# d.wday => 0(Sun) ~ 6(Sat)
# d.yday => 0 ~ 364


## その他

# t.wday ...曜日を0..6の整数で取得

# t.yday ...元旦(1/1)からの通算日を0..364整数で取得

# isdst? ...夏時間がある場合、true

# zone ...タイムゾーンを文字列で取得




### オブジェクトの変換

## Stringへの変換

# strftime(format) ...Dateオブジェクトを指定フォーマットの文字列に変換する
# https://www.javadrive.jp/ruby/date_class/index5.html
d.strftime("%Y-%m-%d") #=> "2001-03-31"
d.strftime("%F") #=> "2001-03-31"


## Numercへの変換

# to_i ...Integer
#= tv_sec
t.to_i #=> 984862800

# to_f ...Float
t.to_f #=> 984862800.0


## 配列への変換

# to_a ...[sec, min, year, day, mon, year, wday, yday, 夏時間, タイムゾーン]
t.to_a #=> [0,0,6,18,3,2001,0,77,false,"\x{938C}\x{8B9E} (\x{9557}\x{8F80}\x{8E9E})"]




### その他

# (+), (-) ...日(day)単位で時刻の加減算を行う

# (>>), (<<) ...月(month)単位での日時の加減算


