# Deploy apps through Cloud Foundry via stager to a DEA

To run the services for the demo:

```
$ git submodule update --init
$ rake bundle_install
$ foreman start
09:25:58 nats.1          | started with pid 50933
09:25:58 dea.1           | started with pid 50934
09:25:58 stager.1        | started with pid 50935
09:25:58 stager_client.1 | started with pid 50936
09:26:01 stager_client.1 | [2012-11-14 09:26:01] INFO  WEBrick 1.3.1
09:26:01 stager_client.1 | [2012-11-14 09:26:01] INFO  ruby 1.9.3 (2012-10-12) [x86_64-darwin11.4.2]
09:26:01 stager_client.1 | == Sinatra/1.3.3 has taken the stage on 9292 for development with backup from WEBrick
09:26:01 stager_client.1 | [2012-11-14 09:26:01] INFO  WEBrick::HTTPServer#start: pid=50936 port=9292
09:26:01 dea.1           |  INFO -- Starting VCAP DEA (0.99)
09:26:01 dea.1           |  INFO -- Pid file: /tmp/deploying-thru-cloudfoundry-stager-dea/var/run/dea.pid
09:26:01 dea.1           |  INFO -- Using ruby @ /Users/drnic/.rvm/rubies/ruby-1.9.3-p286/bin/ruby
09:26:01 dea.1           |  INFO -- Using network: 192.168.1.70
09:26:01 dea.1           |  INFO -- Socket Limit:256
09:26:01 dea.1           |  INFO -- Max Memory set to 1024M
09:26:01 dea.1           |  INFO -- Utilizing 1 cpu cores
09:26:01 dea.1           |  INFO -- Allowing multi-tenancy
09:26:01 dea.1           |  INFO -- Using directory: /tmp/deploying-thru-cloudfoundry-stager-dea/var/dea/
09:26:01 dea.1           |  INFO -- Initial usage of droplet fs is: 0%
09:26:01 stager.1        | f845 fid=1136   INFO -- Subscribed to staging
09:26:01 stager.1        | f845 fid=1136   INFO -- Server running
09:26:02 dea.1           |  INFO -- File service started on port: 
09:26:02 dea.1           | DEBUG -- Took 0.000506 to snapshot application state.
```

We can deploy the Sintra app at `apps/sinatra-app.zip` by running a script that combines the staging step and DEA deployment step together:

```
$ ./bin/deploy_app
Requesting stager to fetch app, stage it and upload back to fake server
[2012-11-14 12:55:03] Setting up temporary directories
[2012-11-14 12:55:03] Downloading application
[2012-11-14 12:55:03] Unpacking application
[2012-11-14 12:55:03] Staging application
[2012-11-14 12:55:05] # Logfile created on 2012-11-14 12:55:05 -0800 by logger.rb/31641
[2012-11-14 12:55:05] Auto-reconfiguration disabled because app does not use Bundler.
[2012-11-14 12:55:05] Please provide a Gemfile.lock to use auto-reconfiguration.
[2012-11-14 12:55:05] Creating droplet
[2012-11-14 12:55:05] Uploading droplet
[2012-11-14 12:55:07] Done!
Now finding a DEA to deploy to
Asking DEA f595bf2042b1bc60a10ee9edbfdac29d to deploy droplet
New app registered at: http://172.20.10.2:57939
```