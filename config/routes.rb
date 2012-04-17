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

  resources :courses, :only => [:index, :new, :edit, :create, :update, :destroy] do
    resources :questions, :only => [:index, :new, :create, :show]  do
      resources :answer_options
      resources :answers, :only => [:create, :new]
      resources :comments, :only => [:index]

    end
  end

  root :to =>'Courses#index'
end
