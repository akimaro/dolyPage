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
      logger.info "mode move into 1"
    end
  elsif mode == 1
    if /NEWS_DETAIL/.match(line)
      mode = 2
      logger.info "mode move into 2"
    elsif tmp = /\["(?<date>#{date}).*"\s*,\s*"(?<kind>[0|1|2])"\s*,\s*"(?<title>.*)"\]/.match(line)
      logger.info "#{tmp[:date]} #{tmp[:kind]} #{tmp[:title]}" 
      list[id1]=News.new(date:tmp[:date], kind:tmp[:kind], title:tmp[:title])
    end
  elsif mode == 2
    if /^\];/.match(line)
      mode = 3
    elsif tmp = /"(?<detail>.*)",?$/.match(line)
      logger.info tmp[:detail]
      list[id2].update(detail:tmp[:detail])
    end
  elsif mode == 3
    if id1 != id2
      logger.info "hey, it seems wrong!"
    end
  end
end

list.each do |news|
  logger.info news
  news.save
end
