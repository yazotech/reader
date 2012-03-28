class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channel
      t.string :main_channel
      t.string :remark
      t.integer :status, :default => 0

      t.timestamps
    end
  end

end
