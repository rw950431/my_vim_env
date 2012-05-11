#!/usr/bin/perl
#-----------------------------------------------
# Name: ptags.pl
#
# Purpose: parse a perl script, identify all the files
#          use-ed or require-ed and make a tags file out
#          of the resulting list.
#
# History:
# 23Jan2004 RPW Created
# 17Feb2004 RPW Changed from using 'ctags' to using 'pltags.pl' for better
#               tag generation (does variables as well as functions)
#
#-----------------------------------------------
use File::Basename;
foreach $filename (@ARGV) {
    push @ctags_files,$filename;
    next unless $filename=~/\.pl$/ or $filename=~/\.pm$/;
    $cwd=dirname($filename);
    unless (open PERLSCRIPT,"$filename") {
        warn "Unable to open '$filename':$!\n";
        next;
    }
    while (<PERLSCRIPT>) {
        next if /^\s*#/;
        #add any 'require' files to the file of ctags arguements
        if(/^\s*require.*"(.*)".*;/ or /^\s*require.*'(.*)'.*;/) {
            $req_name=$1;
            if (substr($req_name,0,1) eq ".") {
              $req_name=join("/",$cwd,$req_name);
              #print "expanding req name $req_name\n";
            };


            #print "requiring $1\n";
            push @ctags_files,$req_name; 
        };

#print "using ".&get_module_path($1)."\n" if /^\s*use\s+(\S+)\s+/;
        #add any 'use' modules to the list of ctags arguements
        if (/^\s*use\s+(\S+)*\s+/) {
            $mod_name=$1;
            #trim trailing ;, if necessary
            $mod_name=~s/;$//;

            if ($mod_name eq "lib") { eval ($_); };
            unless (exists $modules{$mod_name}) {
                $modules{$mod_name}=1;
                push @ctags_files,&get_module_path($mod_name);
#print "using $mod_name ",&get_module_path($mod_name),"\n";
#$path=get_module_path($1);
#print "($path)\n";
            };
        };
    }
    close PERLSCRIPT;
    
};

#`ctags @ctags_files`;
`~/.vim/pltags.pl @ctags_files`;
exit;

sub get_module_path()
{
#adapted from http://www.jbisbee.com/perl/

$module = shift @_;
#print "gmp() $module\n";
return if $module eq "strict";
return if $module eq "lib";
return if $module eq "constant";
return if $module=~/^\d+\.\d+/; #eg use 5.006 or 5.6.0

($mod = $module) =~ s#::#/#g; 
#die ("Need a module name\n") unless $mod; 
$mod .= '.pm'; 
eval {require $mod;};
if($@) {
    print "Unable to locate $module\n";
    return;
} else {
#print $INC{$mod} . " (" . ${$module . "::VERSION"} .")\n"; 
    return $INC{$mod}; 
};

}
