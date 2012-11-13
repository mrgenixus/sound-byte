class Episode < ActiveRecord::Base
  attr_accessible :channel_id, :content_type, :subtitle, :title, :track_length
  belongs_to :channel

  def track_length_formatted 
  	(track_length / 24 / 60).floor.to_s + ":" +(track_length / 60 % 24).to_s + ":"  + (track_length % 60).to_s
  end
end
