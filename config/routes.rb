Rails.application.routes.draw do
  # get 'user/signin'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Defines the root path route ("/")
  # # root "posts#index"
  root "user#signin"
  post "/users", to: "user#create"
  get "/login", to: "user#login"
  post "login", to: "user#login"
  get "/dashboard", to: "user#dashboard"
  get "/dashboard", to: "expense#show"
  # get "/dashboard/new", to:"expense#new"
  # resources :users do
  #   resources :expenses
  # end

  # delete "/users/:id/expense/:id", to: "expense#destoty"
  # resources :users do
  #   resources :expenses, only: [:index, :show, :new, :create, :update, :destory]
  # end
  # post "/users/:user_id/expenses/:id/edit", to:"expenses#update"
  resources :users do
    resources :expenses, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  end
end
