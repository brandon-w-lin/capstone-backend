Rails.application.routes.draw do
  resources :book_songs
  # resources :songs
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/songs" => "songs#index"
  get "/songs/id/:YTExtension" => "songs#show"
  post "/songs" => "songs#create"
  patch "/songs/id/:YTExtension" => "songs#update"
  delete "/songs/id/:YTExtension" => "songs#destroy"
  # get "/query" => "youtube_api#show"
  get "/songs/search" => "songs#search"
end
