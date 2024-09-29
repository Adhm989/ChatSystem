Rails.application.routes.draw do
  resources :applications, only: [ :create ]
  resources :chats, only: [ :create ]
  resources :messages, only: [ :create ]
end
