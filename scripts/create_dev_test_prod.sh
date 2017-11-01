#!/bin/bash
echo 'Creating dev, test and prod db if it does not exist'
if psql -lqt | cut -d \| -f 1 | grep -qw scratchpaedia; then
  echo 'Databases already exist'
else
  echo 'Creating scratchpaedia databases'
  rake db:create:all
  echo 'Migrating'
  rake db:migrate RAILS_ENV=development
  rake db:migrate RAILS_ENV=test
  rake db:migrate RAILS_ENV=production
  echo 'Seeding'
  rake db:seed RAILS_ENV=development
  rake db:seed RAILS_ENV=production
  echo 'All scratchpaedia databases have been created'
fi
