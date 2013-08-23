
#use strict; #厳格チェック
#use warnings; 
# 以下文字コード指定
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

print "aaa\n";

##########################################
# リファレンス機能（Cのポインタと構造体） 
##########################################

# C言語のポインタに相当するリファレンス
# \$xx, \@xx, \%xx はそれぞれの変数へのリファレンス

$aa = 1123;
$xx = \$aa;
print "$$xx\n";
print "$xx\n"; # "SCALAR(0x6e7750)"のように表示される。

# \42; # スカラのリファレンス
# \$x; # スカラのリファレンス
# \@x; # 配列のリファレンス
# \%x; # ハッシュのリファレンス
# \&x; # サブルーチンのリファレンス
# \*x; # 型グロブのリファレンス
# \\$x; # スカラのリファレンスのリファレンス

# 配列のリファレンス
@bb = ( "AAA", "BBB" );
$xx = \@bb;
print "$xx->[0]\n";
print "$xx->[1]\n";

# 
$cc{'name'} = "tanaka";
$cc{'age'} = 24;
$xx = \%cc;
print "$xx->{'name'}\n";
print "$xx->{'age'}\n";

# 連想配列とリファレンスの組み合わせ
push @persons, { "name" => "tanaka", "age" => 24 };
push @persons, { "name" => "suzuki", "age" => 28 };
foreach $person (@persons) {
    print "$person->{'name'} $person->{'age'}\n";
}


##########################################
# レキシカルスコープ変数
##########################################

# my $var; #宣言のみ
# my $var = 'hello'; #宣言と同時に値も同時に格納
# my($foo, $var); #複数の変数名を同時に宣言


$var = 'サブルーチンの外';
print $var; #「サブルーチンの外」が出力される
&example;
sub example {
    my $var = 'サブルーチンの中';
    print $var; #「サブルーチンの中」が出力される
}
print $var; #「サブルーチンの外」が出力される
