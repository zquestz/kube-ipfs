#! /bin/sh
if [ -z "$1" ] ; then
   SILENT=0
elif [[ "$1" = "-h"  ||  "$1" = "-?"  ]] ; then
   echo "$0 [-q]"
   echo "Announces pins to DHT."
   echo "  -q silent output"
   exit 0
elif [ "$1" = "-q" ] ; then
   SILENT=1
else
   echo "Unknown option $1 see help -h"
   exit 1
fi
for p in `/usr/bin/ipfs pin ls --type=recursive | awk '{print $1}'` ; do
  if [ $SILENT -eq 0 ]; then echo -n "Announcing pin $p" ; fi
  /usr/bin/ipfs dht provide $p
  if [ $SILENT -eq 0 ]; then echo "." ; fi
done
exit 0
