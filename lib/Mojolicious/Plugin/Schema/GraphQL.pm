package Mojolicious::Plugin::Schema::GraphQL;

use Mojo::Base 'Mojolicious::Plugin';
use Mojo::Util qw/camelize md5_sum/;
use GraphQL::Schema;
use Cwd;

our $VERSION = '0.01';

sub register {
    my ($plugin, $app, $conf) = @_;

    $app->helper(
        schema => sub {
            my ($self, @names) = @_;

            my $name = camelize($app->moniker);
            $name =~ s/::/\//g;

            my $path = $conf->{path} // getcwd . '/' . $name . '/Schema';

            my $key = scalar(@names) > 0 ? md5_sum(join('', @names)) : 'all';

            return $plugin->{schemas}{$key} if $plugin->{schemas}{$key};

            my $data = scalar(@names) > 0
                     ? _get_data_by_filenames($path, @names)
                     : _get_data_all_files($path);

            my $schema = GraphQL::Schema->from_doc($data);
            $plugin->{schemas}{$key} = $schema;
            return $schema;
        }
    );
}

sub _get_data_by_filenames {
    my ($path, @names) = @_;

    my $data = '';

    for (@names) {
        my $file = $path . '/' . $_ . '.graphql';
        next unless -e $file;

        $data .= _get_data($file);
    }

    return $data;
}

sub _get_data_all_files {
    my $path = shift;

    my $data = '';

    for (glob($path . '/*.graphql')) {
        $data .= _get_data($_);
    }

    return $data;
}

sub _get_data {
    my $file = shift;

    my $data = '';

    open(FH, '<', $file);
    $data .= $_ while <FH>;
    close(FH);

    return $data;
}

1;
