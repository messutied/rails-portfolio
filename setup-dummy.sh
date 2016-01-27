#!/bin/bash

bundle exec rake db:drop
bundle exec rake db:migrate

cd spec/dummy
bundle exec rake portfolio:create_admin_user[admin@edd.bz,demodemo]
