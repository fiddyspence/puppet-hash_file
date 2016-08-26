# Definition: hash_file::file
#
# This definition is a wrapper for the hash_file resource type.
#
# Parameters:
# All parameters are as for the file type. The value of $data will
# be encoded as YAML or JSON into the specified file.
#
# Sample Usage:
#  hash_file::file { '/tmp/hash.yaml':
#    owner    => 'root',
#    group    => 'root',
#    data     => {"bar"=>{"baz"=>"foo", "moo"=>1, "cow"=>"1"}},
#    provider => 'yaml',
#  }
#
define hash_file::file (
  $ensure                  = 'file',
  $path                    = $title,
  $backup                  = undef,
  $checksum                = undef,
  $force                   = undef,
  $group                   = undef,
  $owner                   = undef,
  $mode                    = undef,
  $replace                 = undef,
  $selinux_ignore_defaults = undef,
  $selrange                = undef,
  $selrole                 = undef,
  $seltype                 = undef,
  $seluser                 = undef,
  $value                   = undef,
  $provider                = 'yaml',
) {
  unless $ensure in [ 'absent', 'present', 'file'] {
    fail("Hash_file::File[${title}] invalid value for ensure")
  }

  unless downcase($provider) in [ 'yaml', 'json'] {
    fail("Hash_file::File[${title}] invalid value for provider")
  }

  file { $title:
    ensure                  => $ensure,
    path                    => $path,
    backup                  => $backup,
    checksum                => $checksum,
    force                   => $force,
    group                   => $group,
    mode                    => $mode,
    owner                   => $owner,
    replace                 => $replace,
    selinux_ignore_defaults => $selinux_ignore_defaults,
    selrange                => $selrange,
    selrole                 => $selrole,
    seltype                 => $seltype,
    seluser                 => $seluser,
  }

  unless $ensure == 'absent' {
    hash_file { $path:
      value    => $value,
      provider => $provider,
      before   => File[$title], # let the File resource do all the work for us
    }
  }
}
