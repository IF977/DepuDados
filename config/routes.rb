Rails.application.routes.draw do
  get 'pesquisa' => 'pesquisa#index'
  get 'equipe' => 'equipe#index'
  get 'informa' => 'informa#index'
  get 'home'=>  'home#index'
  get 'regiao', to: 'home#regiao'
  get 'regiao/*page', to: 'home#show'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
