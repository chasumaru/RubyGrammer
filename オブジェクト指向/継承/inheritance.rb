



### 概要
# https://docs.ruby-lang.org/ja/latest/class/Class.html
# https://www.javadrive.jp/ruby/inherit/

## クラス継承の用途

# is_aの関係が成立する
# プログラムの再利用性を高める


## 特徴

# Classオブジェクトの特異メソッド

# Gemの名前空間を設定(モンキーパッチを防ぐ)

# SubクラスではSuperクラスのメソッドを参照できる


## クラス継承の定義

class SuperSample
  def super_method
    print "Superクラスのメソッドです!"
  end

  def override_method
    print "Super!!"
  end
end

class SubSample < SuperSample
  def sub_method
    print "Subクラスのメソッドです!"
  end
end




### オーバーライド ...SubクラスでSuperクラスの同名メソッドを定義することで、メソッドを上書きする。

class SubSample < SuperSample
  def override_method
    print "Sub!!"
  end
end

sub = SubSample.new
sub.override_method #=> "Sub!!"


## super ...オーバーライドしたメソッド内で、明示的にSuperクラスのメソッドを参照する
#- SubクラスでSuperクラスのメソッドに機能を追加する
#- Superクラスのメソッドに引数をそのまま渡す

class SubSample < SuperSample
  def override_method
    super
    print "Sub!!"
  end
end

sub = SubSample.new
sub.override_method #=> Super!!Sub!!


## super() ...引数を指定可能
#- superだけだと、Subクラスの引数が自動的にSuperクラスのメソッドに渡される。

class SuperSample
  def override_method(v1, v2)
    puts "Super!!,#{v1},#{v2}"
  end
end

class SubSample < SuperSample
  def override_method(v1, v2)
    super("Super1!", "Super2!")
    puts "Super!!,#{v1},#{v2}"
  end
end

sub = SubSample.new
sub.override_method("Sub1!", "Sub2!")
#=> Super!!,Super1!,Super2!
#=> Super!!,Sub1!,Sub2!




# ### 不明

# ## Superクラスのメソッドに引数をそのまま渡す場合
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# def initialize(*)
#   super
# end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# ## Superクラスのメソッド(キーワード引数を持つメソッド)に引数をそのまま渡す場合
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# def initialize(*, **)
#   super
# end

# def initialize(...)
#   super
# end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# # ※引数名のない(*)や(**)を指定しても、superがメソッド内にない場合、「余分に渡された引数を無視するという意味になる。」
# # (by プロを目指すためのRuby入門 p.276)




### その他

# instance_of?(ClassName) ...クラスの判定

# is_a?(ClassName) ...クラス継承の判定

# ancestors ...継承, モジュールの優先度を取得








