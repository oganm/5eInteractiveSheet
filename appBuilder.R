library(RInno)

depends = c("googledrive",
            'magrittr',
            'dplyr',
            'diceSyntax',
            'stringr',
            'XML',
            'purrr',
            'ogbox',
            'rmarkdown',
            'kableExtra',
            'knitr',
            'bindrcpp',
            'animation',
            'glue',
            'shiny',
            'shinythemes',
            'shinyjs',
            'shinyWidgets',
            'DT',
            'shinyBS')

unlink('sheet',recursive = TRUE)
unlink('sheetCI',recursive = TRUE)

system('svn checkout https://github.com/oganm/import5eChar/trunk/inst/app')
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
compile_iss()

#######################


create_app(
    app_name     = "5eInteractiveSheetCI", 
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

compile_iss()
