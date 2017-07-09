require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(email, password)
    @base_api_url = "https://www.bloc.io/api/v1"
    response = self.class.post(@base_api_url + '/sessions', body: { "email": email, "password": password })

    puts "Email/password combination not found. Please try again." if response.code != 200
    @authorization_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(@base_api_url + '/users/me', headers: { "authorization" => @authorization_token })

    puts "Email/password combination not found. Please try again." if response.code != 200
    @user_data = JSON.parse(response.body)

  end

end
