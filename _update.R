### Run this to update the catalog:
### * installs the latest lhLessons package from GitHub by default
### * copies over all lesson qmds from lhLessons into lhCatalog/lessons
### * copies the resource folders into lhCatalog/lessons/resources
###   (some lessons need a .bib to render, even in execute: enabled: false)

remotes::install_github('nceas-learning-hub/lhLessons')
lesson_fs <- list.files(system.file('lessons', package = 'lhLessons'), full.names = TRUE)
resource_fs <- list.files(system.file('lesson_resources', package = 'lhLessons'), full.names = TRUE)  
### Remove all old lessons
unlink('lessons/*', recursive = TRUE)

### Copy lessons and resource folders
file.copy(lesson_fs, here::here('lessons/'))
dir.create(here::here('lessons/resources'))
file.copy(resource_fs, here::here('lessons/resources/'), recursive = TRUE)
