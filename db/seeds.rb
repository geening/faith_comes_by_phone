# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dbp_client = DigitalBiblePlatform::Client.new(AppConfig.digital_bible_platform.api_key)

unless Bible::Book.count > 0
  dbp_client.books.each do |book|
    Bible::Book.create!({
      position:       book.book_order,
      name:           book.book_name,
      chapter_count:  book.number_of_chapters,
      dam_id:         book.dam_id,
      external_id:    book.book_id,
    })
  end
end