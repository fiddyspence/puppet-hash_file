This is a puppet module to manage a file as a hash of either JSON or YAML data

EXAMPLE USAGE:

    hash_file { '/tmp/hash': value => { 1 => 2 }, provider => 'yaml' }

License:

See LICENSE file

Changelog:

 - 15 April 2015 - initial release
