require "omniauth/strategies/cas"

module OmniAuth
  module Strategies
    class FtwCAS < OmniAuth::Strategies::CAS
      option :name, :ftw_cas # Required property by OmniAuth::Strategy

      def initialize( app, *args, &block )
        options = args.first
        options[:host] = "auth.4teamwork.ch"
        super
      end

      info do
        user = Ftw::CAS::User.from_raw_data raw_info
        data = {
          name: user.name,
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          nickname: user.github_username,
        }
        prune!(data)
      end
    end
  end
end
OmniAuth.config.add_camelization 'ftw_cas', 'FtwCAS'
