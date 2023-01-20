class MeaningsController < ApplicationController
  def index
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello").parse(:json)

    word = response[0]["word"]
    meanings = response[0]["meanings"]

    meaning_array = []
    meanings.each do |meaning|
      word_hash = Hash.new
      word_hash["part_of_speech"] = meaning["partOfSpeech"]
      word_hash["definition"] = meaning["definitions"][0]["definition"]
      meaning_array << word_hash
    end

    render json: meaning_array
  end
end

# if params[:search]
#   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params[:search]}")
# else

## basic call
# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")
