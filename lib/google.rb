module RailsAdmin
    module Config
      module Actions
        # common config for custom actions
        class Google < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :root? do
            true
          end
          register_instance_option :route_fragment do
            'google.html.erb'
          end
          register_instance_option :link_icon do
            'fa fa-paper-plane' # use any of font-awesome icons
          end
          # register_instance_option :http_methods do
          #   [:get, :post]
          # end
          # register_instance_option :controller do
          #   Proc.new do
          #     # call model.method here
          #     flash[:notice] = "Did custom action on #{@object.name}"
          #     redirect_to back_or_index
          #   end
          # end
        end
  
        #   register_instance_option :member do  #    this is for specific record
        #     true
        #   end
        #   register_instance_option :pjax? do
        #     false
        #   end
        #   register_instance_option :visible? do
        #     authorized?         # This ensures the action only shows up for the right class
        #   end
        # end
  
  
        # class Collection < RailsAdmin::Config::Actions::Base
        #   RailsAdmin::Config::Actions.register(self)
        #   register_instance_option :collection do
        #     true    #    this is for all records in specific model
        #   end
        # end
        # class Root < RailsAdmin::Config::Actions::Base
        #   RailsAdmin::Config::Actions.register(self)
        #   register_instance_option :root do
        #     true    #    this is for all records in all models
        #   end
  
          # register_instance_option :google do
          #   if root?
          #     [:google]
          #   end
          # end
        # end
      end
    end
  end