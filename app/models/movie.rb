class Movie < ApplicationRecord
  has_many :reviews

  scope :order_by_average_stars, -> {
    select('movies.*, AVG(reviews.stars) AS average_stars')
      .left_joins(:reviews)
      .group(:id)
      .order('average_stars DESC NULLS LAST')
  }
end
