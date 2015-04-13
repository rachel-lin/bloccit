require 'faker'

# Create Posts


50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end


Post.find_or_create_by (
  :title => "additional post 1",
  :body => "additional post 1 content")

posts = Post.all 

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )  
end

Comment.find_or_create_by (
  :body => "additional post 1 comment")



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"