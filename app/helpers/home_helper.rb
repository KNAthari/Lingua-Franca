module HomeHelper
    def languages_for_header
        @languages ||= Language.all
    end
end
