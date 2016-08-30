class FlavourSaver
  class RailsPartial
    def register_partial(*args)
      raise RuntimeError, "No need to register partials inside Rails."
    end
    def reset_partials; end
    def partials; end
    def fetch; end
  end
end
