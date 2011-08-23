# Install Script for a Collection of Zelig packages
# author Matt Owen

repos <- 'http://people.iq.harvard.edu/~mowen/repo/'
packages <- c(
              'Zelig',
              'bivariate.zelig',
              'mixed.zelig', 
              'multinomial.zelig',
              'ordinal.zelig',
              'survey.zelig',
              'zelig.book.builder'
              )

successes <- c()
fails <- c()



# INSTALL DEPENDENCIES
#cran.master <- "http://cran.r-project.org"
cran.master <- "http://software.rc.fas.harvard.edu/mirrors/R/"

# This package comes with source distributions
install.packages('methods', repos=cran.master) # methods comes bundled with R

# These packages come bundled with binary distributions
install.packages('survival', repos=cran.master)
install.packages('MASS', repos=cran.master)

# This package is non-standard
install.packages('iterators', repos=cran.master)

# INSTALL PACKAGES 

for (pkg in packages) {

  res <- tryCatch(
                  {install.packages(pkg, repos=repos, type='source'); TRUE},
                  warning = function (w) FALSE,
                  error = function (e) FALSE
                  )

  if (res)
    successes <- c(successes, pkg)

  else
    fails <- c(fails, pkg)
}



# Output success
cat("The folowing packages have been successfully installed:\n")
cat(paste(successes, sep="\n * ", collapse="\n * "))

cat("\n\n")
cat("The following packages were not installed:\n")
cat(paste(fails, sep="\n * ", collapse="\n * "))
