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
#Form variables to POST
post '/visit' do
@name = params[:username]
@phone = params[:phone]
@date = params[:datetime]
@maker = params[:model]
#Form validation
if @name == '' then 
@error = '* Укажите свое имя'
erb :visit
elsif @phone == '' then
	@error = '* Укажите свой телефон'
	erb :visit
elsif @date == '' then
	@error = '* Вы забыли указать дату'
	erb :visit
#Adding new registration to file
else
		f= File.open './public/za.txt' , 'a'
f.write "#{@name}, #{@phone}, #{@date} , #{@maker}  
  "
f.close
	@clap = "#{@name},мы ждем вас  #{@date},Если что то изменится - позвоним по телефону #{@phone},Ваш парихмахер - #{@maker}"
	erb :visit
end
end
get '/admin' do 
erb :admin
	end

#Sign in administaration Pannel
	post '/admin' do
@id = params[:username].to_s
@password = params[:phone].to_s
if @id == '2281128' && @password == 'myWave'
	then
erb :panelad
else 
	@error= 'Введено неверно, запрос отклонен'
	erb :admin

end

	end

#Contacts

get '/contacts' do
	erb :contacts
end



#Not founded page
 get '/*' do
erb  "<h1>'Ooops,page not found!'</h1>"
	end
