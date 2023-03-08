

### 各種モジュール


## Enumerable モジュール

# Array, Hash, Rangeにincludeされている

# map, select, find, countメソッドなど

# include先にeachメソッドが実装されていることが条件


## Comparableモジュール

# String, Numericにincludeされている

# <, <=, ==, >, >=, between など

# 条件はinclude先に<=>演算子が実装されていること


## Kernel モジュール

# Ojbectにincludeされている

# puts, p, pp, print, require, loop など


## Math モジュール

# 数学の計算に関するメソッド多数

# Math::PI, Math::E が定数として定義されている


## YAMLモジュール
# YAML ...インデントを利用したデータの階層構造を表すテキストフォーマット

# サンプルコード
yaml = <<TEXT
alice:
  name: 'alice'
  age: '20'
TEXT

# YAML.load(yaml) ...ハッシュへの変換
# YAML.dump(ハッシュ) ...ハッシュをYAMLテキストに変換

