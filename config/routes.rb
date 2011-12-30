Pawi::Engine.routes.draw do
  filter :locale if respond_to?('filter')
  resources :pages, :only => [:show]
end
