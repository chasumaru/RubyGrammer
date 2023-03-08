
plural = "A"..."G"
ary0 = ["A", "B", "C"]
ary1 = ["A", "B", "C", "D"]
ary2 = ["A", "B", "C", "D", "E"]

#for
for v in plural
  print "アルファベット:#{v}"
end

# #while
while ary0.any?
  box = []
  puts "要素#{ary0[-1]}取った!"
  box << ary0.pop
end

#until
until !ary1.any?
  box = []
  puts "要素#{ary1[-1]}取った!"
  box << ary1.pop
end


## イテレーター

#each
strs = []
plural.each do |v|
  strs.push(v)
  p strs
end

#times
nums = []
char_ocunt = ary2.size
char_ocunt.times do |v|
  nums << v
end
p nums


#upto
num = 10
num.upto(15) do |v|
  print "#{v},"
end
p "←upto"

#downto
num = 10
num.downto(5) do |v|
  print "#{v},"
end
p "←downto"

#step①(Int)
num = 10
num.step(21,2) do |v|
  print "#{v},"
end
p "←step①"

#step②(Float)
num = 10.5
num.step(21.5,2.5) do |v|
  print "#{v},"
end
p "←step②"


#loop
nums = {}
count = 0
loop do
  nums[count] = "default[#{count}]"
  break if nums.size > 5
  p nums
  count += 1
end

#map...Array,Hashに適用
before = [1,2,3]
after = before.map{ |n| n *= 2}
p after

#map①
before = ["1","2","3"]
after = before.map(&:to_i)
# after = before.map{|n| n.to_i}
p after


#each_with_index①
# https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/each_with_index.html
food = ["noodle", "pasta", "bread"]
food.each_with_index do |food_name, i|
puts "#{i}番目に食べたのは#{food_name}です"
end

#each_with_index②
students = [["Takuho", 22], ["chasu", 21], ["chanisan", 23]]
students.each_with_index do |(name, age), i|
puts "#{i}番目の人の名前は#{name}で年齢は#{age}歳です"
end


#with_index①
food = ["noodle", "pasta", "bread"]
food.each.with_index(30) do |food_name, i|
  puts "#{i}番目に食べたのは#{food_name}です"
end

#with_index②_char_counts①
# シンボルのキーを利用した場合
char_counts = {"A": 1, "B": 2, "C": 3}
s = "EDCBA"
s.each_char.with_index do |char, index|
  p index if char_counts[char.to_sym] == 1
end

#with_index②_char_counts①
# 文字列のキーを利用した場合
char_counts = {"A"=>1, "B"=>2, "C"=>3}
s = "EDCBA"
s.each_char.with_index do |char, index|
  p index if char_counts[char] == 1
end