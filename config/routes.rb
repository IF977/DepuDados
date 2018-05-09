Rails.application.routes.draw do
  get 'pesquisa' => 'pesquisa#index'
  get 'equipe' => 'equipe#index'
  get 'informa' => 'informa#index'
  get 'home'=>  'home#index'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
