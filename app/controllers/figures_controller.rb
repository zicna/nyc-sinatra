class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    
    erb :"application/new"
  end
  post '/figures' do
    #binding.pry
    @figure = Figure.create(params[:figure])
  end
end
