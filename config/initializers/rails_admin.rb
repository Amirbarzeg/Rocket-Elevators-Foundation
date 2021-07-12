RailsAdmin.config do |config|
 require Rails.root.join('lib', 'google.rb')
  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

 


  require Rails.root.join('lib', 'rails_admin', 'custom_actions.rb')


  config.actions do
    dashboard                     # mandatory
    index         
    #root               # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    google

    briefing

    ## With an audit adapter, you can add:
    # history_index
    # history_show

  end
end
