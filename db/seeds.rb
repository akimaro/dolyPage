# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#ActiveRecord::Base.connection.execute("BEGIN TRANSACTION; END;")
f = open("db/news.js")
list = Array.new
mode = 0

date = "\\d+\\/\\d+\\/\\d+"
id1 = 0
id2 = 0
f.each do |line|
  if mode == 0
    if /^\[$/.match(line)
      mode = 1
      puts "mode move into 1"
    end
  elsif mode == 1
    if /NEWS_DETAIL/.match(line)
      mode = 2
      puts "mode move into 2"
    elsif tmp = /\["(?<date>#{date}).*"\s*,\s*"(?<kind>[0|1|2])"\s*,\s*"(?<titl\
e>.*)"\]/.match(line)
      puts "#{tmp[:date]} #{tmp[:kind]} #{tmp[:title]}"
      list[id1]=News.new(date:tmp[:date], kind:tmp[:kind], title:tmp[:title])
      id1 += 1
    end
  elsif mode == 2
    if /^\];/.match(line)
      mode = 3
    elsif tmp = /"(?<detail>.*)",?$/.match(line)
      puts tmp[:detail]
      list[id2].attributes = {detail:tmp[:detail]} if list[id2]!=nil
      id2 += 1
    end
  elsif mode == 3

  end
end
if id1 != id2
  puts "hey, it seems wrong! #{id1} != #{id2}"
else
  puts "It's completed."
end

list.each do |news|
  puts news
  news.save
end



