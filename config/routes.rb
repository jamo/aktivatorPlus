AktivatorPlus::Application.routes.draw do

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  #get "admin/index"

  #get "sessions/new"

  #get "sessions/create"

  #get "sessions/destroy"

  resources :users

  resources :courses do
    resources :questions do
      resources :answer_options
      resources :answers

    end
  end

  root :to =>'Courses#index'
end
