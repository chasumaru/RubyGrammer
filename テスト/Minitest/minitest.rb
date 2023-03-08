

### 概要

# Ruby のデフォルトのテストフレームワーク


### テストの定義

## 前提知識

require 'minitest/autorun'
class SampleTest < Minitest::Test
  def test_sample
    assert_equal 'Ruby', 'ruby'.upcase
  end
end

# require 'minitest/autorun' ...テスト実行に必要なライブラリ

# ファイル名に対応したクラス名を指定
sample_test.rb

# メソッド名は test_ から始めて定義する

# setupメソッド ...テストメソッド実行時に呼ばれるメソッド
#- インスタンス変数などを定義

def setup
  @station = Station.new(:umeda)
  @airport = Airport.new(:haneda)
end










# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# require 'minitest/autorun'
#       class Exam1Test < Minitest::Test
#         def test_result
#           expected_value = <<~TEXT
#             truck_1:1
#             truck_2:2,4
#             truck_3:3
#           TEXT
#           result = `ruby exam_1/main.rb 1:50 2:30 3:40 4:10`
#           assert_equal(expected_value, result)
#         end
#       end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




