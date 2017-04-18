module Devise
  class JwtFailureApp < FailureApp
    def respond
      self.status = :authentication_timeout
      self.content_type = 'application/json'
    end
  end
end
