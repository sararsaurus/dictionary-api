class WordsController < ApplicationController
  def index
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

    meanings = response.parse(:json)[0]["meanings"]
    render json: meanings

    # if params[:search]
    #   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params}")

    #   data = response.parse(:json)
    #   articles = data["articles"]
    # else
    #   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

    #   data = response.parse(:json)
    #   articles = data["articles"]
    # end
    # render json: articles
  end
end
