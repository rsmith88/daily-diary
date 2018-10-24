require 'sinatra/base'
require './lib/diary_entry'

class Diary < Sinatra::Base
  get '/' do
    @all_entries = DiaryEntry.all
    erb :index
  end

  get '/add_entry' do
    erb :add_entry
  end

  post '/save_entry' do
    DiaryEntry.create(title: params[:title], entry: params[:entry], comments: params[:comments])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
