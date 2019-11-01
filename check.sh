#!/bin/bash
echo "ok"
echo $GIT_URL

# git clone $GIT_URL
git clone "$GIT_URL" && cd "$(basename "$GIT_URL" .git)"
if [ -z "$PM2_INSTANCE" ]
then
    echo "no instance count set"
else 
    echo "have instance count set-"$PM2_INSTANCE
    sed -i -- 's#instances: 1#instances: '"$PM2_INSTANCE"'#g' process.yml 
fi

npm install --production
pm2-docker process.yml


