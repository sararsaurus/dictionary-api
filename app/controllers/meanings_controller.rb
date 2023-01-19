class MeaningsController < ApplicationController
  def index
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello").parse(:json)

    word = response[0]["word"]
    meanings = response[0]["meanings"][0]
    render json: meanings
  end
end

# if params[:search]
#   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params[:search]}")
# else

## basic call
# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

# definition = response.parse(:json)[0]["meanings"]
# render json: definition
