Rails.application.routes.draw do
  devise_for :users
  resources :questions, only: [
    :index, :show, :new, :edit, :create, :update, :destroy
  ] do
    resources :answers, only: [
      :show, :create, :edit, :update, :destroy ]
  end
  resources :answers
  get '/', to: redirect('/questions')
end
