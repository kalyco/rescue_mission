Rails.application.routes.draw do
  resources :questions do
    resources :comments, only: [:index, :create, :show]
  end
  resources :comments
  devise_for :users
  get '/', to: redirect('/questions')
end
