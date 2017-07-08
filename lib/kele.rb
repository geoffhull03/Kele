require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
      response = self.class.post("https://www.bloc.io/api/v1/sessions", body: { "email": email, "password": password })

      puts "Email/password combination not found. Please try again." if response.code != 200
      @authorization_token = response["auth_token"]
  end
end
