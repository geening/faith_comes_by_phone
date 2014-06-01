class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer   :language_id,   null:false
      t.string    :phone_number,  null:false, limit:20
      t.integer   :bible_book_id
      t.integer   :current_chapter
      t.datetime  :last_call_at
      t.datetime  :last_sms_at

      t.timestamps
    end
    
    add_index :users, :phone_number
    add_index :users, :language_id
  end
end
