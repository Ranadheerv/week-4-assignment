Maize_LD <- read.table("Maize LD.txt", header = TRUE, sep = "\t") # This if from TASSEL
library(ggplot2)
str(Maize_LD) # look at the structure of the dataset

# remove NAs 
Maize_LD = Maize_LD[c(!is.na(Maize_LD$R.2)),]

# Only subset chromosome3 data, so it is manageable, it takes very long to plot millions of data points
Maize_LD.chr3 <- Maize_LD[Maize_LD$Locus1==3,]

ggplot(Maize_LD.chr3, aes(x = as.numeric(Dist_bp)/1000000, y = R.2)) + 
  geom_point(alpha=0.05) +
  theme_bw(base_size = 12) +
  theme(
    legend.position="none",
    axis.text.x = element_text(color = "black", size = 11), 
    axis.text.y = element_text(color = "black", size = 11),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  geom_hline(yintercept = 0.2, col="red") +
  xlab("Distance (Mb)")+
  ylab(expression("LD ("~italic("r")^"2"~")"))

# Only subset chromosome4 data, so it is manageable, it takes very long to plot millions of data points

Maize_LD.chr4 <- Maize_LD[Maize_LD$Locus1==4,]

ggplot(Maize_LD.chr4, aes(x = as.numeric(Dist_bp)/1000000, y = R.2)) + 
  geom_point(alpha=0.05) +
  theme_bw(base_size = 12) +
  theme(
    legend.position="none",
    axis.text.x = element_text(color = "black", size = 11), 
    axis.text.y = element_text(color = "black", size = 11),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  geom_hline(yintercept = 0.2, col="red") +
  xlab("Distance (Mb)")+
  ylab(expression("LD ("~italic("r")^"2"~")"))

p1=ggplot(Maize_LD.chr3, aes(x = as.numeric(Dist_bp)/1000000, y = R.2)) + 
  geom_point(alpha=0.05) +
  theme_bw(base_size = 12) +
  theme(
    legend.position="none",
    axis.text.x = element_text(color = "black", size = 11), 
    axis.text.y = element_text(color = "black", size = 11),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  geom_hline(yintercept = 0.2, col="red") +
  xlab("Distance (Mb)")+
  ylab(expression("LD ("~italic("r")^"2"~")"))
p2=ggplot(Maize_LD.chr4, aes(x = as.numeric(Dist_bp)/1000000, y = R.2)) + 
  geom_point(alpha=0.05) +
  theme_bw(base_size = 12) +
  theme(
    legend.position="none",
    axis.text.x = element_text(color = "black", size = 11), 
    axis.text.y = element_text(color = "black", size = 11),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  geom_hline(yintercept = 0.2, col="red") +
  xlab("Distance (Mb)")+
  ylab(expression("LD ("~italic("r")^"2"~")"))
library(cowplot)
plot_grid(p1, p2)
plot_grid(p1, p2, nrow = 2, labels = c("A", "B"))

tiff("Figure 1.tiff", width = 4, height = 4, units = "in", res = 400)
