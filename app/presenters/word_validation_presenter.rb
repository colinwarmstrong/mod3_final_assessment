class WordValidationPresenter
  def initialize(word)
    @word = word
  end

  def word_validation
    if word.nil?
      "Enter a word to check its' validity and root form."
    elsif response.status == 200
      message(parse_response)
    else
      "'#{word}' is not a valid word."
    end
  end

  private
  attr_reader :word

  def response
    @response ||= OxfordDictionaryService.new.word_information(word)
  end

  def parse_response
    JSON.parse(response.body, symbolize_names: true)
  end

  def message(word_info)
    "'#{word_info[:results][0][:word]}' is a valid word and its root form is '#{word_info[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]}'."
  end
end
