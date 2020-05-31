Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'
  get '/execute_sql/:query', to: 'sql#execute_sql', as: "execute_sql"
end
