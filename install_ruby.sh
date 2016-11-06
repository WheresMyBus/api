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
sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config
sudo gem install rails
sudo gem install rake
sudo yum install postgresql-devel
bundle install

