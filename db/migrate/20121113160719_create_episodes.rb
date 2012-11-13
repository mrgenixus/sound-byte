class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :channel_id
      t.string :title
      t.string :subtitle
      t.integer :track_length
      t.string :content_type

      t.timestamps
    end
  end
end
