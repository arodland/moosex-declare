use MooseX::Declare;

class Blockless;

has 'an_attribute' => (
  is => 'ro',
  isa => 'Str',
);

method a_method { 42 }

class B_Subclass is Blockless;

has 'another_attribute';

override a_method { 23 }

role B_Role;

requires 'money';

method funny_money {
  '€€€'
}

class B_Consumer with B_Role;

method money { 
  '$$$' 
}

1;
