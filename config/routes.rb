Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/admin", to: "backoffice#index"
  
  namespace :backoffice do
    resources :users, except: :show
    resources :projects
    resource :session, only: [:new, :create, :destroy]
  end
end
