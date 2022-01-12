# Selenium ChromeDriver downloader

A script to help keep the Selenium ChromeDriver up-to-date with the current Google Chrome browser installed on the system.

## Description

Google Chrome gets regular updates and updating the Selenium ChromeDriver manually each time is a pain. This script detects the currently installed Chrome version in the path and downloads the latest matching version of Selenium ChromeDriver directly from Google.

## Usage

Assumes $USER/bin is the current working directory.

Put chromedriver-dl.sh in your $USER/bin directory and run it from there with no arguments. Old chromedriver executable, if present, will be backed-up to chromedriver_Q.X.Y.Z.gz where 'Q.X.Y.Z' is the full numeric version of the backed-up driver. New driver will be downloaded as 'chromedriver'.

An info message will be shown, similar to one below:

```
>>> ./chromedriver-dl.sh
Google Chrome version 97.0.4692.71 found.
Selenium ChromeDriver 97.0.4692.71 installed.
```

A 3-line summary will be appended to a file called 'chromedriver-dl.log', similar to below:
```
>>> cat chromedriver-dl.log

Fri, 29 Oct 2021 21:17:33 +0200
-------- Google Chrome 95.0.4638.69 --------
-------- Chrome Driver 95.0.4638.54 --------

Thu, 18 Nov 2021 08:39:54 +0100
-------- Google Chrome 96.0.4664.45 --------
-------- Chrome Driver 96.0.4664.45 --------

Wed, 12 Jan 2022 19:45:23 +0100
-------- Google Chrome 97.0.4692.71 --------
-------- Chrome Driver 97.0.4692.71 --------
```

Tested only on linux. Not tested in every possible broken environment (for instance when Internet link is down...)

## Dependencies

Uses the following utilities:
- [cut](https://command-not-found.com/cut)
- [curl](https://command-not-found.com/curl)
- [gzip](https://command-not-found.com/gzip)
- [funzip](https://command-not-found.com/funzip)

If dependencies are not satisfied, exits silently.

## Authors

Marko Dukši
[@LinkedIn](https://www.linkedin.com/in/mduksi/)

## Version History

- 0.1
    * Initial Release

## License

This project is licensed under the MIT License.
