class Comment < ActiveRecord::Base
  belongs_to :user

    validates :body, length: { minimum: 5 }, presence: true
end
