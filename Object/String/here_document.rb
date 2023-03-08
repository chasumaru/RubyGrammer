
### ヒアドキュメント



# 基本形
doc = <<'EOF'
hello!
EOF

p doc


# インデントを利用するパターン(可読性)
def letter_document1
  doc = <<-EOF
hello!
My name is Chasu.
How are you?
I'm fine.
  EOF
end

p letter_document1


# インデントを利用するパターン(可読性)
def letter_document2
  doc = <<~EOF
    hello!
    My name is Chasu.
    How are you?
    I'm fine.
  EOF
end

p letter_document2


# 利用例①
json = <<'EOS'
{
  "language": "Ruby"
}
EOS

p json