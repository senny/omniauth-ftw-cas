require "omniauth/ftw/cas/version"
require 'omniauth/strategies/ftw_cas'

module OmniAuth
  module Ftw
    def self.has_internal_application_access?(auth_hash)
      !!(auth_hash["extra"] && auth_hash["extra"]["application_access"])
    end
  end
end
