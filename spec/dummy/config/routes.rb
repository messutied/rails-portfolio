Rails.application.routes.draw do
  mount Portfolio::Engine => "/"
  root 'portfolio/sites#default'
end
