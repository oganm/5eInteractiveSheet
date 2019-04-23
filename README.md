
Readme
======

Online version
--------------

Online version can be found [here](https://oganm.github.io/5eInteractiveSheet/). It is less responsive than the installed version as it's running on a potato. It's been fast enough for me so far but running a local version boosts performance significantly.

Installation
------------

I haven't been updating this repository for some time now and people who use the windows installer have been reporting issues. Follow the Linux/Mac instructions to get the latest version of the application or use the online version. If you want to see the latest source code, see [here](https://github.com/oganm/import5eChar/tree/master/inst/app).

### Windows

Download and install [this](https://github.com/oganm/5eInteractiveSheet/raw/master/sheet/RInno_installer/setup_5eInteractiveSheet.exe) file.

After that you should be golden.

Double click the desktop icon to run. See usage instructions [here](https://github.com/oganm/import5eChar/blob/master/interactiveSheetDocumentation.md)

You'll only be missing one minor feature: The ability to get your files directly from googledrive without downloading them first. If you really want this you can install it through the sligtly more difficult way explained below.

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

If you used the installer uninstall your previous version, download exe and install. If you see something is wrong after an update, some packages might be out of date and the installer didn't bother do update them. To fix this, you can either open R console and run `devtools::install_github('oganm/import5eChar')`, or before re-installing, delete your R packages folder as well.

Other's just run

``` r
devtools::install_github('oganm/import5eChar')
```

again

Using
-----

[Here](https://github.com/oganm/import5eChar/blob/master/interactiveSheetDocumentation.md) is a documentation of the sheet's functions
