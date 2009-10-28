# This script will download the latest Chrome nightly
# and unzip it using 7zip (http://www.7-zip.org/) into
# d:/tools/browsers/nightlies/chrome-win32

require 'open-uri'

CHROMIUM = 'http://build.chromium.org/buildbot/snapshots/chromium-rel-xp/'
open(CHROMIUM + 'LATEST') do |f|
	f.each do |line|
		LATEST = line
	end
end

system 'curl ' + CHROMIUM + LATEST + '/chrome-win32.zip > D:/temp/chromium.zip'

system 'rm -rf D:/tools/browsers/nightlies/chrome-win32'

Dir.chdir 'D:/tools/browsers/nightlies'

system 'c:/Progra~1/7-Zip/7z.exe x d:/temp/chromium.zip'

system 'rm d:/temp/chromium.zip'