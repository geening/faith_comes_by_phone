# seeds.rb

def nuke_table(model)
  model.delete_all
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name}")
end

nuke_table(Bible::Book) unless Rails.env.production?

unless Bible::Book.count > 0
  {english:"ESV"}.each do |lang, version|  #"Chinese":"RUV", "Philippine languages"
    
    puts "Learning the Bible in #{lang}"
    DBP_CLIENT.books(language: lang, version:version).each do |book|
      Bible::Book.create!({
        position:       book.book_order,
        name:           book.book_name,
        chapter_count:  book.number_of_chapters,
        dam_id:         book.dam_id,
        external_id:    book.book_id,
      })
    end
    
  end
end