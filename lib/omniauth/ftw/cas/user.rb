module OmniAuth
  module Ftw
    module CAS
      class User
        def self.from_raw_data(raw_data)
          new("extra" => raw_data, "info" => raw_data)
        end

        def initialize(auth_hash)
          @auth_hash = auth_hash
        end

        def name
          "%s %s" % [first_name, last_name]
        end

        def first_name
          extra["firstname"]
        end

        def last_name
          extra["lastname"]
        end

        def email
          info["email"]
        end

        def employee?
          extra["organization"] == "4teamwork AG"
        end

        def application_access?
          employee?
        end

        def gravatar_id
          return unless email
          Digest::MD5.hexdigest(email.downcase)
        end

        def github_username
          extra["github"]
        end

        private
        def info
          @info ||= @auth_hash.fetch("info", {})
        end

        def extra
          @extra ||= @auth_hash.fetch("extra", {})
        end
      end
    end
  end
end
