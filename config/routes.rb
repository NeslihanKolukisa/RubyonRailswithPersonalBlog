Rails.application.routes.draw do
  devise_for :authors
  root "blog/posts#index"
  
  namespace :authors do
     resources :posts do
         put 'publish' => 'posts#publish', on: :member
         put 'unpublish' => 'posts#unpublish', on: :member
     end
  end
  
  scope module: 'blog' do 
       get 'hakkimda' => 'pages#hakkimda', as: :hakkimda
       get 'iletisim' => 'pages#iletisim', as: :iletisim
       get 'posts' => 'posts#index', as: :posts
       get 'posts/:id' => 'posts#show', as: :post
  end
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
