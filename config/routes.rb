Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
