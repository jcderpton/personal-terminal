#/bin/sh

GITDIR=$2
FILES=$1

if [ -z "$GITDIR" ]
then
  GITDIR=$PWD
else
  cd $GITDIR
fi

if [ -z "$FILES" ]
then
  echo "No files specified"
  exit 1
fi

# Get fetch url
URL=`git remote show origin | grep Fetch`
URL=${URL/  Fetch URL: }

TEMPDIR=`mktemp -d`

git clone --mirror $URL $TEMPDIR
cd $TEMPDIR

git filter-branch --tag-name-filter cat --index-filter "git rm -r --cached --ignore-unmatch $FILES" --prune-empty -f -- --all
rm -rf refs/original/
git reflog expire --expire=now --all
git gc --aggressive --prune=now

echo "Run 'git push origin --force' to force push to remote"

exit 0
