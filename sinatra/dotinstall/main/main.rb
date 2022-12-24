require 'sinatra' # sinatraを読み込む
require 'sinatra/reloader' # sinatraを再起動しなくても追記を反映できる

get '/' do
  "hello world"
end

get '/about' do
  "about this site page"
end

get '/hello/:name' do
  "hello, #{params[:name]}"
end

# ↑と↓は同じ

get '/hi/:name' do |n|
  "hi, #{n}"
end

# ?は、あってもなくてもという意味
get '/good/:fname/?:lname?' do |f, l|
  "good morning, #{f} #{l}"
end

get '/from/*/to/*' do |f, t|
  "from #{f} to #{t}"
end

get %r{/users/([0-9]*)} do |i|
  "user id = #{i}"
end 

get '/erb' do
  erb :index
end

get '/erb2/:name' do |n|
  "hello #{n}"
  @name = n
  @title = "main index"
  erb :index
end

get '/erb3/content' do
  @title = "main  index"
  @content = "main content"
  erb :index
end

get '/erb4/about' do
  @title = "about this page"
  @content = "this page is ..."
  @email = "hogehoge@example.com"
  erb :about
end

# ここで宣言したものはどこでも使える
before do
  @author = "Nora"
end

# ターミナルのログにメッセージを表示する
after do
  logger.info "page displayed successfully"
end

get '/filter' do
  @title = "about this page"
  @content = "this page is ... by " + strong(@author)
  @email = "hogehoge@example.com"
  erb :about
end

# こういう書き方も出来る(未使用)
before '/admin/*' do
  @msg = "admin area!"
end

# 関数チックなものを定義する
helpers do

  def strong(s)
    "<strong>#{s}</strong>"
  end

end

























