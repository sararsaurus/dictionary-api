class WordsController < ApplicationController
  def index
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

    definition = response.parse(:json)
    render json: definition
  end
end

# if params[:search]
#   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params[:search]}")
# else

## basic call
# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

# definition = response.parse(:json)[0]["meanings"]
# render json: definition
