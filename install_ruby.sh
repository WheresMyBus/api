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

#install everything else with bundler
bundle install

#install heroku CLI
sudo wget -q0- https://toolbelt.heroku.com/install.sh | sh
