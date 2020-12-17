# Resourceful Scanner

#### Background:

This idea was brought on by analysis of the backdoored Solarwinds Orion package and subsequent findings.

It was found that the Solarwinds packages also include a legacy Windows task scheduler system DLL taken from Windows Vista, [`taskschd.dll`, that was signed with Solarwinds' own signing key even in 2020](https://www.virustotal.com/gui/file/e7d6ce993d02d1bfff33216dd90cc82f7386553fb42c9374cf9dcca8f130b0a5/details).

The presence of such legacy libraries in application bundles presents a potential attack surface via [old, already patched vulnerabilities](https://vulners.com/mskb/KB2305420).


This project contains a YARA ruleset to detect legacy Windows system application and library metadata in the resource section of PE files.

This can be used to identify:
 -  potential attack surface from legacy libraries in packaged application bundles
 - suspicious applications and libraries that contain Microsoft version metadata that doesn't match the actual version of the host system.

The default config considers NT 5.0 and 6.x (i.e. Win2K through Windows 8.1) to be suspect (if checking for a modern Windows 10 host).

#### License
```
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

The rule(s) may be used internally. Modifications must be released under terms of GPLv3
