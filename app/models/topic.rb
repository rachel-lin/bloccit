class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy
    validates :name, length: { minimum: 5 }, presence: true

    # scope depends on the value of user
    # returns the equivalent of topic_collection.where(public:true)
    scope :visible_to, -> (user) { user ? all : publicly_viewable }
    scope :publicly_viewable, -> { where(public: true) }
    scope :privately_viewable, -> { where(public: false) }
end
