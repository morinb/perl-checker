
use strict;
use warnings;
use Checker::Checker;


my $result = Checker::Checker::assert_equals(\&Checker::Checker::string_comparator, "toto", "titi", "actual [{0}] is not what was expected [{1}]!\n");
$result = Checker::Checker::assert_equals(\&Checker::Checker::string_comparator, "toto", "titi");


