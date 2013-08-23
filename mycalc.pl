;#####################
;# perl Library calc
;#####################
package mycalc;
# コメントを記述する場合はシャープ( # )の前にセミコロン( ; )を
# 追記する必要がある？
# 名前空間が独立している
# 呼び出しは↓
#require "mycalc.pl";
#print &calc'add(3, 5);
sub add {
    return($_[0] + $_[1]);
}
1;