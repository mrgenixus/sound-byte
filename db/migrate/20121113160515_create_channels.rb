class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :author
      t.string :title
      t.string :summary
      t.string :category
      t.string :language

      t.timestamps
    end
  end
end
