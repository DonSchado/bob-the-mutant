class Statement
  attr_reader :sentence

  def initialize(sentence="")
    @sentence = String(sentence)
  end

  def meaningless?
    sentence.empty?
  end

  def asking?
    sentence.end_with?("?")
  end

  def shouting?
    sentence == sentence.upcase
  end
end