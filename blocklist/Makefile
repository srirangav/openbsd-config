# Makefile for unwind and pf blocklists
# based on: https://github.com/elasmo/openbsd-helpers/blob/master/unbound-blacklist.sh
#           https://github.com/drduh/config/blob/master/scripts/pf-blocklist.sh

# URLs

# unwind blocklist sources

ADGUARD_URL   = 'https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt'
ADGUARD_FILE  = adguard.txt
YOYO_URL      = 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=plain&showintro=0&mimetype=plaintext'
YOYO_FILE     = yoyo.txt
SBLACK_URL    = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/data/StevenBlack/hosts'
SBLACK_FILE   = sblack.txt

# pf blocklist sources

PF_BL_URLS    = 'https://pgl.yoyo.org/adservers/iplist.php?ipformat=&showintro=0&mimetype=plaintext' \
                'https://www.binarydefense.com/banlist.txt' \
                'https://rules.emergingthreats.net/blockrules/compromised-ips.txt' \
                'https://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt' \
                'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset' \
                'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level2.netset' \
                'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level3.netset' \
                'https://isc.sans.edu/api/threatlist/shodan/shodan.txt'

# blocklist names and locations

BL_DIR        = /var/db
UNWIND_BL     = unwind_blocklist.txt
PF_BL         = pf_blocklist.txt

# programs

FTP=/usr/bin/ftp
SED=/usr/bin/sed
CAT=/bin/cat
UNIQ=/usr/bin/uniq
SORT=/usr/bin/sort
GREP=/usr/bin/grep

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

$(UNWIND_BL): $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE)
	$(CAT) $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE) | \
    $(SORT) -f | \
    $(UNIQ) -ui > $(UNWIND_BL)

# adguard

$(ADGUARD_FILE):
	$(FTP) -o - $(ADGUARD_URL) | \
    $(SED) -n -e '/^||/ { s/^||// ; s/\^//; /\*/!p; }' > \
    $(ADGUARD_FILE)

# yoyo

$(YOYO_FILE):
	$(FTP) -o $(YOYO_FILE) $(YOYO_URL)

# steven black

$(SBLACK_FILE):
	$(FTP) -o - $(SBLACK_URL) | \
    $(SED) -n -e '/^0\.0\.0\.0/ { s/^0\.\0\.0\.0 //p ; }' > \
    $(SBLACK_FILE)

install: all
	/bin/cp -i $(UNWIND_BL) $(PF_BL) $(BL_DIR)
	/bin/chmod a-wx $(BL_DIR)/$(UNWIND_BL) $(BL_DIR)/$(PF_BL)

clean:
	/bin/rm -f $(ADGUARD_FILE) $(YOYO_FILE) $(SBLACK_FILE) $(UNWIND_BL) $(PF_BL)

