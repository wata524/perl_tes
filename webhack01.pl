
use strict; #厳格チェック
use warnings; 

use LWP::Simple;
use XML::LibXML;
use URI;

# 以下文字コード指定
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

#use encoding 'shiftjis';
#binmode(STDERR,':raw :encoding(shiftjis)');
#binmode(STDOUT,':raw :encoding(shiftjis)');


print "start\n";

# パーサーセットアップ
my $parser = XML::LibXML->new(); $parser->recover(1);


# ページ解析
my $url = 'http://www.tohoho-web.com/'; # Getはデフォルトで80ポートを開く。
my $data = get($url) or die $!; # 取れなければ即終了 （URL直指定の場合）

# ドメインだけの場合はparse_html_string、ファイル指定はparse_html_file
my $doc = $parser->parse_html_string($url);

print $doc;

# xpathでテーブル抽出
my @winners = $doc->findnodes(q{
	/html/body/table/tbody/tr
});

#/html/body/div[3]

print @winners;

#die $!;

# /html/body/div[3]/div/div[7]/div/div/div/table/tbody/tr
# /html/body/div[3]/div/div[3]/div/div/div/table/tbody/tr
# 定期お特便、夏のレジャーストア、、、

# 必要であれば、データをスライスしてきれいにする。（ぱーるすげー！）
# @winners = @winners[2..4]; # 配列の中から必要な部分だけを取り出している



foreach my $product (@winners) {

	#my $change = $product->find('td/div');
	
	print "$change";
	print "\n";
}


