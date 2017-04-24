Rails.application.routes.draw do
  resources :restaurants do
   get 'show' => 'restaurants#show'
   member do
    patch 'upvote' => 'restaurants#upvote'
    patch 'downvote' => 'restaurants#downvote'
   end
  end
end
