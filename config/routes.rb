  Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

# User_propilesController
  get 'user_propiles/new', to: 'user_propiles#new', as: 'new_user_propile'

# ConsultingsController

  get '/', to: 'consultings#index', as: 'index_consulting'
  get 'consultings/new', to: 'consultings#new', as: 'new_consulting'
  post 'consultings/new', to: 'consultings#create', as: 'create_consulting'
  get 'consultings/edit/:id', to: 'consultings#edit', as: 'edit_consulting'
  post 'consultings/edit/:id', to: 'consultings#update', as: 'update_consulting'


# ResponsesController
  get 'responses/new', to: 'responses#new', as: 'new_response'
  post 'responses/new', to: 'responses#create', as: 'create_response'

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
