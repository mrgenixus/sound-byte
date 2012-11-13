class AddAttachmentAudioToEpisodes < ActiveRecord::Migration
  def self.up
    change_table :episodes do |t|
      t.has_attached_file :audio
    end
  end

  def self.down
    drop_attached_file :episodes, :audio
  end
end
