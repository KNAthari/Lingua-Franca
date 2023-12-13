class Language < ApplicationRecord
    has_many :lessons, dependent: :destroy
end
