# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Post.destroy_all
Comment.destroy_all

50.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    post = Post.create(
        title: Faker::Book.title,
        body: Faker::Lorem.characters(number: 51)
    )
    if post.valid?
        rand(1..5).times do
            Comment.create(
                body: Faker::Hacker.say_something_smart, post: post
            )
        end
    end

end

posts = Post.all
comments = Comment.all

puts "generated #{posts.count} posts"
puts "generated #{comments.count} comments"