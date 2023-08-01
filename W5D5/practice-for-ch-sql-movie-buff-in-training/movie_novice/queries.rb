# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  yr          :integer          not null
#  score       :float            not null
#  votes       :integer          not null
#  director_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Table name: castings
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint           not null
#  actor_id   :bigint           not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null


def find_angelina
  Actor.find_by(name: 'Angelina Jolie')
  # find all actors whose name starts with 'Ang'
  # hint: use 'where' and 'like'
  # Actor.where('name LIKE ?', 'Ang%')
  # # find all actors whose name contains 'e'
  # # hint: use 'where' and 'like'
  # Actor.where('name LIKE ?', '%e%')
  # # find all actors whose name ends in 'y'
  # # hint: use 'where' and 'like'
  # Actor.where('name LIKE ?', '%y')
  # # find all actors whose last name begins with 'J'
  # # hint: use 'where' and 'like'
  # Actor.where('name LIKE ?', '% J%')
  # # find all actors whose last name begins with 'J' using #starts_with
  # # hint: use 'where' and 'starts_with'
  # Actor.where('name LIKE ?', 'J%')
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.where('score >= 9').select(:title)
end

def star_wars
  # display the id, title, and year of each Star Wars movie in movies
  # hint: use 'select' and 'where'
  Movie.where('title LIKE ?', 'Star Wars%').select(:id, :title, :yr)
end


def below_average_years
  # display each year with movies scoring under 5, with the count of movies
  # scoring under 5 aliased as bad_movies, in descending order
  # hint: use 'select', 'where', 'group', 'order'
  Movie.where('score < 5').group(:yr).order('COUNT(id) DESC').select('yr, COUNT(id) AS bad_movies')

end

def alphabetized_actors
  # display the id and name of the second 10 actor names (i.e., #s 11-20)
  # when ordered from A-Z
  # hint: use 'order' and 'limit'
  Actor.order(:name).limit(10).offset(10).select(:id, :name)
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  Actor.joins(:movies).where('title = ?', 'Pulp Fiction').select(:id, :name)
end

def uma_movies
  # practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Movie.joins(:actors).where('name = ?', 'Uma Thurman').select(:id, :title, :yr).order('yr ASC')
end
