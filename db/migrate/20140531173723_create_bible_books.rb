class CreateBibleBooks < ActiveRecord::Migration
  def change
    create_table :bible_books do |t|
      t.integer :position
      t.string :name
      t.integer :chapter_count
      t.string :dam_id,       length: 7
      t.string :external_id,  length: 5

      t.timestamps
    end
    
    add_index :bible_books, :name,        unique:true
    add_index :bible_books, :external_id, unique:true
  end
end
