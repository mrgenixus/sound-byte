class Channel < ActiveRecord::Base
  attr_accessible :author, :category, :language, :summary, :title
  has_many :episodes
end
