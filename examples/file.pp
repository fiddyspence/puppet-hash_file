hash_file::file { '/tmp/hash.yaml':
  owner    => 'root',
  group    => 'root',
  value    => {"bar"=>{"baz"=>"foo", "moo"=>1, "cow"=>"1"}},
  provider => 'yaml',
}
