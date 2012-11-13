class Episode < ActiveRecord::Base
  attr_accessible :channel_id, :content_type, :subtitle, :title, :track_length, :audio
  belongs_to :channel

  has_attached_file :audio, 
  	:content_type => ['audio/mpeg','audio/x-m4a','video/mp4','video/x-m4v','video/quicktime','application/pdf','document/x-epub'],
  	:message => 'must be a valid audio or video file'
  before_audio_post_process :fetch_media_length

  #http://blog.firmhouse.com/validate-length-of-an-audio-file-when-using-paperclip-and-s3
  def fetch_media_length
  	duration_in_seconds = 1.0
  	begin
  		uploaded_file_path = audio.queued_for_write[:original].path
  		duration_in_seconds = FFMPEGWrapper.duration_in_seconds(uploaded_file_path);
  	end
  	self.track_length = duration_in_seconds;
  end
  def track_length_formatted 
  	(track_length / 24 / 60).floor.to_s + ":" +(track_length / 60 % 24).to_s + ":"  + (track_length % 60).to_s
  end
end
