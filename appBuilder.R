library(RInno)
library(dplyr)
library(magrittr)
depends = c("googledrive",
            'magrittr',
            'dplyr',
            'diceSyntax',
            'purrr',
            'ogbox',
            'glue',
            'shiny',
            'shinythemes',
            'shinyjs',
            'shinyWidgets',
            'DT',
            'shinyBS')

appVersion = '1.0.0'

unlink('sheet',recursive = TRUE)
unlink('sheetCI',recursive = TRUE,force = TRUE)

system('svn checkout https://github.com/oganm/import5eChar/trunk/inst/app')
unlink('app/.svn', recursive = TRUE, force = TRUE)
file.rename('app','sheet')
git2r::clone('https://github.com/oganm/import5eChar.git',local_path = 'sheetCI')

#######################
create_app(app_name = "5eInteractiveSheet", app_dir = "sheet",include_R = TRUE)
file.copy('dice_icon.ico','sheet/default.ico',overwrite = TRUE)
file.copy('dice_icon.ico','sheet/setup.ico',overwrite = TRUE)
file.copy('infoafter.txt','sheet/infoafter.txt',overwrite = TRUE)
file.copy('infobefore.txt','sheet/infobefore.txt',overwrite = TRUE)

appR = readLines('sheet/global.R')
appR = c('options(ImThePortableClient = TRUE)',appR)
writeLines(appR,'sheet/global.R')

iss = readLines('sheet/5eInteractiveSheet.iss')
iss[2] %<>% gsub(pattern = '0.0.0',replacement = appVersion,.)
writeLines(iss,'sheet/5eInteractiveSheet.iss')

compile_iss()

#######################


create_app(
    app_name     = "import5eChar",
    app_repo_url = "https://github.com/oganm/import5eChar",
    pkgs         = depends,
    app_dir = 'sheetCI',include_R = TRUE
)

file.copy('dice_icon.ico','sheetCI/default.ico',overwrite = TRUE)
file.copy('dice_icon.ico','sheetCI/setup.ico',overwrite = TRUE)
file.copy('infoafter.txt','sheetCI/infoafter.txt',overwrite = TRUE)
file.copy('infobefore.txt','sheetCI/infobefore.txt',overwrite = TRUE)

appR = readLines('sheetCI/utils/app.R')
appR = c('options(ImThePortableClient = TRUE)',appR)
writeLines(appR,'sheetCI/utils/app.R')

iss = readLines('sheet/5eInteractiveSheet.iss')
iss[2] %<>% gsub(pattern = '0.0.0',replacement = appVersion,.)
writeLines(iss,'sheet/5eInteractiveSheet.iss')

compile_iss()
