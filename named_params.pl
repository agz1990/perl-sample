#!/usr/bin/perl -w

use strict;
use 5.010;

sub uses_named_params {
	my %param = (
		foo => 'val1', # 提供默认参数
		bar => 'val2',
	);
	
	my %input = @_; # 以散列表的方式获取参数
	
	# 将读入的参数和默认参数结合起来
	@param{ keys %input } = values %input;
	
	# 现在可以使用诸如 $param{foo}、$param{bar} 等形式的参数了
	
	print $param{bar};
	print $param{betch};
	
}


uses_named_params (bar=> "barVal", betch => 'betchVal');



sub uses_anon_hash_params{
	my %param = (foo => 'foo default', bar => 'bar default');
	my %input;
	
	if ( ref $_[0] eq 'HASH' ){
		print "传入的是哈希表参数\n";
		# 将命名参数读入散列
		%input = %{ shift() };
	}
	else {
		my @name = qw(foo bar); # 这里设置参数的顺序
		# 给占位参数命名并存入散列
		%input = map{ $name[$_], $_[$_] } 0 .. $#_;
	}
	
	# 覆盖默认参数
	
	@param{ keys %input } = values %input;
	
	# 现在可以使用诸如 $param{foo} 、 $param{bar} 等形式了，比如：
	
	foreach(keys %param){
		print "$_: $param{$_}\n";
	}
}


# uses_anon_hash_params(123,321);

uses_anon_hash_params {foo =>3, test => 10};


sub do_params {
	my ( $arg, $default ) = @_;
	my %param = @$default;
	my %input;
	
	if( ref $$arg[0] eq 'HASH' ) {
		# 如果是命名参数，转换后存入散列
		%input = %{ $$arg[0] };
	}else {
		%input = map { $$default[ $_ *2 ], $$arg[$_] } 0 .. $#_; 
	}
	
	# 覆盖默认值
	@param { keys %input } = values %input;
	\%param;
}


sub new_uses_anon_hash_params {
	# 指向参数列表和默认值的引用
	my $param = do_params \@_,
	[ foo => 'val1', bar=> 'val2' ];
	
	# 子程序 do_params 返回一个散列引用
	# 所以现在可以使用诸如 $$param{foo}、$$param{bar} 等形式，比如：
	
	foreach(keys %{$param}){
		print "$_: $$param{$_}\n";
	}
}

new_uses_anon_hash_params {foo =>' new foo value', test => 11};


BEGIN{
	my $letter = 'a';
	
	sub show_letter{
		say "Letter is ", $letter++;
	}
}

# 示例闭包共享数据
# foreach(0 .. 10){
	# show_letter();
# }


# 使用闭包实现工厂模式
sub closure_factory{
	my $application_root = shift;
	sub{
		say $application_root;
	}
}
my $session = closure_factory('/path/to/my/app');

$session->();
