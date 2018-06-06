Rails.application.routes.draw do
  resources :contatos
  get 'pesquisa' => 'pesquisa#index'
  get 'equipe' => 'equipe#index'
  get 'informa' => 'informa#index'
  get 'home'=>  'home#index'
  get 'home/*page', to: 'home#show'
  get 'nos-contate', to: 'contatos#new'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
