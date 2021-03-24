class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    
    erb :"application/new"
  end
end
