# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/issues/:issue_id/views', to: 'issue_view#index'
