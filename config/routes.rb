AktivatorPlus::Application.routes.draw do


  match "courses/:id/comments" => "courses#comments", :as => :course_comments
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

  resources :courses, :only => [:index, :new, :edit, :create, :update, :destroy, :comments] do 
    resources :questions, :only => [:index, :new, :create, :show]  do
      resources :answer_options
      resources :answers, :only => [:create, :new]
      resources :comments, :only => [:index]

    end
  end

  root :to =>'courses#index'
end
