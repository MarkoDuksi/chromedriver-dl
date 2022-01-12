#!/usr/bin/env bash

chrome_exec=$(which google-chrome)

[ -n $(which cut) ] && [ -n $(which curl) ] && [ -n $(which gzip) ] && [ -n $(which funzip) ] || exit 1
if [ -n "$chrome_exec" ]; then
	chrome_ver=$(${chrome_exec} --version | cut -d' ' -f3)
	echo "Google Chrome version ${chrome_ver} found."
else
	echo "Google Chrome not found in: ${PATH}" >&2
	exit 1
fi

base_url="https://chromedriver.storage.googleapis.com"
chrome_ver_maj=$(echo $chrome_ver | cut -d'.' -f1)
latest_ver=$(curl -s ${base_url}/LATEST_RELEASE_${chrome_ver_maj}) || exit 1

[ -x ~/bin/chromedriver ] && curr_ver=$(~/bin/chromedriver --version | cut -d' ' -f2)

if [ -v curr_ver ] && [ "$curr_ver" == "$latest_ver" ]; then
	echo "Selenium ChromeDriver version ${latest_ver} already present."
	exit 0
else
	[ -v curr_ver ] && gzip -c ~/bin/chromedriver > ~/bin/chromedriver_${curr_ver}.gz
	curl -s ${base_url}/${latest_ver}/chromedriver_linux64.zip | funzip > ~/bin/chromedriver
	chmod 755 ~/bin/chromedriver
	new_ver=$(~/bin/chromedriver --version | cut -d' ' -f2)
	[ "$new_ver" == "$latest_ver" ] || exit 1
	echo "Selenium ChromeDriver ${latest_ver} installed."
	echo >> chromedriver-dl.log
	date -R >> chromedriver-dl.log
	echo -------- Google Chrome ${chrome_ver} -------- >> chromedriver-dl.log
	echo -------- Chrome Driver ${new_ver} -------- >> chromedriver-dl.log
fi

