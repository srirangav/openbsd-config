blocklist
---------

This Makefile creates blocklists that can be used with pf(4) and unwind(8)
to block connections to ad servers and/or dangerous hosts.  

1. To create the blocklists:

   $ make

2. To install the blocklists:

   $ make install

   The pf(4) blocklist is installed as /var/db/pf_blocklist.txt
 
   The unwind(8) blocklist is installed as /var/db/unwind_blocklist.txt

3. /etc/pf.conf needs to have the following lines:

   table <blocklist> persist file "/var/db/pf_blocklist.txt"

   ...

   block log quick from <blocklist> to any
   block log quick from any to <blocklist>

4. /etc/unwind.conf needs to have the following line:

   block list "/var/db/unwind_blocklist.txt"

5. After installing or updating the blocklists, pf(4) and unwind(8) need
   to be restarted:

   $ doas pfctl -v -f /etc/pf.conf
   $ doas rcctl restart unwind

References
----------

https://why-openbsd.rocks/fact/unwind/
https://www.tumfatig.net/2019/blocking-ads-using-unbound8-on-openbsd/
https://www.tumfatig.net/2022/ads-blocking-with-openbsd-unbound8/
https://github.com/horia/unwinder/blob/master/src/etc/unwind.conf
https://github.com/elasmo/openbsd-helpers/blob/master/unbound-blacklist.sh
https://github.com/drduh/config/blob/master/scripts/pf-blocklist.sh