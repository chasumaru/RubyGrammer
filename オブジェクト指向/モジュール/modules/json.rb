


### 概要


## JSON ...JSのオブジェクト記法を利用したテキストデータフォーマット。Hashに似た形式

# 例
{“foo” : 123}



### 基本の流れ


##1
# http通信を行う。
require ‘net/http’
# URIを使う
require ‘uri’

##2 引数の文字列からURIオブジェクトを作成
uri = URI.parse('http://example.com/hoge/1')

##3. URIを元にhttpリクエストを行い、JSONデータを取得
response = NET::HTTP.get(uri)

##4. 取得したデータをparseメソッドでHashに変換
result = response.parse




### その他

## メソッド

# require ‘json’ ...to_jsonメソッドを追加するため

# to_json ... JSON文字列の取得。Array,Hashに適用

# JSON.parse() ...JSONデータをHash_objに変換

# Net::HTTP#start(server_name,port) ...HTTP セッションを開始

# Net::HTTP#get(URI_obj) ...レスポンスを取得
#- NET::HTTP#startがある場合, pathの指定で良い

# URI.parse(文字列)...URI_objの取得




## 参照サイト