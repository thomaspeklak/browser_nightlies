require 'open-uri'

CHROMIUM = 'http://commondatastorage.googleapis.com/chromium-browser-continuous/Win/'
open(CHROMIUM + 'LAST_CHANGE') do |f|
	f.each do |line|
	  LATEST = line
	end
end
puts "latest: #{LATEST}"

system 'curl -L ' + CHROMIUM + LATEST + '/chrome-win32.zip > D:/temp/chromium.zip'

system 'rm -rf D:/tools/browsers/nightlies/chrome-win32'

Dir.chdir 'D:/tools/browsers/nightlies'

system 'c:/Progra~1/7-Zip/7z.exe x d:/temp/chromium.zip'

system 'rm d:/temp/chromium.zip'

