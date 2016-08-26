Puppet::Type.newtype(:hash_file) do

  @doc = <<-EOS
    This type provides the capability to manage a file with json or yaml data in it
  EOS

  newparam(:path, :namevar => true) do
    desc "the path of the file - manage this separately with a file resource if you care about permissions and stuff"
  end

  newproperty(:value) do
    desc "the value that hash should be"
    defaultto {}
    validate do |value|
      unless value.is_a?(Hash)
        raise ArgumentError, "Value is not of type Hash"
      end
    end

    # convert strings like ":thing" to a symbolic representation, :thing
    # This is needed to manage symbol keys in yaml files.
    munge do |value|
      return value unless resource[:provider] == :yaml
      resource.symbolize_keys(value)
    end
  end

  def symbolize_keys(data)
    data.each_with_object({}) do |item, memo|
      key, val = item

      val = symbolize_keys(val) if val.class == Hash

      if key =~ /^:/
        memo[key[1..-1].to_sym] = val
      else
        memo[key] = val
      end
    end
  end

end
