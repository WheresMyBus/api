class Comment < ApplicationRecord
  include Votable

  belongs_to :commentable, polymorphic: true
end
