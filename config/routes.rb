Rails.application.routes.draw do
  root to: 'posts#top'
  get 'posts', to: 'posts#top'
  post 'posts', to: 'posts#top'
  resources :posts do
    collection do
      post :confirm
    end
  end
end
