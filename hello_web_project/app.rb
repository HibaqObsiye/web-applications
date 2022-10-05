require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
    configure :development do
      register Sinatra::Reloader
    end

    get '/hello' do
      # name = params[:name]
      # return "hello #{name}"
      return erb(:index)
    end

    get '/posts' do
      name = params[:name]
      cohort_name = params[:cohort_name]

      return "Hello #{name}, you are in the cohort #{cohort_name}"
    end
    
    post '/posts' do
      title = params[:title]

      return "Post was created with title: #{title}"
    end

    post '/submit' do
      name = params[:name]
      message = params[:message]

      return "Thanks #{name}, you sent this message: #{message} "
    end

    get "/name" do
      name1 = params[:name1]
      name2 = params[:name2]
      name3 = params[:name3]
      message = "#{name1} " + "#{name2} " + "#{name3}"
    end

    post "/sort-names" do
      name1 = params[:name1]
      name2 = params[:name2]
      name3 = params[:name3]
      name4 = params[:name4]
      name5 = params[:name5]
      
      return ("#{name1} " + "#{name2} " + "#{name3} " + "#{name4} " + "#{name5}").split(" ").sort.join(",")
    end

  

    
end
