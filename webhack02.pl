use strict;
use warnings;
use LWP::UserAgent;
use HTML::TreeBuilder::XPath;

# 以下文字コード指定 (しなくていい。。。)
#use utf8;
#binmode STDIN, ':encoding(cp932)';
#binmode STDOUT, ':encoding(cp932)';
#binmode STDERR, ':encoding(cp932)';

# urlを指定する
my $url = 'http://www.yahoo.co.jp';

# IE8のフリをする
my $user_agent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)";

# LWPを使ってサイトにアクセスし、HTMLの内容を取得する
my $ua = LWP::UserAgent->new('agent' => $user_agent);
my $res = $ua->get($url);
my $content = $res->content;

# 解析とダンプ
my $tree = HTML::TreeBuilder::XPath->new;
$tree->parse($content);
my @items =  $tree->findnodes(q{//*[@id='topicsfb']//li});
print $_->as_text."\n" for @items;

die $!;
