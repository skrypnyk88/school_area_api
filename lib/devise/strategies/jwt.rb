module Devise
  module Strategies
    class JWT < Base
      def valid?
        request.authorization
      end

      def authenticate!
        payload = JsonWebToken.decode(token)
        success! User.find(payload[:user_id])
      rescue ::JWT::ExpiredSignature
        fail! 'Auth token has expired'
      rescue ::JWT::DecodeError
        fail! 'Auth token is invalid'
      end

      private

      def token
        request.authorization.split.last
      end
    end
  end
end
