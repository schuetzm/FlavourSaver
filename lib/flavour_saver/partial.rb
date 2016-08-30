class FlavourSaver
  UnknownPartialException = Class.new(StandardError)

  class Partial

    def register_partial(name, content=nil, &block)
      if block.respond_to? :call
        partials[name.to_s] = block
      else
        partials[name.to_s] = Parser.parse(Lexer.lex(content))
      end
    end

    def reset_partials
      @partials = {}
    end

    def partials
      @partials ||= {}
    end

    def fetch(name)
      p = partials[name.to_s]
      raise UnknownPartialException, "I can't find the partial named #{name.inspect}" unless p
      p
    end

  end
end
