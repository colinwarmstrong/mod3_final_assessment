class OxfordDictionaryService
  def initialize(source_language = 'en')
    @source_language = source_language
  end

  def word_information(word)
    conn.get("inflections/#{@source_language}/#{word}")
  end

  private

  def conn
    Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
      faraday.headers['app_id']  = ENV['OXFORD_APP_ID']
      faraday.headers['app_key'] = ENV['OXFORD_APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
