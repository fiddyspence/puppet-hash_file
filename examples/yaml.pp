$data = {
  "bar" => {
    "baz" => "foo",
    "moo" => 1,
    "cow" => "1",
  }
}


$symbols = {
  ":bar" => {
    "baz" => "foo",
    "moo" => 1,
    ":cow" => "1",
  }
}


hash_file { '/tmp/hash.yaml':
  value    => $data,
  provider => 'yaml',
}

hash_file { '/tmp/symbols.yaml':
  value    => $symbols,
  provider => 'yaml',
}
