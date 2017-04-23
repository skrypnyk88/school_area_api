module Devise
  class JwtFailureApp < FailureApp
    def respond
      self.status = :authentication_timeout
      self.content_type = 'application/json'
<<<<<<< 4c2c86725e9454e52a38e519030d76f860dc676a
=======
      
>>>>>>> LVRUBYM-219: change report time controller
    end
  end
end
