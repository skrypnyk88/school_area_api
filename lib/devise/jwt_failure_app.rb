module Devise
  class JwtFailureApp < FailureApp
    def respond
      self.status = :unauthorized
      self.content_type = 'application/json'
      self.response_body = { error: request.env['warden.options'][:message] }
                           .to_json
    end
  end
end
