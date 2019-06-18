sls create --template aws-ruby --path myService

sls deploy

invoke:
  on aws
    sls invoke -f hello
  locally
    sls invoke local -f hello


to add gems
  bundle init #create gemfile
  bundle install --path vendor/bundle #bundle gems to vendor
