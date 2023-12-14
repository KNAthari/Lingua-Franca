module ApplicationHelper
    def languages_for_header
        @languages ||= Language.all
    end
    def sign_out_path
        destroy_user_session_path
    end
end
