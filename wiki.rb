require "sinatra"
require "uri"

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nil
end

def save_content(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

def delete_content(title)
  File.delete("pages/#{title}.txt")
end

# ****************** Routes ******************
get "/" do #root route
  erb :welcome
end

get "/test" do
  erb :test
end
  
get "/new" do
  erb :new
end

get "/:title" do
  @title = params[:title]
  #Use the Page_content method (above) to get the file contents
  @content = page_content(@title)
  erb :show
end

get "/:title/edit" do
  @title = params[:title]
  #Use the Page_content method (above) to get the file contents
  @content = page_content(@title)
  erb :edit
end

post "/create" do
  #params.inspect
  #resule of params.inspect is
  # {"title"=>"Entered title", "content"=>"Entered Content"}
  #pass these to the save_content method
  save_content(params["title"], params["content"])
  #go back to the page you just wrote
  redirect URI.escape("/#{params["title"]}")
end
#The put request will update the page with any new data entered by the edit process
put "/:title" do
  save_content(params["title"], params["content"])
  #go back to the page you just wrote
  redirect URI.escape("/#{params["title"]}")
end

delete "/:title" do
  delete_content(params[:title])
  redirect "/"
end