require "sinatra"
require "uri"

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nil
end

get "/" do
  erb :welcome
end

get "/test" do
  erb :test
end
  

#get "/:title" do
#  page_content(params[:title])
#end
get "/new" do
  erb :new
end

get "/:title" do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end
# {"title"=>"Test", "content"=>"Test Content"}
post "/create" do
  #params.inspect
  #resule of params.inspect is
  # {"title"=>"Test", "content"=>"Test Content"}
  #pass this to the save_content process
  save_content(params["title"], params["content"])
  redirect URI.escape("/#{params["title"]}")
end

def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

#test comment
