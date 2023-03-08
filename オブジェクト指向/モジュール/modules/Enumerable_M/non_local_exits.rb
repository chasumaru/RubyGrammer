


## return ...明示的にメソッドの戻り値を指定する


## break ...(条件に一致したら)最も内側のループを終了する

# 偶数に該当すると、breakする処理
def cal_break
  numbers = 1..6
  numbers.shuffle.each do |n|
    target = n
    break if target.even?
  end
  target*10
end


## next ...(条件に一致したら)ループ処理を一つスキップする

#偶数に該当すると、スキップする
numbers = [1, 2, 3, 4]
numbers.each do |n|
  next if n.even?
  puts n
end


## redo ...(条件に一致したら)ループ処理を一つやり直す

# 'はい'と言うまで処理を実行
foods = ['トマト', 'ナス']
foods.each do |food|
  print "#{food}は好きですか? => "
  answer = ['はい', 'いいえ'].sample
  puts answer
  
  redo unless answer == 'はい' 
end


## catch/throw ...一番外側のループまで脱出する

# https://docs.ruby-lang.org/ja/latest/method/Kernel/m/throw.html


# fruits = ['apple', ban]
# catch :tag do
#   fruits.each do |fruit|
#     fruit.each do |bugs|
#       bugs.each do |bug|
#         if bug.color == 'brown' && bug.norse == 'long'
#           puts 'weevil!!!'
#           throw :done, "完了！"
#         end
#       end
#     end
#   end
# end