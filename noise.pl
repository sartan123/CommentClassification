open FILE1,"source2.txt" || die "open error";
open FILE2,"keisei.txt" || die "open error";
open FILE3,"senkei.txt" || die "open error";
open FILE4,"syobu.txt" || die "open error";
open FILE5,"time.txt" || die "open error";
open FILE6,"te.txt" || die "open error";
open FILE7,"tenum.txt" || die "open error";
open FILE8,"kyokumen.txt" ||die"open error";
open FILE9,">noise.txt" || die "open error";

@lines1=<FILE1>;
@lines2=<FILE2>;
@lines3=<FILE3>;
@lines4=<FILE4>;
@lines5=<FILE5>;
@lines6=<FILE6>;
@lines7=<FILE7>;
@lines8=<FILE8>;
@data_data1=();
@data_data2=();
@data_data3=();
@data_data4=();
@data_data5=();
@data_data6=();
@data_data7=();
@ck1{@lines2}=();
@ck2{@lines3}=();
@ck3{@lines4}=();
@ck4{@lines5}=();
@ck5{@lines6}=();
@ck6{@lines7}=();
@ck7{@lines8}=();

$lines2[3]=~ s/‚P/1/;
$lines2[3]=~ s/‚Q/2/;
$lines2[3]=~ s/‚R/3/;
$lines2[3]=~ s/‚S/4/;
$lines2[3]=~ s/‚T/5/;
$lines2[3]=~ s/‚U/6/;
$lines2[3]=~ s/‚V/7/;
$lines2[3]=~ s/‚W/8/;
$lines2[3]=~ s/‚X/9/;

foreach $data1(@lines1){
	push(@data_data1,$data1) unless exists $ck1{$data1};
	}
foreach $data2(@data_data1){
	push(@data_data2,$data2) unless exists $ck2{$data2};
	}
foreach $data3(@data_data2){
	push(@data_data3,$data3) unless exists $ck3{$data3};
	}
foreach $data4(@data_data3){
	push(@data_data4,$data4) unless exists $ck4{$data4};
	}
foreach $data5(@data_data4){
	push(@data_data5,$data5) unless exists $ck5{$data5};
	}
foreach $data6(@data_data5){
	push(@data_data6,$data6) unless exists $ck6{$data6};
	}
foreach $data7(@data_data6){
	push(@data_data7,$data7) unless exists $ck7{$data7};
	}
	print FILE9 "@data_data7\n";

close FILE1;
close FILE2;
close FILE3;
close FILE4;
close FILE5;
close FILE6;
close FILE7;
close FILE8;
close FILE9