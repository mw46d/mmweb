Meetmanager::Application.routes.draw do
  filter :small
  resources :events
  resources :athletes
  resources :scores
  resources :teams
  match '/' => 'home#index', :as => :root
  match '/:controller(/:action(/:id))'
#  match 'controllerhome' => '#index', :as => :with_options
end
