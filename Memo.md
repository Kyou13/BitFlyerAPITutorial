## 二重コロン記法 レシーバ::メソッド
- メソッド呼び出しに使用
- レシーバ.メソッドと同じ
  - 二重コロン記法はメソッド呼び出し+定数呼び出し
  - ドット記法はメソッド呼び出しのみ
  - Rubyでは，クラスやモジュールも定数として扱われる．
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

# 特殊注文
- IFD(if done)
  - 新規注文と同時に、その新規注文が成立した際に初めて有効になる決済注文をセットで出す注文方法
- OCO(One Cancels the Other)
  - 新規注文または決済注文において、異なる2種類の指値（ストップ）注文を同時に出しておき、いずれか一方が成立したら自動的にもう片方がキャンセルとなる注文方法
- IFO(IFD + OCO)
  - IFDの最初の注文が確約した後にOCO注文を自動で注文

ボリンジャーバンド
