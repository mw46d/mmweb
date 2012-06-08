#!/bin/bash

MYSQL_USER=root
MYSQL_PW=root
MYSQL_DB=meetmanager_development

TEMPDIR=`mktemp -d`  || exit 1
x1=`basename "$1" | tr [:upper:] [:lower:]`

cp "$1" "$TEMPDIR/$x1"

x=`basename "$x1"`
if [ "$x" != "${x1/%\.mdb}" ]
then
    db="$TEMPDIR/$x1"
elif [ "$x" != "${x1/%\.zip}" ]
then
    (cd $TEMPDIR && unzip "$x1")
    # Should only have one *.mdb file in the backup zip file.
    db=`find $TEMPDIR -iname '*\.mdb' | head -1`
fi

if [ -z "$db" ]
then
    exit 1
fi

mdb-schema --drop-table 2>&1 | fgrep -q 'invalid option'
if [ $? -eq 0 ]
then
    unset mdb_drop_option
    mdb_i_option="-I"
    old_mdb=1
else
    mdb_drop_option="--drop-table"
    mdb_i_option="-I mysql"
    old_mdb=0
fi

for i in Athlete Entry Event Meet RecordsbyEvent Records RecordTags Relay RelayNames Session Sessitem Team
do
    echo "Extract $i"
    mdb-schema $mdb_drop_option -T $i "$db" mysql > $TEMPDIR/$i.t

    if [ $old_mdb -gt 0 ]
    then
        sed -e 's/^--*$//' -e 's/DROP TABLE /&IF EXISTS /g' \
	    < $TEMPDIR/$i.t > $TEMPDIR/$i.table
    else
        sed -e 's/^--*$//' \
	    < $TEMPDIR/$i.t > $TEMPDIR/$i.table
    fi

    mdb-export $mdb_i_option "$db" $i > $TEMPDIR/$i.d
    echo "TRUNCATE $i;" > $TEMPDIR/$i.data
    sed -e 's/[)]$/);/g' \
	-e 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\) [0-9][0-9]:[0-9][0-9]:[0-9][0-9]/\3-\1-\2/g' \
	< $TEMPDIR/$i.d >> $TEMPDIR/$i.data
done

update_last=0

for i in Athlete Entry Event Meet RecordsbyEvent Records RecordTags Relay RelayNames Session Sessitem Team
do
    echo "Update $i"
    add_data=0
    j="$i.table"

    xl=`cat $TEMPDIR/$j | md5sum`
    xr=`cat $j | md5sum`
    if [ "$xl" != "$xr" ]
    then
        mv $TEMPDIR/$j $j
        mysql --user="$MYSQL_USER" --password="$MYSQL_PW" --execute="source $j;" $MYSQL_DB
        update_last=1
        add_data=1
    fi

    j="$i.data"

    xl=`cat $TEMPDIR/$j | md5sum`
    xr=`cat $j | md5sum`
    if [ $add_data -ne 0 -o "$xl" != "$xr" ]
    then
        mv $TEMPDIR/$j $j
        mysql --user="$MYSQL_USER" --password="$MYSQL_PW" --execute="source $j;" $MYSQL_DB

        # XXX Hack to get the NT entries to the end!!
        if [ $i == "Entry" -o $i == "Relay" ]
        then
            mysql --user="$MYSQL_USER" --password="$MYSQL_PW" --execute="UPDATE $i set ActualSeed_time = 9999 WHERE ActualSeed_time IS NULL OR ActualSeed_time = 0" $MYSQL_DB
        fi

        update_last=1
    fi

done

if [ $update_last -ne 0 ]
then
    touch lastrun
fi

# rm -rf $TEMPDIR
