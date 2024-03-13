Rails.application.routes.draw do
  post 'reservations' => 'reservations#reserve', defaults: { format: :json }
  get 'tables/occupied' => 'tables#list', defaults: { format: :json }
end
