class ImportMoviesAndReviewsJob
  include Sidekiq::Worker
  require 'csv'

  def perform(*_args)
    CSV.foreach('db/movies.csv', headers: true) do |row|
      hashed_row = row.to_h

      movie = Movie.find_or_create_by(title: hashed_row['Movie'], actor: hashed_row['Actor'], location: hashed_row['Filming location'])
      movie.update_columns(
        description: hashed_row['Description'],
        director: hashed_row['Director'],
        year: hashed_row['Year'],
        country: hashed_row['Country']
      )
    end
    
    CSV.foreach('db/reviews.csv', headers: true) do |row|
      hashed_row = row.to_h

      movie = Movie.where('LOWER(title) = ?', hashed_row['Movie'].downcase).last
      next unless movie.present?

      review = Review.find_or_create_by(movie_id: movie.id, user: hashed_row['User'])
      review.update_columns(
        stars: hashed_row['Stars'],
        review: hashed_row['Review']
      )
    end
  end
end
