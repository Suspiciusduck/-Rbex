class Add < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_city,
                  against: %I[city],
                  using: { tsearch: { prefix: true } }

  reverse_geocoded_by :latitude, :longitude do |add, results|
    if (geo = results.first)
      add.city = geo.city
    end
  end

  before_save :set_latitude_and_longitude

  def set_latitude_and_longitude
    self.latitude = x
    self.longitude = y
  end
  attr_accessor :x, :y
end
