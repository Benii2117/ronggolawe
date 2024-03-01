#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY*W�  #_�i�pF� >���  D  � P 0j ��j�?CSM��MA�a� 4�h!4Q�@ ��!���j hh  ��0�0��a`�W�h�f��U򤾻��Oc�K@Ozs@A@�i��m\Tʉ���4�<����5j�e3A}��TutԳ�-A������O�\�>���X&��z�@��"G!�F{W�i�N���D�tl��̢�M"�{@uٔ�ED�C3��@0�x�pT�r�Դ��El���.$a��Q��WJ�|j;r�1mc��Lx#�TVReB�ƻ�Y�� �~ 	H@�R"0�.�p� T*��