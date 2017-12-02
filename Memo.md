## 二重コロン記法 レシーバ::メソッド
- メソッド呼び出しに使用
- レシーバ.メソッドと同じ
```rb
class Colon
  def method
    puts "Colon"
  end
end

c = Colon.new
c::method
# Colon
```

## ブロック処理
```rb
numbers = [38, 74, 56, 48, 87, 68, 81, 49]
puts numbers.find {|item| item % 7 == 0 }
# 7で割り切れるもの出力
```

## メソッドのreturn
- rubyでは*最後に評価された値が返る*
```rb
def if_expression(flag)
  if flag
    "NG"
  else
    "OK"
  end
end
#if_expression false => "OK"

def if_modifier(flag)
  "OK"
  "NG" if flag
end
if_modifier(false) => nil
```
- 後置if
  - 右辺の条件が成立する時に、左辺の式を評価してその結果を返します。 条件が成立しなければ nil を返す
