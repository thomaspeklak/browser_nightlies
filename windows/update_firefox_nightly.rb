# This script will download the Firefox nightly from latest-trunk
# and unzip it using 7zip (http://www.7-zip.org/) into
# d:/tools/browsers/nightlies/firefox

require 'open-uri'

FF = 'http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/'
open(FF) do |f|
	f.each do |line|
		if /"([^"]*win32.zip[^"]*)"/ =~ line
			LATEST = Regexp.last_match(1)
		end
	end
end

system 'curl ' + FF + LATEST + ' > D:/temp/ff_nightly.zip'

system 'rm -rf D:/tools/browsers/nightlies/firefox'

Dir.chdir 'D:/tools/browsers/nightlies'

system 'c:/Progra~1/7-Zip/7z.exe x d:/temp/ff_nightly.zip'

system 'rm d:/temp/ff_nightly.zip'