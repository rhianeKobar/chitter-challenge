bundle exec rackup config.ru -p $PORT
bundle exec thin start -R config.ru -e $RACK_ENV -p ${PORT:-5000}