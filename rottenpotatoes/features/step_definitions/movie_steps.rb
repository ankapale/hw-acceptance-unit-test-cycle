Given(/^the following movies exist:$/) do |table|
  table.hashes.each do |movie_title|
    Movie.create(movie_title)
  end
end
  
Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie_title, director_name|
  m = Movie.find_by_title(movie_title)
  expect(m.director).to eq director_name
  end

Then(/^the first movie by "([^"]*)" should be "([^"]*)"$/) do |filter, movie_title|
  if filter == 'Title'
    f = :title
  else
    f = :release_date
  end
  m = Movie.order(f).first
  expect(m.title).to eq movie_title
end