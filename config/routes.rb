Rails.application.routes.draw do
  root to: "static#top"

  devise_for :users, path: 'admin/users', controllers: {
    sessions: "admin/users/sessions"
  }, path_names: {sign_out: 'logout', sign_in: 'login'}

  resources :tips

  namespace :admin do
    resources :tips
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
