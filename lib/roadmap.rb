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
    response = self.class.post(@base_api_url + '/messages', body: {"sender": 'geoffhull03@gmail.com', "recipient_id": recipient_id, "subject": subject, "stripped-text": message}, headers: { "authorization" => @authorization_token })

    puts response.body
  end

  def create_submission(checkpoint_id, enrollment_id, assignment_branch, assignment_commit_link, comment)
    response = self.class.post(@base_api_url + '/checkpoint_submissions', body: {"checkpoint_id": checkpoint_id, "enrollment_id": enrollment_id, "assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "comment": comment}, headers: { "authorization" => @authorization_token })

    if response["status"] == "submitted"
      puts "Submission has sucessfully sent"
    else
      puts "Submission failed to send"
    end
  end
end
