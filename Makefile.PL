use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojolicious::Plugin::Schema::GraphQL',
    ABSTRACT         => 'Schema generator by Files for Mojolicious',
    AUTHOR           => 'Lucas Tiago de Moraes <lucastiagodemoraes@gmail.com>',
    VERSION_FROM     => 'lib/Mojolicious/Plugin/Schema/GraphQL.pm',
    LICENSE          => 'perl_5',
    MIN_PERL_VERSION => '5.010001',

    META_MERGE => {
        'meta-spec' => {
          version => 2,
        },

        resources => {
            homepage => 'https://github.com/lucas1/Mojolicious-Plugin-Schema-GraphQL',

            bugtracker => {
                web => 'https://github.com/lucas1/Mojolicious-Plugin-Schema-GraphQL/issues'
            },

            repository => {
                type => 'git',
                url  => 'git@github.com:lucas1/Mojolicious-Plugin-Schema-GraphQL.git',
                web  => 'https://github.com/lucas1/Mojolicious-Plugin-Schema-GraphQL'
            }
        }
    },

    PREREQ_PM => {
        'Mojo::Base' => 0,
        'Mojo::Util' => 0,
        'GraphQL::Schema' => 0,
        'FindBin' => 0
    },

    TEST_REQUIRES => {
        'Test::More' => 0,
        'Mojo::Base' => 0,
        'Mojo::Util' => 0,
        'GraphQL::Schema' => 0,
        'FindBin' => 0        
    },

    test => {
        TESTS => 't/*.t'
    }
);
