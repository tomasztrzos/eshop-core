require 'google/cloud/pubsub'

module GoogleCloud
  class PubSubAdapter
    def self.pubsub
      @pubsub ||= begin
        Google::Cloud::Pubsub.new(
          project_id: 'eshop-trzos',
          credentials: File.join(Rails.root, 'config', 'auths', 'eshop-trzos-46ec9464cb10.json')
        )
      end
    end

    def self.pubsub_email_topic
      @pubsub_topic ||= "projects/joblovin-suh/topics/email-#{Rails.env}"
    end

    def self.enqueue_email(hash)
      topic = pubsub.topic(pubsub_email_topic)
      topic.publish(hash)
    end
  end
end
