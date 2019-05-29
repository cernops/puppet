require 'puppet'
require 'puppet/util/warnings'

module Puppet::Util
  module Connection
    extend Puppet::Util::Warnings

    # Adds extra headers to a given request if http_extra_headers option was set.
    # @param [Hash] request The request to be modified
    # @return [Hash] the modified request
    def self.add_extra_headers(request)
      Puppet[:http_extra_headers].each do |header, value|
        if request.key?(header)
          Puppet.warning(_('Ignoring extra header "%{header}" as it was previously set.') %
                         {header: header})
        else
          request[header] = value
        end
      end
      request
    end
  end
end