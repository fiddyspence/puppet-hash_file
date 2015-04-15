This is a puppet module to manage a file as a hash of either JSON or YAML data

EXAMPLE USAGE:

    fids$ cat /tmp/hiera/common.yaml
    ---
    foo:
      bar:
       baz: 'foo'
       moo: 1
       cow: '1'

    $foo = hiera(foo)
    hash_file { '/tmp/hash': value => $foo, provider => 'json' }

    fids$ cat /tmp/hash
    {"bar":{"baz":"foo","moo":1,"cow":"1"}}

License:

See LICENSE file

Changelog:

 - 15 April 2015 - initial release
 - 15 April 2015 - I probably lied about Windows
