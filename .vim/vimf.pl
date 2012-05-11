#!/usr/bin/perl
#-----------------------------------------------
# Name: vimf.pl
#
# Purpose: do a 'perl -cwT' on the supplied file, then
#	   pre-process the output into a form
# <filename> <line number> <error message>
# that can be easily used in 'vim'
#
# to use, add the following to '.vimrc'
# 
#if has("autocmd")
# autocmd BufRead *.pl set makeprg=/home/rpw/vimf.pl\ % errorformat=%f\ %l\ %m.
#endif
#
# and use ':make' to syntax-check your file, then step through errors with
# ':cc' (current) ':cn' (next) ':cp' (prev)
#
# History:
# 04Apr2001 RPW Created
#
#-----------------------------------------------

my ($line,$number,$file);
my $perlscript=shift;
die "Usage $0 <perl script>" unless defined $perlscript;

open PERLCHECK, "perl -cwT $perlscript 2>&1 |"  or die "Error opening perl -cwT $perlscript:$!\n";
while (<PERLCHECK>)
{
   chomp;
   # perl's error messages can be multi-line, but
   # subsequent lines all start with whitespace.
   unless (/^\s+/) { # this is the start of a new error msg 
       if (defined $line) { # so print out old one, getting the filename and line num 
           $number=($line=~/line\s+(\d+)/)?$1:"";
           $file=($line=~/at\s+([^ ]+)\s+line/)?$1:"";
           print "$file $number $line.\n";
       };
       $line=$_; # and start to collect the new msg
       next;
   };
   # this is the continuation of a multi-line error message
   /\s+(.*)/; # remove leading whitespace
   $line=join(' ',$line,$1); # and tack it on the end
 
};
close PERLCHECK or die "Error opening perl -cwT $perlscript: $?\n";
# and print out last remaining line
if (defined $line) { # so print out old one, getting the filename and line num 
   $number=($line=~/line\s+(\d+)/)?$1:"";
   $file=($line=~/at\s+([^ ]+)\s+line/)?$1:"";
   print "$file $number $line.\n";
};
