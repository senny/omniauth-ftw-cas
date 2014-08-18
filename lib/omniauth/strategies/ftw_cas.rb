require "omniauth/strategies/cas"

module OmniAuth
  module Strategies
    class FTWCAS < OmniAuth::Strategies::CAS
      option :name, :ftw_cas # Required property by OmniAuth::Strategy

      def initialize( app, *args, &block )
        options = args.first
        options[:host] = "auth.4teamwork.ch"
        super
      end

      info do
        {
          name: "%s %s" % [raw_info['firstname'], raw_info['lastname']],
          email: raw_info['email'],
          first_name: raw_info['firstname'],
          last_name: raw_info['lastname'],
          image: raw_info['image']
        }
      end

      extra do
        employee = raw_info["organization"] == "4teamwork AG"
        data = { employee: employee, application_access: employee }
        data[:gravatar_id] = Digest::MD5.hexdigest(raw_info["email"].downcase) if raw_info["email"]
        data
      end
    end
  end
end
OmniAuth.config.add_camelization 'ftw_cas', 'FTWCAS'
