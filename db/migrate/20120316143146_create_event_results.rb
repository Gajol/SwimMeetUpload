class CreateEventResults < ActiveRecord::Migration
  def change
    create_table :event_results do |t|
      t.column :filename, :string
      t.column :content_type, :string
      t.column :data, :binary
      t.timestamps
    end
  end
  
    def self.down
        drop_table :attachments
    end
	
end
