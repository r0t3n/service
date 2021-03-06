service::commands::register badchan,badchans 450 [namespace current]::badchan

proc badchan {nickname hostname handle channel text} {
	global lastbind
	helper_xtra_set "lastcmd" $handle "$channel $lastbind $text"
	set command [string tolower [lindex [split $text] 0]]
	set arg [join [lrange $text 1 end]]
	if {$command eq "add"} {
		badchan_add $channel $nickname $handle "$lastbind $command" $arg
	} elseif {$command eq "del"} {
		badchan_del $channel $nickname $handle "$lastbind $command" $arg
	} elseif {$command eq "list"} {
		badchan_list $channel $nickname $handle "$lastbind $command" $arg
	} elseif {$command eq "on"} {
		badchan_on $channel $nickname $handle "$lastbind $command" $arg
	} elseif {$command eq "off"} {
		badchan_off $channel $nickname $handle "$lastbind $command" $arg
	} else {
		badchan_default $channel $nickname $handle $lastbind $text
	}
}