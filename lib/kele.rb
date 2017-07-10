require 'httparty'
require 'json'
require './lib/roadmap.rb'

class Kele
  include HTTParty
  include JSON
  include Roadmap

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

  def get_mentor_availability(mentor_id)
    response = self.class.get(@base_api_url + "/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @authorization_token })

    puts "Cannot retrieve mentor availability. Check your code, dummy" if response.code != 200

    @mentor_availability = JSON.parse(response.body)
  end
end
