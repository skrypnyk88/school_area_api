module Devise
  module Strategies
    class JWT < Base
      def valid?
        request.authorization
      end

      def authenticate!
        payload = JsonWebToken.decode(token)
        success! User.find(payload[:user_id])
<<<<<<< 4c2c86725e9454e52a38e519030d76f860dc676a
      rescue ::JWT::ExpiredSignature, ::JWT::DecodeError
=======
rescue ::JWT::ExpiredSignature, ::JWT::DecodeError
>>>>>>> LVRUBYM-219: change report time controller
        fail!
      end

      private

      def token
        request.authorization.split.last
      end
    end
  end
end
