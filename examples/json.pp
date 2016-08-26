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


hash_file { '/tmp/hash.json':
  value    => $data,
  provider => 'json',
}

hash_file { '/tmp/symbols.json':
  value    => $symbols,
  provider => 'json',
}
