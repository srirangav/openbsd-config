# Makefile for unwind blocklist
# based on: https://github.com/elasmo/openbsd-helpers/blob/master/unbound-blacklist.sh

ADGUARD_URL   = https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
ADGUARD_FILE  = adguard.txt
YOYO_URL      = 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=plain&showintro=0&mimetype=plaintext'
YOYO_FILE     = yoyo.txt
SBLACK_URL    = https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts
SBLACK_FILE   = sblack.txt
BLOCKLIST     = blocklist.txt
BLOCKLIST_DIR = /var/db

FTP=/usr/bin/ftp
SED=/usr/bin/sed
CAT=/bin/cat
UNIQ=/usr/bin/uniq
SORT=/usr/bin/sort

all: $(BLOCKLIST)

$(BLOCKLIST): $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE)
	$(CAT) $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE) | \
    $(SORT) -f | \
    $(UNIQ) -ui > $(BLOCKLIST)

$(ADGUARD_FILE):
	$(FTP) -o - $(ADGUARD_URL) | \
    $(SED) -n -e '/^||/ { s/^||// ; s/\^//; /\*/!p; }' > \
    $(ADGUARD_FILE)

$(YOYO_FILE):
	$(FTP) -o $(YOYO_FILE) $(YOYO_URL)

$(SBLACK_FILE):
	$(FTP) -o - $(SBLACK_URL) | \
    $(SED) -n -e '/^0\.0\.0\.0/ { s/^0\.\0\.0\.0 //p ; }' > \
    $(SBLACK_FILE)

install: $(BLOCKLIST)
	/bin/cp -i $(BLOCKLIST) $(BLOCKLIST_DIR)

clean:
	/bin/rm -f $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE) $(BLOCKLIST)

