# Makefile for unwind and pf blocklists
# based on: https://github.com/elasmo/openbsd-helpers/blob/master/unbound-blacklist.sh
#           https://github.com/drduh/config/blob/master/scripts/pf-blocklist.sh
#           https://www.tumfatig.net/2022/ads-blocking-with-openbsd-unbound8/
 
# blocklist names and locations

BL_DIR        = /var/db
UNWIND_BL     = unwind_blocklist.txt
PF_BL         = pf_blocklist.txt

# URLs

# unwind blocklist sources

ADAWAY_URL     = 'https://adaway.org/hosts.txt'
ADAWAY_FILE    = adaway.txt
ADGUARD_URL    = 'https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt'
ADGUARD_FILE   = adguard.txt
SBLACK_URL     = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts'
SBLACK_FILE    = sblack.txt
SFS_URL        = 'https://www.stopforumspam.com/downloads/toxic_domains_whole.txt'
SFS_FILE       = sfs.txt
YOYO_URL       = 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=plain&showintro=0&mimetype=plaintext'
YOYO_FILE      = yoyo.txt
UNWINDBL_FILES = $(ADAWAY_FILE) $(ADGUARD_FILE) $(SBLACK_FILE) $(SFS_FILE) $(YOYO_FILE)

# pf blocklist sources

PF_BL_URLS     = 'https://pgl.yoyo.org/adservers/iplist.php?ipformat=&showintro=0&mimetype=plaintext' \
                 'https://www.binarydefense.com/banlist.txt' \
                 'https://rules.emergingthreats.net/blockrules/compromised-ips.txt' \
                 'https://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt' \
                 'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset' \
                 'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level2.netset' \
                 'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level3.netset' \
                 'https://isc.sans.edu/api/threatlist/shodan/shodan.txt'

# programs

AWK=/usr/bin/awk
CAT=/bin/cat
FTP=/usr/bin/ftp
GREP=/usr/bin/grep
UNIQ=/usr/bin/uniq
SED=/usr/bin/sed
SORT=/usr/bin/sort

# rules

all: $(UNWIND_BL) $(PF_BL)

# pf blocklist

$(PF_BL):
	$(FTP) -o - $(PF_BL_URLS) | \
    $(GREP) -Ev '^192\.168\.|^10\.|172\.16\.|127\.0\.0\.0|0\.0\.0\.0|^#|#$$' | \
    $(GREP) -E '^[0-9]' | \
    $(SORT) -f | \
    $(UNIQ) -ui > $(PF_BL)

# unwind blocklist

$(UNWIND_BL): $(UNWINDBL_FILES)
	$(CAT) $(UNWINDBL_FILES) | \
    $(GREP) -Ev '^localhost|^192\.168\.|^10\.|172\.16\.|127\.0\.0\.0|0\.0\.0\.0|^#|#$$' | \
    $(SORT) -f | \
    $(UNIQ) -ui > $(UNWIND_BL)

# adaway

$(ADAWAY_FILE):
	$(FTP) -o - $(ADAWAY_URL) | \
    $(AWK) '/^127\.0\.0\.1\ / { print $$2; }' > \
    $(ADAWAY_FILE)

# adguard

$(ADGUARD_FILE):
	$(FTP) -o - $(ADGUARD_URL) | \
    $(SED) -n -e '/^||/ { s/^||// ; s/\^//; /\*/!p; }' > \
    $(ADGUARD_FILE)

# steven black

$(SBLACK_FILE):
	$(FTP) -o - $(SBLACK_URL) | \
    $(SED) -n -e '/^0\.0\.0\.0/ { s/^0\.\0\.0\.0 //p ; }' > \
    $(SBLACK_FILE)

# stop forum spam

$(SFS_FILE):
	$(FTP) -o $(SFS_FILE) $(SFS_URL)

# yoyo

$(YOYO_FILE):
	$(FTP) -o $(YOYO_FILE) $(YOYO_URL)

install: all
	/bin/cp -i $(UNWIND_BL) $(PF_BL) $(BL_DIR)
	/bin/chmod a-wx $(BL_DIR)/$(UNWIND_BL) $(BL_DIR)/$(PF_BL)

clean:
	/bin/rm -f $(UNWINDBL_FILES) $(UNWIND_BL) $(PF_BL)

