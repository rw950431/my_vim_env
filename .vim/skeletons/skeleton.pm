#!/usr/bin/perl
#-----------------------------------------------
# Name: 
#
# Purpose:
#
# History:
#   Date        Author  Remarks
#-----------------------------------------------
use strict;
package Package;
require Exporter;
@Package::ISA=qw(Exporter);

@Package::EXPORT=qw(usual_functions);
@Package::EXPORT_OK=qw(other_functions);

return 1;

#perldoc Package follows.
__END__

=head1 NAME

Package - code to do stuff

=head1 SYNOPIS

use Package;

$result=usual_functions($args)

=cut


