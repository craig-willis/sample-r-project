required_packages <- c("dplyr", "ggplot2")
installed <- rownames(installed.packages())

for (pkg in required_packages) {
  if (!pkg %in% installed) {
    install.packages(pkg)
  }
}
