class MeaningsController < ApplicationController
  def index
    meanings = Meaning.all
    render json: meanings.as_json
  end

  def create
    input = params[:word]
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{input}").parse(:json)

    word = response[0]["word"]
    meanings = response[0]["meanings"]

    first_part_of_speech = meanings[0]["partOfSpeech"]
    first_definition = meanings[0]["definitions"][0]["definition"]

    second_part_of_speech = meanings[1]["partOfSpeech"]
    second_definition = meanings[1]["definitions"][0]["definition"]

    third_part_of_speech = meanings[2]["partOfSpeech"]
    third_definition = meanings[2]["definitions"][0]["definition"]

    meaning = Meaning.create!(
      word: word,
      first_part_of_speech: first_part_of_speech,
      first_definition: first_definition,
      second_part_of_speech: second_part_of_speech,
      second_definition: second_definition,
      third_part_of_speech: third_part_of_speech,
      third_definition: third_definition,
    )
    if meaning.save
      render json: meaning.as_json
    else
      render json: { errors: meaning.errors.full_messages }, status: 418
    end
  end
end

# if params[:search]
#   response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{params[:search]}")
# else

## basic call
# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello")

# response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/hello").parse(:json)

# word = response[0]["word"]
# meanings = response[0]["meanings"]

# meaning_array = []
# meanings.each do |meaning|
#   word_hash = Hash.new
#   word_hash["part_of_speech"] = meaning["partOfSpeech"]
#   word_hash["definition"] = meaning["definitions"][0]["definition"]
#   meaning_array << word_hash
# end

# render json: meaning_array
