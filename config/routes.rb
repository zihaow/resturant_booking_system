Rails.application.routes.draw do
  post 'reservations' => 'reservations#reserve', defaults: { format: :json }
end
