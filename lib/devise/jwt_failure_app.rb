module Devise
  class JwtFailureApp < FailureApp
    def respond
      self.status = :authentication_timeout
      self.content_type = 'application/json'
      self.response_body = { errors: [I18n.t('errors.token_timeout')] }.to_json
    end
  end
end
