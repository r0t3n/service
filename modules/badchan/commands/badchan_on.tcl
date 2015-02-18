proc badchan_on {channel nickname handle lastbind text} {
	if {[channel get $channel service_badchan]} {
		putserv "NOTICE $nickname :Bad Channel is already \002enabled\002."
	} else {
		channel set $channel +service_badchan
		putserv "NOTICE $nickname :Bad Channel is now \002enabled\002."
	}
}