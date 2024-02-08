class ImportMoviesAndReviewsJob
  include Sidekiq::Worker
  require 'csv'

  def perform(*_args)
    import_movies
    import_reviews
  end

  def import_movies
    CSV.foreach('db/movies.csv', headers: true) do |row|
      hashed_row = row.to_h

      movie = Movie.find_or_create_by(
        title: hashed_row['Movie'],
        description: hashed_row['Description'],
        director: hashed_row['Director'],
        year: hashed_row['Year']
      )

      next unless movie.present?

      movie.movie_details.find_or_create_by(
        actor: hashed_row['Actor'],
        location: hashed_row['Filming location'],
        country: hashed_row['Country']
      )
    end
  end

  def import_reviews
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
