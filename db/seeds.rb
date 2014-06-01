# seeds.rb

def nuke_table(model)
  model.delete_all
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name}")
end

unless Rails.env.production?
  nuke_table(Bible::Book)
  nuke_table(Language)
end


Language.create!({
  code:'ENG',
  default_bible_version:'ESV',
  twilio_sid: 'PN34183bbea54a46c3ba5f7a530f91c2f6',
  twilio_phone_number: '+14153674222',
})

Language.all.each do |lang|
  puts "Learning the Bible in #{lang}"
  DBP_CLIENT.books(language: lang.code, version:lang.default_bible_version).each do |book|
    Bible::Book.create!({
      language:       lang, 
      position:       book.book_order,
      name:           book.book_name,
      chapter_count:  book.number_of_chapters,
      dam_id:         book.dam_id,
      external_id:    book.book_id,
      version:        lang.default_bible_version
    })
  end
end


#"Chinese":"RUV", "Philippine languages"