#! /usr/bin/perl -Tw
# 2005-02-24: Fixed for AD/Exchange 2003 & Unicode characters,
# anders@bsdconsulting.no If you find this script useful, let me know. :-)
#
# 2000/2001: Original version obtained from Andreas Plesner Jacobsen at
# World Online Denmark. Worked for me with Exchange versions prior to Exchange
# 2000.
#
# Use it with mutt by putting in your .muttrc:
# set query_command = "/home/user/bin/mutt-ldap.pl '%s'"
#
# Then you can search for your users by name directly from mutt. Press ^t
# after having typed parts of the name. Remember to edit configuration
# variables below.

use strict;
use vars qw { $ldapserver $basedn };

# --- configuration ---
$ldapserver = "ldap.umn.edu";
$basedn = "o=University of Minnesota,c=US";
# --- end configuration ---

#my $search=shift;
my $search=join("*", @ARGV);

if (!$search=~/[\.\*\w\s]+/) {
    print("Invalid search parameters\n");
    exit 1;
}

use Net::LDAP;

my $ldap = Net::LDAP->new($ldapserver) or die "$@";

$ldap->bind;

my $mesg = $ldap->search (base => $basedn,
                          filter => "(|(displayName=*$search*) (uid=*$search*) (mail=*$search*))",
              attrs => ['mail','displayName','ou']);

$mesg->code && die $mesg->error;

print(scalar($mesg->all_entries), " entries found\n");

foreach my $entry ($mesg->all_entries) {
    if ($entry->get_value('mail')) {
        print($entry->get_value('mail'),"\t",
               $entry->get_value('displayName'),"\t",$entry->get_value('ou'),"\n");
        }
    }
$ldap->unbind;
