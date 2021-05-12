use 5.010;

use Data::Faker;

my $faker = Data::Faker->new;

say 'email,name';
for (my $i = 0; $i < 250; $i++) {
    printf "%s,%s\n", $faker->email, $faker->name;
}
