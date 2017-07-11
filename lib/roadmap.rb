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

  def get_messages(page)
    response = self.class.get(@base_api_url + "/message_threads", headers: { "authorization" => @authorization_token })

    puts "Cannot retrieve message threads. Check your code, dummy" if response.code != 200

    @message_thread = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, message)
    response = self.class.post(@base_api_url + '/messages', body: {"sender": 'geoffhull03@gmail.com', "recipient_id": recipient_id, "subject": subject, "stripped-text": message}, headers: { "authorization" => @authorization_token})
    
    puts response.body
  end

end
