  Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

# User_profilesController
  get 'user_profiles/:user_id', to: 'user_profiles#show', as: 'show_user_profile'
  get 'user_profiles', to: 'user_profiles#edit', as: 'edit_user_profile'
  post 'user_profiles', to: 'user_profiles#update', as: 'update_user_profile'


# ConsultingsController

  get '/', to: 'consultings#index', as: 'index_consulting'
  get 'consultings', to: 'consultings#list', as: 'list_consulting'
  get 'consultings/new', to: 'consultings#new', as: 'new_consulting'
  post 'consultings/new', to: 'consultings#create', as: 'create_consulting'
  get 'consultings/edit/:id', to: 'consultings#edit', as: 'edit_consulting'
  post 'consultings/edit/:id', to: 'consultings#update', as: 'update_consulting'


# ResponsesController
  #一旦変更　get 'responses/new', to: 'responses#new', as: 'new_response'
  #一旦変更　post 'responses/new', to: 'responses#create', as: 'create_response'
  get 'consultings/:consulting_id', to: 'consultings#show', as: 'new_response'
  post 'consultings/:consulting_id', to: 'consultings#create_response', as: 'create_response'
  #いいね
   post 'consultings/:consulting_id/responses/:response_id/favorite', to: 'favorites#favorite_create', as: 'favorite_create'
   delete 'consultings/:consulting_id/responses/:response_id/favorite', to: 'favorites#favorite_delete', as: 'favorite_delete'

# Routes
  # post 'consultings/:consulting_id/responses/:response_id/favorite', to: 'favorites#favorite_create', as: 'favorite_create'
  # delete 'consultings/:consulting_id/responses/:response_id/favorite', to: 'favorites#favorite_delete', as: 'favorite_delete'



  resources :consultings do
    resources :responses do
      resource :favorite, only: [:create, :destroy,] 
    end
  end



# LikesController
  get 'likes/new', to: 'likes#new', as: 'new_like'

# TagsController
  get 'tags/new', to: 'tags#new', as: 'new_tag'


  #以下、テキストのもの（途中まで）をそのまま残している
# PostsController
  get '/', to: 'posts#index', as: 'index_post'
  get 'posts/new', to: 'posts#new', as: 'new_post'

  post 'posts/new', to: 'posts#create', as: 'create_post'

# TopicsController
  get 'topics/new', to: 'topics#new', as: 'new_topic'
  get 'topics/edit/:id', to: 'topics#edit', as: 'edit_topic'

  post 'topics/new', to: 'topics#create', as: 'create_topic'


end
