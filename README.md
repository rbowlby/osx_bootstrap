# OSX_Bootstrap

## Setup an OS X workstation in minutes

Run one simple command to easily setup your Mac machine. This is a personal
configuration and likely not something most would use without heavy modification.

## Quickstart

Copy the command below and paste it into a terminal. This will download and run the [bootstrap](https://raw.githubusercontent.com/rbowlby/osx_bootstrap/master/bootstrap) script on your workstation.

```bash
curl https://raw.githubusercontent.com/rbowlby/osx_bootstrap/master/bootstrap | bash
```

### Necessary Secrets
Add these environment variables into your terminal.

```bash
# Apple App Store Creds
export user=''
export pass=''
```

## Customization
If you want to use your own custom wrapper cookbook, add the name of your cookbook and the git source to these commands

### Mac

```bash
curl https://raw.githubusercontent.com/rbowlby/osx_bootstrap/master/bootstrap | bash -s -- <your cookbook name> <your git source url>
```

----

## Recipes

### default
* Installs [homebrew](http://brew.sh)
* Installs the Atom editor
* Installs git.
* Installs Vagrant.
* Installs Virtualbox.
* On Mac, installs iterm2.

## Attributes

The attributes defined by this recipe are organized under the
`node['osx_bootstrap']` namespace.

Attribute | Description | Type   | Default
----------|-------------|--------|--------
['atom']['source_url'] | Mac: Atom installer package source URL | URL String | https://atom.io/download/mac

## Author

Ryan Bowlby

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
