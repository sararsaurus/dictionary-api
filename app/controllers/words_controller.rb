class WordsController < ApplicationController
  def index

    ## the below works
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

    definition = response.parse(:json)[0]["meanings"]
    render json: definition

    ## the below doesn't
    if params[:search]
      response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params}")
      definition = response.parse(:json)[0]["meanings"]
      render json: definition
    else
      response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")
      definition = response.parse(:json)[0]["meanings"]
      render json: definition
    end
  end
end
