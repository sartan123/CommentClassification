#!/usr/bin/perl
use strict;

open rFILE1,"source1.txt" || die"open error";     #�S�Ă̗v�f���i�[����t�@�C��
open rFILE2,"keiseifile.txt" || die"open error";  #�`���f�[�^���i�[����t�@�C��
open rFILE3,"senkeifile.txt" || die"open error";  #��^�f�[�^���i�[����t�@�C��
open rFILE4,"timefile.txt" || die"open error";    #���ԃf�[�^���i�[����t�@�C��
open rFILE5,"syobufile.txt" || die"open error";   #����オ��f�[�^���i�[����t�@�C��
open rFILE6,"tefile.txt" || die"open error";      #��̈Ӗ��f�[�^���i�[����t�@�C��
open rFILE7,"kyokumenfile.txt" ||die"open error"; #�ǖʃf�[�^���i�[����t�@�C��
open wFILE1,"> source2.txt" || die"open error";   #rFILE1�̏������݂Ǝ��Ԃ��i�[����t�@�C��
open wFILE2,"> keisei.txt" || die "open error";   #wFILE1�̌`���֘A�̏������݂��i�[����t�@�C��
open wFILE3,"> senkei.txt" || die "open error";   #wFILE1�̐�^�֌W�̏������݂��i�[����t�@�C��
open wFILE4,"> time.txt" || die "open error";     #wFILE1�̎��Ԋ֌W�̏������݂��i�[����t�@�C��
open wFILE5,"> syobu.txt" || die"open error";     #wFILE1�̐���オ��̏������݂��i�[����t�@�C��
open wFILE6,"> te.txt" || die"open error";        #wFILE1�̎�̈Ӗ��Ɋ֌W���鏑�����݂��i�[����t�@�C��
open wFILE7,"> tenum.txt" || die"open error";     #wFILE1�̕������܂ޏ������݂��i�[����t�@�C��
open wFILE8,">kyokumen.txt" ||die"open error";    #wFILE1�̋ǖʏ����܂ޏ������݂��i�[����t�@�C��

my @lines1=<rFILE1>;
my @lines3=<rFILE2>;
my @lines5=<rFILE3>;
my @lines7=<rFILE4>;
my @lines9=<rFILE5>;
my @lines11=<rFILE6>;
my @lines13=<rFILE7>;
my $i=0; #�uwFILE1�p�v�J�E���^�[
my $n=0; #�uwFILE2�p�v�J�E���^�[
my $x=0; #�uwFILE3�p�v�J�E���^�[
my $y=0; #�uwFILE4�p�v�J�E���^�[
my $z=0; #�uwFILE5�p�v�J�E���^�[
my $a=0; #�uwFILE6�p�v�J�E���^�[
my $b=0; #�uwFILE7�p�v�J�E���^�[
my @data_data1=(); #�S������s���ƂɊi�[���邽�߂̔z��
my @data_data2=(); #�S������s���ƂɊi�[���邽�߂̔z��(�`���p)
my @data_data3=(); #�S������s���ƂɊi�[���邽�߂̔z��(��^�p)
my @data_data4=(); #�S������s���ƂɊi�[���邽�߂̔z��(���ԗp)
my @data_data5=(); #�S������s���ƂɊi�[���邽�߂̔z��(����オ��p)
my @data_data6=(); #�S������s���ƂɊi�[���邽�߂̔z��(��̈Ӗ��p)
my @data_data7=();

foreach my $data(@lines1){  #�S�Ă̗v�f��ǂݍ���

	$data_data1[$i]=$data;  #��s���ƂɊi�[
	my @lines2=split(/\s+/,$data_data1[$i]); #ID,����,�������݂ɂ킯�Ċi�[
	$lines2[3]=~ s/�P/1/g;
	$lines2[3]=~ s/�Q/2/g;
	$lines2[3]=~ s/�R/3/g;
	$lines2[3]=~ s/�S/4/g;
	$lines2[3]=~ s/�T/5/g;
	$lines2[3]=~ s/�U/6/g;
	$lines2[3]=~ s/�V/7/g;
	$lines2[3]=~ s/�W/8/g;
	$lines2[3]=~ s/�X/9/g;
	print wFILE1 "$lines2[2] $lines2[3]\n"; #lines2[2]=����,lines2[3]=��������


#�`���֘A�̏������݂��uwFILE2�v�Ɋi�[����
foreach my $data2(@lines3){
	$data_data2[$n]=$data2;
	my @lines4=split(/\n/,$data_data2[$n]);
	if($lines2[3]=~/\Q@lines4\E/){
	print wFILE2 "$lines2[2] $lines2[3]\n";
	}else{}
	$n++;
}

#��^�֘A�̏������݂��uwFILE3�v�Ɋi�[����
foreach my $data3(@lines5){
	$data_data3[$x]=$data3;
	my @lines6=split(/\n/,$data_data3[$x]);
	if($lines2[3]=~/\Q@lines6\E/){
	print wFILE3 "$lines2[2] $lines2[3]\n";
	}else{}
	$x++;
}

#���Ԋ֘A�̏������݂��uwFILE4�v�Ɋi�[����
foreach my $data4(@lines7){
	$data_data4[$y]=$data4;
	my @lines8=split(/\n/,$data_data4[$y]);
	if($lines2[3]=~/\Q@lines8\E/){
	print wFILE4 "$lines2[2] $lines2[3]\n";
	}else{}
	$y++;
}

#����オ��֘A�̏������݂��uwFILE5�v�Ɋi�[����
foreach my $data5(@lines9){
	$data_data5[$z]=$data5;
	my @lines10=split(/\n/,$data_data5[$z]);
	if($lines2[3]=~/\Q@lines10\E/){
	print wFILE5 "$lines2[2] $lines2[3]\n";
	}else{}
	$z++;
}

#��̈Ӗ��֘A�̏������݂��uwFILE6�v�Ɋi�[����
foreach my $data6(@lines11){
	$data_data6[$a]=$data6;
	my @lines12=split(/\n/,$data_data6[$a]);
	if($lines2[3]=~/\Q@lines12\E/){
	print wFILE6 "$lines2[2] $lines2[3]\n";
	}else{}
	$a++;
}

#�������܂ޏ������݂��uwFILE7�v�Ɋi�[����
if($lines2[3]=~/[1-9]+(��|�j|��|��|��|��|�p|��|�n|��|��|��)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}elsif($lines2[3]=~/��+(��|�j|��|��|��|��|�p|��|�n|��|��|��)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}elsif($lines2[3]=~/[1-9]+(��|��|�O|�l|��|�Z|��|��|��)/){
	print wFILE7 "$lines2[2] $lines2[3]\n";
}
else{}

#�ǖʏ��̏������݂��uwFILE8�v�Ɋi�[����
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