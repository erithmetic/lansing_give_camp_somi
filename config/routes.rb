ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :events

  map.resources :sessions
  map.resources :password_resets

  map.root :controller => :home, :action => :show

  map.signup '/sign-up', :controller => 'users', :action => 'new'
  map.signin '/sign-in', :controller => 'sessions', :action => 'new'
  map.signout '/sign-out', :controller => 'sessions', :action => 'destroy'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
