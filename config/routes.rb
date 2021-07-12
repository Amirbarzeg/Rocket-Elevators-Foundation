Rails.application.routes.draw do
  resources :interventions
  resources :leads
  resources :elevators
  resources :columns
  resources :batteries
  resources :customers
  resources :addresses
  resources :building_details
  resources :buildings
  resources :quotes
	root "rocket#index"
	
	post "/home/testpost", to: "home#testpost"
	get "/index", to: "rocket#index"
	get "/quote", to: "rocket#quote"
	get "/residential", to: "rocket#residential"
	get "/intervention", to: "interventions#index"
	get "/get_buildings/:customer_id", to: "interventions#get_buildings"
	get "/get_batteries/:building_id", to: "interventions#get_batteries"
	get "/get_columns/:battery_id", to: "interventions#get_columns"
	get "/get_elevators/:column_id", to: "interventions#get_elevators"
	get "/commercial", to: "rocket#commercial"
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	post "/admin/briefing/watsonbriefing", to: "watson#watsonBriefing"
	resources :employees
	get 'home/index'
	get 'home_controller/index'
	devise_for :users     

	post "/quotes/create", to: "quotes#create"
	post "/leads/create", to: "leads#create"
end