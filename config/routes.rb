ActionController::Routing::Routes.draw do |map|
  map.resources :fund_raisings

  map.resources :news_items

  map.resources :newsitems

  map.resources :news

  map.resources :users

  map.resources :events, :has_many => :event_volunteers, :member => [ :volunteers ]
  map.resources :event_volunteers, :collection => { :check_in => :put }

  map.resources :sessions
  map.resources :password_resets

  map.root :controller => :events, :action => :index

  map.signup '/sign-up', :controller => 'users', :action => 'new'
  map.signin '/sign-in', :controller => 'sessions', :action => 'new'
  map.signout '/sign-out', :controller => 'sessions', :action => 'destroy'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
