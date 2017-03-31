# DECODE 2017 - Team Shopify

This is the repo for our awesome shopify giveaway app!

### Get Set Up
```bash
# install dependencies
apt-get install ruby2.3 ruby2.3-dev sqlite3 nodejs
gem install rails bundler

# clone & setup gems
git clone https://github.com/jaydenwindle/decode2017.git && cd decode2017
bundle install

# Migrate the db
rake db:migrate

# You're golden!
bin/rails server
```
