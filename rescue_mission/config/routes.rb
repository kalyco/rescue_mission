Rails.application.routes.draw do
  resources :questions do
    resources :comments
  end
  devise_for :users
  get '/', to: redirect('/questions')
end
