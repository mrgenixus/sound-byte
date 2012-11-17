class Episode < ActiveRecord::Base
  attr_accessible :channel_id, :subtitle, :title, :track_length, :audio
  belongs_to :channel

  has_attached_file :audio, 
  	:content_type => ['audio/mpeg','audio/x-m4a','video/mp4','video/x-m4v','video/quicktime','application/pdf','document/x-epub', 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'],
  	:message => 'must be a valid audio or video file'
  before_audio_post_process :fetch_media_length

  #http://blog.firmhouse.com/validate-length-of-an-audio-file-when-using-paperclip-and-s3
  def fetch_media_length
  	begin
  		uploaded_file_path = audio.queued_for_write[:original].path
  		duration_in_seconds = FFMPEGWrapper.duration_in_seconds(uploaded_file_path);

  	rescue
  		duration_in_seconds = 1.0
  	end
  	self.track_length = duration_in_seconds;
  end

  def track_length_formatted 
    
    begin
      "%02d" % (self.track_length / 24 / 60).floor + ":" + "%02d" % (self.track_length / 60 % 24) + ":"  + "%02d" % (self.track_length % 60)
    rescue Exception => e
      "00:00:00"
    end
  	
  end
end
