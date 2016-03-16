f = open("news.js")
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
    elsif tmp = /\["(?<date>#{date}).*"\s*,\s*"(?<kind>[0|1|2])"\s*,\s*"(?<title>.*)"\]/.match(line)
      puts "#{tmp[:date]} #{tmp[:kind]} #{tmp[:title]}" 
      list[id1]=News.new(date:tmp[:date], kind:tmp[:kind], title:tmp[:title])
    end
  elsif mode == 2
    if /^\];/.match(line)
      mode = 3
    elsif tmp = /"(?<detail>.*)",?$/.match(line)
      puts tmp[:detail]
      list[id2].update(detail:tmp[:detail])
    end
  elsif mode == 3
    if id1 != id2
      puts "hey, it seems wrong!"
    end
  end
end

list.each do |news|
  puts news
end
