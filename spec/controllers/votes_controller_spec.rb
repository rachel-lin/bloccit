 require 'rails_helper'
 
 describe VotesController do
 
   include TestFactories
   include Devise::TestHelpers
 
   describe '#up_vote' do
     it "adds an up-vote to the post" do
      request.env["HTTP_REFERER"] = '/'
       @user = authenticated_user # defined by factory 
       @post = associated_post # defined by factory
       sign_in @user # using a devise test helper method
 
       expect {
         post( :up_vote, post_id: @post.id ) # we expect that making a post request will change the upvote count
       }.to change{ @post.up_votes }.by 1
     end
   end
 end