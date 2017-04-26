Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
   get 'show' => 'restaurants#show'
   member do
    patch 'upvote' => 'restaurants#upvote'
    patch 'downvote' => 'restaurants#downvote'
   end
  end
end
