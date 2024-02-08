class Movie < ApplicationRecord
  has_many :movie_details, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
