

### Time_object

# 起算時からの経過時間のデータを持つ



### Timeオブジェクトの作成

## 現在時刻のTimeオブジェクトを作成
t = Time.new
t = Time.now


## 指定時刻のTime_obj作成

# t = Time.local(year,mon,day,hour,min,sec,usec)
#= mktime()
#- mon(1~12), day(1~31), hour(0~23), min(0~59), sec(0~60)
t = Time.local(2001,3,18,6,0,0,0) #=> 2001-03-18 06:00:00 +0900

# t = Time.gm(year,mon,day,hour,min,sec,usec)
# t = Time.gm(sec,min,hour,mday,mon,year,wday,yday,isdst,zone)
#= utc()
t = Time.gm(2000, 1, 1)  # => 2000-01-01 00:00:00 UTC


## 起算時からの経過秒数をもとにTime_obj作成

# at(time, in:"timezone")
t = Time.at(984862800) #=> 2001-03-18 06:00:00 +0900
t = Time.at(984862800, in:"UTC") #=> 2001-03-17 21:00:00 UTC


### 参照

## 基本的なデータを参照

# t.year
# t.month
# t.day
# t.hour
# t.min
# t.sec


## その他

# t.wday ...曜日を0(Sun) ~ 6(Sat)の整数で取得

# t.yday ...元旦(1/1)からの通算日を0..364整数で取得

# isdst? ...夏時間がある場合、true

# zone ...タイムゾーンを文字列で取得




### オブジェクトの変換

## Stringへの変換

# strftime(format) ...Timeオブジェクトを指定フォーマットの文字列に変換する
# https://www.javadrive.jp/ruby/time_class/index4.html
t.strftime("%Y-%m-%d") #=> "2001-03-18"
t.strftime("%F") #=> "2001-03-18"
t.strftime("%H時,%M分,%S秒") #=>  "06時,00分,00秒"


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

# (+)(-)...秒単位で時刻の加減算を行う

# utc_offset ...協定世界時と地方時の時差を取得
#= gmt_offset
#= gmtoff
