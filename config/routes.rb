ActionController::Routing::Routes.draw do |map|
  map.filter 'small'
  
  map.resources :events

  map.resources :athletes

  map.resources :scores
  
  map.resources :teams

  map.root :controller => "home"
  map.connect ':controller/:action/:id'

  map.with_options(:controller => "home") do |site|
    site.connect '*url', :action => 'index'
  end
end
