use Test::More;
use Test::Mojo;
use Mojolicious::Lite;

use lib 't/lib';
plugin 'Schema::GraphQL' => { path => './t/Lite/Schema' };

get '/' => sub {
    my $self = shift;

    my $schema = $self->schema;

    $self->render(
        text => $schema ? 1 : 0
    );
};

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200);

done_testing;
