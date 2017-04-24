Rails.application.routes.draw do
  
  resources :restaurants do
   member do
    patch 'upvote' => 'restaurants#upvote'
    patch 'downvote' => 'restaurants#downvote'
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
