# Resourceful Scanner

#### Background:

This idea was brought on by analysis of the backdoored Solarwinds Orion package and subsequent findings.

It was found that the Solarwinds packages also include a legacy Windows task scheduler system DLL taken from Windows Vista, [`taskschd.dll`, that was signed with Solarwinds' own signing key even in 2020](https://www.virustotal.com/gui/file/e7d6ce993d02d1bfff33216dd90cc82f7386553fb42c9374cf9dcca8f130b0a5/details).

The presence of such legacy libraries in application bundles presents a potential attack surface via [old, already patched vulnerabilities](https://vulners.com/mskb/KB2305420).


This project contains a YARA ruleset to detect legacy Windows system application and library metadata in the resource section of PE files.

This can be used to identify:
 -  potential attack surface from legacy libraries in packaged application bundles
 - suspicious applications and libraries that contain Microsoft version metadata that doesn't match the actual version of the host system.

The default pattern regex identifies NT 5.0 and 6.x (i.e. Win2K through Windows 8.1) version metadata (checking on a modern Windows 10 host, this should yield suspect versions).

#### License

The rule(s) may be used internally. Licensed under 4-Clause BSD license

```
BSD 4-Clause License

Copyright (c) 2020, github.com/wesinator
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software must
   display the following acknowledgement:
     This product includes software developed by github.com/wesinator .

4. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY COPYRIGHT HOLDER "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
