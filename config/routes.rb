# == Route Map
#
#     Prefix Verb   URI Pattern                Controller#Action
#     boards GET    /boards(.:format)          boards#index
#            POST   /boards(.:format)          boards#create
#  new_board GET    /boards/new(.:format)      boards#new
# edit_board GET    /boards/:id/edit(.:format) boards#edit
#      board GET    /boards/:id(.:format)      boards#show
#            PATCH  /boards/:id(.:format)      boards#update
#            PUT    /boards/:id(.:format)      boards#update
#            DELETE /boards/:id(.:format)      boards#destroy
#   comments POST   /comments(.:format)        comments#create
#    comment DELETE /comments/:id(.:format)    comments#destroy

Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/me'

  get 'home/index'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  root 'home#index'
  resources :boards
  resources :comments, only: [:create, :destroy]
end
