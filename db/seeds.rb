require 'faker'

# Create Users

5.times do
  user = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10) 
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Posts


50.times do
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end

=begin
  Post.find_or_create_by (
  :title => "additional post 1",
  :body => "additional post 1 content")
=end


posts = Post.all 

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )  
end

=begin
Comment.find_or_create_by (
  :body => "additional post 1 comment")
=end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'rachel.lin91@gmail.com',
  password: 'helloworld'
  )


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"