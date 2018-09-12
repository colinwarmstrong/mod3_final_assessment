class OxfordDictionaryService
  def initialize(source_language = 'en')
    @conn = conn
    @source_language = source_language
  end

  def validate_word(word)
    response = conn.get("inflections/#{@source_language}/#{word}")
    if response.status == 200
      word_information = JSON.parse(response.body, symbolize_names: true)
      message(word_information)
    else
      "'#{word}' is not a valid word."
    end
  end

  private

  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
      faraday.headers['app_id'] = ENV['OXFORD_APP_ID']
      faraday.headers['app_key'] = ENV['OXFORD_APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def message(word_info)
    binding.pry
    "'#{word_info[:results].last[:word]}' is a valid word and its root form is '#{word_info[:results][]}'"
  end
end
