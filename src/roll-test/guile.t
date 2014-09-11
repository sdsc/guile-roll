#!/usr/bin/perl -w
# guile roll installation test.  Usage:
# guile.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/guile';
my $output;

my $TESTFILE = 'rollguile';

open(OUT, ">$TESTFILE.scm");
print OUT <<END; 
#!/opt/gnu/bin/guile -s
!#

(display "Hello world")
(newline)
END

# guile-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, "guile installed");
} else {
  ok(! $isInstalled, "guile not installed");
}

SKIP: {

  skip 'guile not installed', 10 if ! $isInstalled;
  my $modulesInstalled = -f '/etc/profile.d/modules.sh';
  my $setup = $modulesInstalled ?
              ". /etc/profile.d/modules.sh; module load guile" :
              'echo > /dev/null'; # noop
  $output = `$setup; guile $TESTFILE.scm 2>&1`;
  ok($? == 0, 'guile program runs');
  like($output, qr/Hello world/, 'guile program correct output');

  skip 'modules not installed', 3 if ! $modulesInstalled;
  skip 'guile not installed', 3 if ! $isInstalled;
  `/bin/ls /opt/modulefiles/compilers/guile/[0-9]* 2>&1`;
  ok($? == 0, "guile module installed");
  `/bin/ls /opt/modulefiles/compilers/guile/.version.[0-9]* 2>&1`;
  ok($? == 0, "guile version module installed");
  ok(-l "/opt/modulefiles/compilers/guile/.version",
     "guile version module link created");

}

`rm -fr $TESTFILE*`;
