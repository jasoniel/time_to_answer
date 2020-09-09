Rails.application.routes.draw do
  
  namespace :admins_backoffice do
    # get 'admins/index'
    # get 'admins/edit/:id', to: 'admins#edit'
    get 'welcome/index' # Dashboard
    # resources :admins, only: [:index, :edit, :update, :new, :create ] #cria todas rotas padrão rest # Adms
    resources :admins #cria todas rotas padrão rest # Adms
    resources :subjects #cria todas rotas padrão rest # Assuntos
    resources :questions #cria todas rotas padrão rest # Questões
  end

  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  devise_for :admins
  devise_for :users
  get 'inicio',to: 'site/welcome#index' 
  root  to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
