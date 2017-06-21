#def page_content(title)
#  File.read("pages/#{title}.txt")
#rescue Errno::ENOENT
#  return nil
#end
#
#puts page_content("Nick Pettit")

def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

#save_content("Ben Deitch", "Treehouse guy")

save_content("Nick Pettit", "Another Treehouse guy")