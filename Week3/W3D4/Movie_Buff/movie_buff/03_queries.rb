def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where(actors: {name: those_actors })
    .group(:id)
    .having('COUNT(*) = ?', those_actors.length)

end

def golden_age
  # Find the decade with the highest average movie score.


end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  actor_movies = Movie.select(:title).joins(:actors).where(actors: {name: name})

  Actor
    .select('actors.name')
    .joins(:movies)
    .where('actors.name != ?', name)
    .where('movies.title IN (?)', actor_movies).pluck(:name).uniq

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  employed_actors = Actor
    .select('actors.name')
    .joins(:castings)

    Actor
      .select('actors.name')
      .where('actors.name NOT IN (?)', employed_actors).count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  query = "%#{whazzername.chars.join('%')}%"

  Movie
    .select('movies.id, movies.title')
    .joins(:actors)
    .where('actors.name ilike ?', query)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

  Actor
    .select('actors.id, actors.name, MAX(movies.yr)-MIN(movies.yr) as career')
    .joins(:movies)
    .group('actors.id')
    .order('3 DESC, 2')
    .limit(3)



end
