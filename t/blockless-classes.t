use strict;
use warnings;
use Test::More;
use Test::Moose;

use FindBin;
use lib "$FindBin::Bin/lib";

BEGIN {
  use_ok 'Blockless';
}

{
  my $pkg = 'Blockless';
  has_attribute_ok $pkg, 'an_attribute';
  can_ok $pkg, 'a_method';

  ok !$pkg->can('has'), 'Moose methods cleaned up okay';
  ok $pkg->meta->is_immutable, 'Got made immutable';

  my $o = $pkg->new;
  is $o->a_method, 42;
}

{
  my $pkg = 'B_Subclass';
  has_attribute_ok $pkg, 'another_attribute', 'Has own attribute';
  has_attribute_ok $pkg, 'an_attribute', 'inherited attribute';

  ok !$pkg->can('has'), 'Moose methods cleaned up okay';
  ok $pkg->meta->is_immutable, 'Got made immutable';

  my $o = $pkg->new;
  is $o->a_method, 23, 'method override';
}

{
  my $pkg = 'B_Consumer';
  does_ok 'B_Consumer', 'B_Role', 'Role composition';

  my $o = $pkg->new;
  is $o->money, '$$$';
  is $o->funny_money, '€€€', 'Role method';
}



