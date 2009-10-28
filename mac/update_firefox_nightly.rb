#!/usr/bin/ruby -w
# This script will download the Firefox nightly from latest-trunk
# and unzip it using 7zip (http://www.7-zip.org/) into
# ~/browsers/nightlies

require 'open-uri'

#get url to latest firefox build
FF = 'http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/'
open(FF) do |f|
	f.each do |line|
		if /"([^"]*mac.dmg[^"]*)"/ =~ line
			LATEST = Regexp.last_match(1)
		end
	end
end

#downlad latest build
system 'curl ' + FF + LATEST + ' > ~/temp/ff_nightly.dmg'

#remove old app
system 'rm -rf ~/tools/browsers/Minefield.app'

#attach dmg
system 'hdiutil attach ~/temp/ff_nightly.dmg'

#copy files
system 'cp -r /Volumes/Minefield/Minefield.app ~/tools/browsers/nightlies/'

#detach dmg
system 'hdiutil detach /Volumes/Minefield'

#clean up temp files
system 'rm ~/temp/ff_nightly.dmg'