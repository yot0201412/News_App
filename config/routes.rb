Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'news_api#show'
  post  'news_api' => 'news_api#show'
  get  'news_api' => 'news_api#show'
end
