class WordValidationPresenter
  def initialize(word)
    @word = word
  end

  def word_validation
    if response.status == 200
      word_information = JSON.parse(response.body, symbolize_names: true)
      message(word_information)
    else
      "'#{@word}' is not a valid word."
    end
  end

  private

  def response
    OxfordDictionaryService.new.word_information(@word)
  end

  def message(word_info)
    "'#{word_info[:results][0][:word]}' is a valid word and its root form is '#{word_info[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]}'."
  end
end
