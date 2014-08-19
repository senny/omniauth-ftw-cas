require "omniauth/ftw/cas/version"
require "omniauth/ftw/cas/user"
require 'omniauth/strategies/ftw_cas'

module OmniAuth
  module Ftw
    def self.user(auth_hash)
      OmniAuth::Ftw::CAS::User.new(auth_hash)
    end

    def self.has_internal_application_access?(auth_hash)
      tmp_user = user(auth_hash)
      user.application_access?
    end
  end
end
