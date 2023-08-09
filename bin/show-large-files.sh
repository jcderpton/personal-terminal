#/bin/sh

TEMPDIR=`mktemp -d`
GITDIR=$1

if [ -z "$GITDIR" ]
then
  GITDIR=$PWD
fi

cd $GITDIR

if [ -d "$GITDIR/.git/" ]
then
  PREFIX=".git/"
fi

git rev-list --objects --all | sort -k 2 > $TEMPDIR/allfileshas.txt
git gc --quiet && git verify-pack -v ${PREFIX}objects/pack/pack-*.idx | egrep "^\w+ blob\W+[0-9]+ [0-9]+ [0-9]+$" | sort -k 3 -n -r > $TEMPDIR/bigobjects.txt

for SHA in `cut -f 1 -d\  < $TEMPDIR/bigobjects.txt`; do
  echo $(grep $SHA $TEMPDIR/bigobjects.txt) $(grep $SHA $TEMPDIR/allfileshas.txt) | awk '{print $1,$3,$7}' >> $TEMPDIR/bigtosmall.txt
done;

while read p; do
  q=${p#* }
  r=${q%% *}
  m=$(( r / 1024 ))
  n=$(( m / 1024 ))
  if [ "$n" != "0" ]
  then
    o=${p#* }
    final="${n}M\t${p##* }"
    echo -e "$final"
  fi
done <$TEMPDIR/bigtosmall.txt

rm -rf $TEMPDIR

exit 0
