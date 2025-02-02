# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

# nettoyage des projets et idées
Project.destroy_all
Idea.destroy_all

# retrouver mon user
user = User.last
portfolio = user.portfolio
puts "User: #{user.email}"
puts "Portfolio: #{portfolio.company_name}"



# Créer 5 projets grâce à Faker
5.times do
  project = Project.new(
    title: Faker::Games::LeagueOfLegends.champion,
    description: Faker::Markdown.sandwich,
    portfolio: portfolio,
    user: user
  )
  avatar_url = Faker::Avatar.image(size: "50x50", format: "jpg")
  project.avatar.attach(io: URI.open(avatar_url), filename: "#{project.title}.jpg", content_type: "image/jpg")
  project.save!
  puts "Project: #{project.title} created !"
end

# Créer 5 idées grâce à Faker
5.times do
  idea = Idea.new(
    title: Faker::Sports::Football.team,
    description: Faker::Markdown.sandwich,
    portfolio: portfolio,
    user: user
  )
  avatar_url = Faker::Avatar.image(size: "50x50", format: "jpg")
  idea.avatar.attach(io: URI.open(avatar_url), filename: "#{idea.title}.jpg", content_type: "image/jpg")
  idea.save!
  puts "Idea: #{idea.title} created !"
end

puts "Seed finished !"
