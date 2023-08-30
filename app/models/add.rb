class Add < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_city_and_title,
                  against: %I[city title],
                  using: { tsearch: { prefix: true } }
end
