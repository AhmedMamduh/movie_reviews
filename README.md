# Movies Reviews Application

This is a small Ruby on Rails application designed to show movies sorting by reviews rating. It allows users to import movies and reviews data from CSV files, view movies details, search for movies by actor, and sort movies by average rating.

### Installation
1. Clone the repository

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Setup the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. Start the Sidekiq server:
   ```bash
   bundle exec sidekiq
   ```

5. Start the server:
   ```bash
   rails s
   ```

6. Importing data:
   ```bash
   rails import:csv
   ```

## Usage

### Viewing Movies
You can view all movies by visiting the `localhost:3000` route.

### Searching by Actor
To search for movies by actor, enter the actor's name in the search form available on the movies index page `localhost:3000`.

### Sorting by Average Rating
Movies is sorted by average rating (stars) in descending order.
