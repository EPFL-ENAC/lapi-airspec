#pkglist <- c("AIRSpec", "Rfunctools", "APRLspec", "APRLmpf", "APRLmvr", "APRLssb")
# pkglist <- c("AIRSpec", "APRLspec", "APRLmpf", "APRLmvr", "APRLssb")
# 
# for (pkg in pkglist) {
#   print(paste("Installing package:", pkg, "..."))
#   remotes::install_gitlab(sprintf('aprl/%s', pkg), dependencies = TRUE)
# }

extras <- c("RSQLite", "RJSONIO", "tidyverse", "shinythemes", "purrr", "shiny", "pls", "grDevices", "envDocument", "reshape2", "pryr", "Hmisc", "quantreg", "abind", "remotes")
for (p in extras) {
  install.packages(p)
}

url <- "https://www.dropbox.com/scl/fo/zcvv8xhvjg1wgad6gwep2/ABJGNldXXWS1z_w0_IuNHxk?rlkey=ch45dvbwcmohu6csa3eqxonn0&e=2&dl=1"
destzip <- file.path(tempdir(), "AIRSpec_packages.zip")
download.file(url, destzip)
destfolder <- file.path(tempdir(), "AIRSpec_packages")
unzip(destzip, exdir = destfolder)

pkglist <- c("AIRSpec", "Rfunctools", "APRLspec", "APRLmpf", "APRLmvr", "APRLssb")
for (pkg in pkglist) {
  remotes::install_local(file.path(destfolder, pkg), dependencies = TRUE, force = TRUE)
}
