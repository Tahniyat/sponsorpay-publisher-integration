SponsorpayTask::Application.routes.draw do

  root :to => 'home#index'

  match 'offers', to: 'home#offers', via: [:post]

end
