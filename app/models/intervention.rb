class Intervention < ApplicationRecord
  belongs_to :customer
  belongs_to :building
  belongs_to :battery ,optional:true
  belongs_to :column ,optional:true
  belongs_to :elevator ,optional:true
  belongs_to :employee ,optional:true


  after_create :intervention_create
    
    def intervention_create
        notifier = Slack::Notifier.new Figaro.env.slack_hook do
            defaults channel: "#default",
                     username: "notifier"
        end
        notifier.ping "The Intervention #{self.id} with status of #{self.status} was created."
    end
end
