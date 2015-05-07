require 'rails_helper'

describe User do 
  
  include TestFactories

  before do
      @post = Post.create(title: 'post title', body: 'post body which is longer than twenty characters')
      3.times { @post.votes.create(value: 1)}
    end

  describe "#favorited(post)" do

    it "returns `nil` if the user has not favorited the post" do
      expect( @post.favorited ).to eq(false)
    end

    it "returns the appropriate favourite if it exists" do
      expect( @post ).to eq()
    end

    it "returns `nil` if the user has favorited another post" do
    end

  end
  
end