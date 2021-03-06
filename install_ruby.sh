echo "installing Ruby, Rails, Postgres, Heroku local"
sudo yum install gcc-c++ patch readline readline-devel zlib zlib-devel
sudo yum install libyaml-devel libffi-devel openssl-devel make
sudo yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
sudo curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
sudo curl -L get.rvm.io | sudo bash -s stable --auto-dotfiles
source /etc/profile.d/rvm.sh
rvm reload
rvm requirements run
sudo rvm install 2.3.1
rvm use 2.3.1 --default
sudo gem install rails
sudo gem install rake
sudo yum install postgresql-devel

#What follows are manual installations of dependancies that break bundler for unknown reasons
sudo gem install minitest -v '5.9.1'
sudo gem install jsonapi-parser -v '0.1.1.beta3'
sudo gem install jsonapi-renderer -v '0.1.1.beta1'
sudo gem install multi_xml -v '0.5.5'
sudo gem install pg -v '0.19.0'
sudo gem install puma -v '3.6.0'
sudo gem install jsonapi -v '0.1.1.beta6'
sudo gem install httparty -v '0.14.0'
sudo gem install factory_girl -v '4.7.0'
sudo gem install active_model_serializers -v '0.10.2'
sudo gem install factory_girl_rails -v '4.7.0'
sudo gem install docile -v '1.1.5'
sudo gem install docile -v '1.1.5'
sudo gem install json -v '2.0.2'
sudo gem install simplecov-html -v '0.10.0'
sudo gem install simplecov -v '0.12.0'
sudo gem install temping -v '3.7.1'
#dependancies that break bundler in wheresmybus/onebusaway
sudo gem install public_suffix -v '2.0.4'
sudo gem install safe_yaml -v '1.0.4'
sudo gem install hashdiff -v '0.3.0'
sudo gem install vcr -v '3.0.3'
sudo gem install addressable -v '2.5.0'
sudo gem install crack -v '0.4.3'
sudo gem install webmock -v '2.1.0'
sudo gem install rspec-rails -v '3.5.2'
sudo gem install rspec-mocks -v '3.5.0'
sudo gem install rspec-expectations -v '3.5.0'
sudo gem install rspec-core -v '3.5.4'
sudo gem install rspec-support -v '3.5.0'
sudo gem install diff-lcs -v '1.2.5'

#install everything else with bundler
bundle install

#install heroku CLI
sudo wget -qO- https://toolbelt.heroku.com/install.sh | sh

#install and set up postgresql
sudo yum install postgresql-contrib postgresql-server
sudo postgresql-setup initdb
sudo sed -i -e 's/ident/md5/g' /var/lib/pgsql/data/pg_hba.conf
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo yum install expect
sudo setup_psql_user.sh

#add host: localhost to database.yml for local use
sudo sed -i -e 's/host: localhost//g' ./config/database.yml
sudo sed -i -e 's/username:/host: localhost\n  username:/g' ./config/database.yml
#create the database
rake db:create
rails db:migrate RAILS_ENV=test #for rake to work (?)
rails db:migrate RAILS_ENV=development #for heroku local to work (?)

#populate the database
rails db:seed
