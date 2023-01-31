Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|en/ do
    root to: 'shops#index'
    resources :shops, only: %i[index show]
  end
end
