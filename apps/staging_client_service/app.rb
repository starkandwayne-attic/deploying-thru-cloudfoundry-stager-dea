require 'sinatra'
require 'fileutils'

droplet_dir = "/tmp/deploying-thru-cloudfoundry-stager-dea/droplets"
FileUtils.mkdir_p(droplet_dir)

get '/download_unstaged_app/:id' do
  p params
  unstaged_app_package = File.expand_path("../../sinatra-app.zip", __FILE__)
  send_file(unstaged_app_package)
end

post '/upload_droplet/:id/:upload_id' do
  p params
  src_path = params[:upload][:droplet][:tempfile]
  puts "stager uploaded staged droplet #{src_path}"
  stored_droplet = File.join(droplet_dir, params[:id])
  File.open(stored_droplet, "w") do |file|
    file << params[:upload][:droplet][:tempfile].read
  end
  puts "droplet stored at #{stored_droplet}"
end

get '/staged_droplets/:id/:hash' do
  p params
  stored_droplet = File.join(droplet_dir, params[:id])
  if File.exists?(stored_droplet)
    puts "droplet found at #{stored_droplet}"
    send_file(stored_droplet)
  else
    # From cloud_error.rb in cloud_controller
    # HTTP_NOT_FOUND             = 404
    # APP_NOT_FOUND = [301, HTTP_NOT_FOUND, "Application not found"]
    404
  end
end