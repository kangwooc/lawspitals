Rails.application.routes.draw do
  devise_for :clients
  devise_for :lawyers
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # main page
  root 'posts#index'
  get '/index' => 'posts#index'
  
  # simple intro
  get '/about' => 'posts#about'
  get '/contact' => 'posts#contact'
  
  # Create
  post '/posts' => 'posts#create'

  # 각 게시판 보여주기
  get '/posts/:category_id' => 'posts#show_category'
  
  # 게시판 별 글 보기
  get '/posts/:category_id/:post_id' => 'posts#show'
  
  # 글 수정 페이지
  get '/posts/:category_id/:post_id/edit' => 'posts#edit'
  
  # edit 
  put '/posts/:category_id/:post_id/edit' => 'posts#update'
  patch '/posts/:category_id/:post_id/edit' => 'posts#update'
  
  #delete
  delete '/posts/:category_id:post_id' => 'posts#destroy'
  
  #comments create and destroy
  post '/comments/create' => 'comments#create'
  post '/comments/destroy' => 'comments#destroy'
end