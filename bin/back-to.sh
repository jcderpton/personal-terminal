#!/usr/bin/env bash

DEFAULT=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

git checkout $DEFAULT

if [[ $? -ne 0 ]]; then
  exit $?
fi

git branch | grep -v '*' | grep -v $DEFAULT | while read -r branch ; do
  git branch -D $branch
done

exit 0
