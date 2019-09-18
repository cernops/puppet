require 'puppet'
require 'puppet/util/warnings'

module Puppet::Util
  module Connection
    extend Puppet::Util::Warnings

    # Adds extra headers to a given hash if http_extra_headers option was set.
    # @param [Hash] headers The headers to be modified
    # @return [Hash] the modified headers
    def self.add_extra_headers(headers={})
      Puppet[:http_extra_headers].each do |name, value|
        if headers.key?(name)
          Puppet.warning(_('Ignoring extra header "%{name}" as it was previously set.') %
                         {name: name})
        else
          headers[name] = value
        end
      end
      headers
    end
  end
end
