desc "install all gem dependencies"
task :bundle_install do
  bundle_cmd = "bundle install --without development production"

  %w(. nats dea stager).each do |component|
    sh "cd #{component} && #{bundle_cmd}"
  end
end
