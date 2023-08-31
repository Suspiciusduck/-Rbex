class Add < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_city,
                  against: %I[city],
                  using: { tsearch: { prefix: true } }
end
