require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end
post '/visit' do
@name = params[:username]
@phone = params[:phone]
@date = params[:datetime]
@maker = params[:model]
if @name == '' then 
@message = 'Укажите свое имя'
erb :visit
elsif @phone == '' then
	@message = 'Укажите свой телефон'
	erb :visit
elsif @date == '' then
	@message = 'Вы забыли указать дату'
	erb :visit

else
		f= File.open './public/za.txt' , 'a'
f.write "#{@name}, #{@phone}, #{@date} , #{@maker}  
  "
f.close
	@message = "#{@name},мы ждем вас  #{@date},Если что то изменится - позвоним по телефону #{@phone},Ваш парихмахер - #{@maker}"
	erb :visit
end
end
get '/admin' do 
erb :admin
	end


	post '/admin' do
@id = params[:username].to_s
@password = params[:phone].to_s
if @id == '2281128' && @password == 'myWave'
	then
erb :panelad
else 
	@messageadm = 'Введено неверно, запрос отклонен'
	erb :admin

end

	end


