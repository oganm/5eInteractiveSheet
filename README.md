
Readme
======

Installation
------------

### Windows

Download and install either [this](https://github.com/oganm/5eInteractiveSheet/raw/master/sheet/RInno_installer/setup_5eInteractiveSheet.exe) file (static version) or [this](https://github.com/oganm/5eInteractiveSheet/raw/master/sheetCI/RInno_installer/setup_import5eChar.exe) one (automatically gets the latest version)

You have it easy. If you want a static version download the exe file [here](https://github.com/oganm/5eInteractiveSheet/raw/master/sheet/RInno_installer/setup_5eInteractiveSheet.exe), install and run. If you want a version that updates itself automatically as I change stuff, download Unless you had R (the language this thing is written in) installed, it'll ask you if you want to install it or not. Say yes as it is required. After that you should be golden.

Double click the desktop icon to run. See usage instructions [here](https://github.com/oganm/import5eChar/blob/master/interactiveSheetDocumentation.md)

You'll only be missing one minor feature: The ability to get your files directly from googledrive without downloading them first. Alas I failed to port this to the installer. If you really want this you can install it through the sligtly more difficult way explained below.

### Linux/mac, Ambitious windows user

If you are on linux/mac, sorry, no exe for you. You need to install R on your own. If you are on Windows and want to use direct import from google drive, you also need to follow the steps here.

Instal R by following instructions below

-   [Linux](https://cran.r-project.org/bin/linux/)
-   [OSx](https://cran.r-project.org/bin/macosx/)
-   [Windows](https://cran.r-project.org/bin/windows/base/)

After installing R open it. On the RGui, run the following commands

``` r
install.packages('devtools')
devtools::install_github('oganm/import5eChar')
```

This will complete the installation. From now on you just need to do

``` r
import5eChar::shinySheetAC()
```

from RGui to run the app.

### R user

I assume you have everything set up

``` r
install.packages('devtools')
devtools::install_github('oganm/import5eChar')
```

to install and

`r  import5eChar::shinySheetAC()`

to run. Note that this'll shut down your R session after closing the window. If you don't want that to happen use `import5eChar::shinySheet()` instead.

Updating
--------

If you are on windows and used the static installer, uninstall your previous version, download exe and install.

If you have used the auto updating version, don't do anything.

Other's just run

``` r
devtools::install_github('oganm/import5eChar')
```

again

Using
-----

[Here](https://github.com/oganm/import5eChar/blob/master/interactiveSheetDocumentation.md) is a documentation of the sheet's functions
