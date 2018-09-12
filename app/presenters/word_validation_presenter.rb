class WordValidationPresenter
  def initialize(word)
    @word = word
  end

  def word_validation
    OxfordDictionaryService.new.validate_word(@word)
  end
end
