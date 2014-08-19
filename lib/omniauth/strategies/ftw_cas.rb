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
    end
  end
end
OmniAuth.config.add_camelization 'ftw_cas', 'FtwCAS'
