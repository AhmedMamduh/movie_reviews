namespace :import do
  desc "Import movies and reviews from CSV"
  task :csv => :environment do
    ImportMoviesAndReviewsJob.perform_async
    puts "Import job queued"
  end
end
