class Add < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  include PgSearch::Model
  pg_search_scope :search_by_city_and_title,
                  against: %I[city title],
                  using: { tsearch: { prefix: true } }
=======
  has_one_attached :photo
>>>>>>> 0bdd42eaaf3fc7d81a2c95ff07a966a84de9c709
end
