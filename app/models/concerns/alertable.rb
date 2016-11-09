module Alertable
  extend ActiveSupport::Concern

  include Votable
  include Commentable
end
