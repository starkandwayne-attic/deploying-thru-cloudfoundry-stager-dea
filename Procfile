nats: env BUNDLE_GEMFILE=./nats/Gemfile ./nats/bin/nats-server
dea: env BUNDLE_GEMFILE=./dea/Gemfile ./dea/bin/dea -c config/dea.yml
stager: env BUNDLE_GEMFILE=./stager/Gemfile ./stager/bin/stager -c config/stager.yml
stager_client: env BUNDLE_GEMFILE=./apps/fake_cloud_controller/Gemfile ruby apps/fake_cloud_controller/app.rb -p 9292
