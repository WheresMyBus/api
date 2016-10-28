echo "installing Ruby and Rails"
sudo yum install gcc-c++ patch readline readline-devel zlib zlib-devel
sudo yum install libyaml-devel libffi-devel openssl-devel make
sudo yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
sudo curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
sudo curl -L get.rvm.io | sudo bash -s stable --auto-dotfiles
source /etc/profile.d/rvm.sh
rvm reload
rvm requirements run
sudo rvm install 2.2.4
rvm use 2.2.4 --default
sudo gem install rails
sudo gem install rake -v '11.3.0'
sudo bundle update sqlite3

