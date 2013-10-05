require 'statement'

class Bob

  def hey(sentence)
    reply_to Statement.new(sentence)
  end

  private
    def reply_to(statement)
      if statement.meaningless?
        "Fine. Be that way."
      elsif statement.asking?
        "Sure."
      elsif statement.shouting?
       "Woah, chill out!"
      else
        "Whatever."
      end
    end

end
