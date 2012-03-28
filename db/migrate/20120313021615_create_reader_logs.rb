class CreateReaderLogs < ActiveRecord::Migration
  def change
    create_table :reader_logs do |t|
      t.string :channel
      t.string :tel
      t.string :imei
      t.string :imsi
      t.string :android_version
      t.string :mobile_model
      t.string :name
      t.string :agent
      t.string :x_forwarded_for
      t.string :remote_ip
      t.integer :cid

      t.timestamps
    end
  end
end