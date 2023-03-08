

# サンプル①： 階乗(!)の計算
factorial(n)
  result = 1
    (1..n).each {|num| result *= num}
  result
end

factorial(5)
