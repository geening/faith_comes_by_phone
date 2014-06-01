class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code, null:false, limit:3 
      t.string :default_bible_version
      t.string :twilio_phone_number
      t.string :twilio_sid

      t.timestamps
    end
    
    add_index :languages, :code,        unique:true
    add_index :languages, :twilio_sid,  unique:true
  end
end
