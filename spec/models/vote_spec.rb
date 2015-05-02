require 'rails_helper'

describe Vote do
  describe 'validations' do

    before do
      @post = Post.create(title: 'post title', body: 'longer post body that is longer than twenty characters')
      2.times { @post.votes.create(value: 1)}
      2.times { @post.votes.create(value: -1)}
    end


    describe 'value_validation' do
      it 'only allows -1 or 1 as values' do
        expect( @post.valid? ).to eq(true)
      end
    end


  end
end