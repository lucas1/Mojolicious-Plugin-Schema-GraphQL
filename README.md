# NAME

[Mojolicious::Plugin::Schema::GraphQL](https://metacpan.org/pod/Mojolicious::Plugin::Schema::GraphQL) - Schema generator by Files for Mojolicious

# SYNOPSIS

    use Mojolicious::Lite;
    
    plugin 'Schema::GraphQL';
    
    # only query
    my $schema = app->schema('query');
    
    # scalar and query 
    my $schema = app->schema('scalar', 'query');
    
    # all
    my $schema = app->schema;
    
    1;

MyApp/Schema/scalar.graphql:

    scalar Date

MyApp/Schema/query.graphql:
    
    type Query {
        name: String
        email: String
        date: Date
    } 
    
MyApp/Schema/mutation.graphql:

    type Mutation {
        post(url: String!, description: String!): Link!
    }

    type Link {
        id: ID!
        description: String!
        url: String!
    }    
    
# DESCRIPTION    

[Mojolicious::Plugin::Schema::GraphQL](https://metacpan.org/pod/Mojolicious::Plugin::Schema::GraphQL) Schema generator by Files for Mojolicious, ahe intention is to separate GraphQL schemas from Perl code.

# OPTIONS

## path

    # Mojolicious::Lite
    plugin 'Schema::GraphQL' => {path => '/home/user/my-path'};
    
# HELPERS

## schema

    my $schema = $self->schema('name-of-schema');
    
Load, generate and cache a schema with given name.    

# SEE ALSO

[Mojolicious](https://metacpan.org/pod/Mojolicious), [Mojolicious::Guides](https://metacpan.org/pod/Mojolicious::Guides),
[http://mojolicio.us](http://mojolicio.us), [GraphQL](https://metacpan.org/pod/GraphQL), [Mojolicious::Plugin::GraphQL](https://metacpan.org/pod/Mojolicious::Plugin::GraphQL).

# AUTHOR

Lucas Tiago de Moraes `lucastiagodemoraes@gmail.com`

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Lucas Tiago de Moraes.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
