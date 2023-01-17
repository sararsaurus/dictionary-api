class WordsController < ApplicationController
  def index
    if params[:search]
      response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params[:search]}")
    else
      response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")
    end
    definition = response.parse(:json)[0]["meanings"]
    render json: definition
  end
end

## basic call
# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

# definition = response.parse(:json)[0]["meanings"]
# render json: definition
