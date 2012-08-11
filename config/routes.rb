AktivatorPlus::Application.routes.draw do


  resources :sessions

  resources :users

  mount RailsAdmin::Engine => '/railsadmin', :as => 'rails_admin'

  match "signup", :to => "users#new"
  match "login", :to => "sessions#login"
  match "logout", :to => "sessions#logout"
  match "home", :to => "sessions#home"
  match "profile", :to => "sessions#profile"
  match "setting", :to => "sessions#setting"
  

#  match "login/" => "devise/sessions#new", :as => :login_user
#  match "logout/" => "devise/sessions#destroy", :as => :logout_user
#  match "users/:id/makeAdmin" => "users#makeAdmin", :as => :user_to_admin
  match "courses/:id/comments" => "courses#comments", :as => :course_comments
  match "courses/:course_id/questions/:id/activate" => "questions#activate", :as => :course_question_activate
  get 'admin' => 'admin#index', :as => 'admin'
 # controller :sessions do
 #   get 'login' => :new
 #   post 'login' => :create
 #   delete 'logout' => :destroy
 # end
  #get "admin/index"

  #get "sessions/new"

  #get "sessions/create"

  #get "sessions/destroy"

#  resources :users

  resources :courses, :only => [:index, :new, :edit, :create, :update, :destroy, :comments] do
    resources :questions, :only => [:index, :new, :create, :show, :activate, :destroy]  do
      resources :answer_options
      resources :answers, :only => [:create, :new]
      resources :comments, :only => [:index]

    end
  end

  root :to =>'courses#index'
end
