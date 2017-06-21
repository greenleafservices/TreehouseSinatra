require "sinatra"

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

post "/create" do
  "Hello from the post/create route"
end