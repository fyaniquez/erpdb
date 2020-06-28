Rails.application.routes.draw do
  root 'ventas#index'
  devise_for :users
  resources :productos
  resources :categorias
  resources :capitulos
  resources :marcas
  resources :personas
  resources :empresas
  resources :inventarios
  resources :inventariados
  resources :ventas
  resources :vendidos
  resources :compras
  resources :comprados
  resources :precios
  resources :user
end
