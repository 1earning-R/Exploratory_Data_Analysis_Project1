png_plot <- function(plot_num){
  png(paste0("plot",plot_num,".png"))
  source(paste0("./plot",plot_num,".R"))
  dev.off()
}

sapply(1:4, png_plot)