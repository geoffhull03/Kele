module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(@base_api_url + "/roadmaps/#{roadmap_id}", headers: { "authorization" => @authorization_token })

    puts "Cannot retrieve roadmap. Check your code, dummy" if response.code != 200

    @roadmap_id = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(@base_api_url + "/checkpoints/#{checkpoint_id}", headers: { "authorization" => @authorization_token })

    puts "Cannot retrieve checkpoints. Check your code, dummy" if response.code != 200

    @checkpoint_id = JSON.parse(response.body)
  end
end
