Rails.application.routes.draw do
  resources :restaurants
  get :action=>"show", :controller=>"restaurants"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
