#!/usr/bin/perl
use strict;

open rFILE1,"source1.txt" || die"open error";     #全ての要素を格納するファイル
open rFILE2,"keiseifile.txt" || die"open error";  #形勢データを格納するファイル
open rFILE3,"senkeifile.txt" || die"open error";  #戦型データを格納するファイル
open rFILE4,"timefile.txt" || die"open error";    #時間データを格納するファイル
open rFILE5,"syobufile.txt" || die"open error";   #盛り上がりデータを格納するファイル
open rFILE6,"tefile.txt" || die"open error";      #手の意味データを格納するファイル
open rFILE7,"kyokumenfile.txt" ||die"open error"; #局面データを格納するファイル
open wFILE1,"> source2.txt" || die"open error";   #rFILE1の書き込みと時間を格納するファイル
open wFILE2,"> keisei.txt" || die "open error";   #wFILE1の形勢関連の書き込みを格納するファイル
open wFILE3,"> senkei.txt" || die "open error";   #wFILE1の戦型関係の書き込みを格納するファイル
open wFILE4,"> time.txt" || die "open error";     #wFILE1の時間関係の書き込みを格納するファイル
open wFILE5,"> syobu.txt" || die"open error";     #wFILE1の盛り上がりの書き込みを格納するファイル
open wFILE6,"> te.txt" || die"open error";        #wFILE1の手の意味に関係する書き込みを格納するファイル
open wFILE7,"> tenum.txt" || die"open error";     #wFILE1の符号を含む書き込みを格納するファイル
open wFILE8,">kyokumen.txt" ||die"open error";    #wFILE1の局面情報を含む書き込みを格納するファイル

my @lines1=<rFILE1>;
my @lines3=<rFILE2>;
my @lines5=<rFILE3>;
my @lines7=<rFILE4>;
my @lines9=<rFILE5>;
my @lines11=<rFILE6>;
my @lines13=<rFILE7>;
my $i=0; #「wFILE1用」カウンター
my $n=0; #「wFILE2用」カウンター
my $x=0; #「wFILE3用」カウンター
my $y=0; #「wFILE4用」カウンター
my $z=0; #「wFILE5用」カウンター
my $a=0; #「wFILE6用」カウンター
my $b=0; #「wFILE7用」カウンター
my @data_data1=(); #全文を一行ごとに格納するための配列
my @data_data2=(); #全文を一行ごとに格納するための配列(形勢用)
my @data_data3=(); #全文を一行ごとに格納するための配列(戦型用)
my @data_data4=(); #全文を一行ごとに格納するための配列(時間用)
my @data_data5=(); #全文を一行ごとに格納するための配列(盛り上がり用)
my @data_data6=(); #全文を一行ごとに格納するための配列(手の意味用)
my @data_data7=();

foreach my $data(@lines1){  #全ての要素を読み込む

	$data_data1[$i]=$data;  #一行ごとに格納
	my @lines2=split(/\s+/,$data_data1[$i]); #ID,時間,書き込みにわけて格納
	$lines2[3]=~ s/１/1/g;
	$lines2[3]=~ s/２/2/g;
	$lines2[3]=~ s/３/3/g;
	$lines2[3]=~ s/４/4/g;
	$lines2[3]=~ s/５/5/g;
	$lines2[3]=~ s/６/6/g;
	$lines2[3]=~ s/７/7/g;
	$lines2[3]=~ s/８/8/g;
	$lines2[3]=~ s/９/9/g;
	print wFILE1 "$lines2[2] $lines2[3]\n"; #lines2[2]=時間,lines2[3]=書き込み


#形勢関連の書き込みを「wFILE2」に格納する
foreach my $data2(@lines3){
	$data_data2[$n]=$data2;
	my @lines4=split(/\n/,$data_data2[$n]);
	if($lines2[3]=~/\Q@lines4\E/){
	print wFILE2 "$lines2[2] $lines2[3]\n";
	}else{}
	$n++;
}

#戦型関連の書き込みを「wFILE3」に格納する
foreach my $data3(@lines5){
	$data_data3[$x]=$data3;
	my @lines6=split(/\n/,$data_data3[$x]);
	if($lines2[3]=~/\Q@lines6\E/){
	print wFILE3 "$lines2[2] $lines2[3]\n";
	}else{}
	$x++;
}

#時間関連の書き込みを「wFILE4」に格納する
foreach my $data4(@lines7){
	$data_data4[$y]=$data4;
	my @lines8=split(/\n/,$data_data4[$y]);
	if($lines2[3]=~/\Q@lines8\E/){
	print wFILE4 "$lines2[2] $lines2[3]\n";
	}else{}
	$y++;
}

#盛り上がり関連の書き込みを「wFILE5」に格納する
foreach my $data5(@lines9){
	$data_data5[$z]=$data5;
	my @lines10=split(/\n/,$data_data5[$z]);
	if($lines2[3]=~/\Q@lines10\E/){
	print wFILE5 "$lines2[2] $lines2[3]\n";
	}else{}
	$z++;
}

#手の意味関連の書き込みを「wFILE6」に格納する
foreach my $data6(@lines11){
	$data_data6[$a]=$data6;
	my @lines12=split(/\n/,$data_data6[$a]);
	if($lines2[3]=~/\Q@lines12\E/){
	print wFILE6 "$lines2[2] $lines2[3]\n";
	}else{}
	$a++;
}

#符号を含む書き込みを「wFILE7」に格納する
if($lines2[3]=~/[1-9]+(歩|桂|香|銀|金|玉|角|飛|馬|龍|と|成)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}elsif($lines2[3]=~/同+(歩|桂|香|銀|金|玉|角|飛|馬|龍|と|成)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}elsif($lines2[3]=~/[1-9]+(一|二|三|四|五|六|七|八|九)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}
else{}

#局面情報の書き込みを「wFILE8」に格納する
foreach my $data7(@lines13){
	$data_data7[$b]=$data7;
	my @lines14=split(/\n/,$data_data7[$b]);
	if($lines2[3]=~/\Q@lines14\E/){
	print wFILE8 "$lines2[2] $lines2[3]\n";
	}else{}
	$b++;
}

$i++;
}

close rFILE1;
close rFILE2;
close rFILE3;
close rFILE4;
close rFILE5;
close rFILE6;
close rFILE7;
close wFILE1;
close wFILE2;
close wFILE3;
close wFILE4;
close wFILE5;
close wFILE6;
close wFILE7;
close wFILE8;