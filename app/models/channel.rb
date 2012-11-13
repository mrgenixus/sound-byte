class Channel < ActiveRecord::Base
  attr_accessible :author, :category, :language, :summary, :title, :slug
  has_many :episodes
  def to_param
  	if ! self.slug 
  		self.slug = self.title.parameterize 
  		self.save
  	end
  	self.slug
  end

  before_save :save_slug

  def save_slug
  	self.slug = self.title.parameterize
  end
end
