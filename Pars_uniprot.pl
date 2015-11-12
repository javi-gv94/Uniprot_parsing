use strict;

my$file=shift;
my@data="";
my$heading="";
my$ID_line="";
my$AC_line="";
my$DT_line="";
my$DE_line="";
my$GN_line="";
my$OS_line="";
my$OG_line="";
my$OC_line="";
my$OX_line="";
my$OH_line="";
my$reference_line="";
my$CC_line="";
my$DR_line="";
my$PE_line="";
my$KW_line="";
my$FT_line="";
my$SQ_line="";
#subrutina que abre el archivo "file" cuyo nombre se introduce en la linea de comandos al ejecutar el programa. sino muestra error 

&Open_file($file);
sub Open_file {
	my $file=@_[0];
	unless (open(ENTRADA,"<$file")){  die  "No se encuentra el archivo!\n";}
}

#subrutina que extrae el contenido del archivo y lo guarda en el array @data

&Get_data_from_file;
sub Get_data_from_file {
	@data=<ENTRADA>;
	close ENTRADA;
	#print "@data\n";
}

&Extract_info(@data);
sub Extract_info {
	@data=@_;
	foreach my$linea(@data) {
		$heading=substr($linea,0,2);
		#print "$heading\n";
		if ($heading eq "ID") {
			my$info=substr($linea,5);
			$ID_line=$ID_line.$info;
			#print "The entry name is $ID_line\n";
		} elsif ($heading eq "AC") {
			my$info=substr($linea,5);
			$AC_line=$AC_line.$info;
			#print "The accesion number is $AC_line\n";
		} elsif ($heading eq "DT") {
			my$info=substr($linea,5);
			$DT_line=$DT_line.$info;
			#print "The creation date is $DT_line\n";
		} elsif ($heading eq "DE") {
			my$info=substr($linea,5);
			$DE_line=$DE_line.$info;
			#print "The recomended name is $DE_line\n";
		} elsif ($heading eq "GN") {
			my$info=substr($linea,5);
			$GN_line=$GN_line.$info;
			#print "The gene name which code for the protein is $GN_line\n";
		} elsif ($heading eq "OS") {
			my$info=substr($linea,5);
			$OS_line=$OS_line.$info;
			#print "The organism source is $OS_line\n";
		} elsif ($heading eq "OG") {
			my$info=substr($linea,5);
			$OG_line=$OG_line.$info;
			#print "The coding organelle is $OG_line\n";
		} elsif ($heading eq "OC") {
			my$info=substr($linea,5);
			$OC_line=$OC_line.$info;
			#print "The OS taxonomic clasification is $OC_line\n";
		} elsif ($heading eq "OX") {
			my$info=substr($linea,5);
			$OX_line=$OX_line.$info;
			#print "The taxonomy ID is $OX_line\n";
		} elsif ($heading eq "OH") {
			my$info=substr($linea,5);
			$OH_line=$OH_line.$info;
			#print "The host organism is $OH_line\n";
		} elsif (($heading eq "RN") or ($heading eq "RP") or ($heading eq "RC") or ($heading eq "RX") or ($heading eq "RG") or ($heading eq "RA") or ($heading eq "RL")) {
			my$info=substr($linea,5);
			$reference_line=$reference_line.$info;
			#print "The citations for this entry are $reference_line\n";
		} elsif ($heading eq "CC") {
			my$info=substr($linea,5);
			$CC_line=$CC_line.$info;
			#print "The comments for this entry are $CC_line\n";
		} elsif ($heading eq "DR") {
			my$info=substr($linea,5);
			$DR_line=$DR_line.$info;
			#print "The databases references are $DR_line\n";
		} elsif ($heading eq "PE") {
			my$info=substr($linea,5);
			$PE_line=$PE_line.$info;
			#print "Evidence for existence of the protein: $PE_line\n";
		} elsif ($heading eq "KW") {
			my$info=substr($linea,5);
			$KW_line=$KW_line.$info;
			#print "The key words for this entry are $KW_line\n";
		} elsif ($heading eq "FT") {
			my$info=substr($linea,5);
			$FT_line=$FT_line.$info;
			#print "Sites of interest of the protein $FT_line\n";
		} elsif (($heading eq "SQ") or ($heading eq "  ")) {
			my$info=substr($linea,5);
			$SQ_line=$SQ_line.$info;
			#print "The protein sequence is $SQ_line\n";
		} 
		
		
	}
}

#comentario de prueba
