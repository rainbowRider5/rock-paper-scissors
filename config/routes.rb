Rails.application.routes.draw do
  root "pages#home"

  post "/play", to: 'game#play'
end
