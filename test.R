dbh <- 28.1
ba <- pi * (dbh^2) / 40000
ba
# sectoin 1 ; R objects, assignment, and single- tree arithmetic
# Start with  a single tree 
#SECTION 2 ; Data types, type checking, and type casting

#1 aThe core Data type in Forestry
dbh_num <- 28.1
tree_count <-15L
species_chr <- "Shorea robusta"
diseases_present <-TRUE
 
 
 INSPECT  TYPE USING CLASS () (HIGH-LEVEL TYPE)

class(dbh_num). #numeric
typeof(dbh_num)

class(tree_count) #integer
typeof(tree_count)

class(species_chr)# character
typeof(species_chr)

class(diseases_present) #logical
typeof(diseases_present)

#VERIFY TYPE USING IS.*
is.numeric(dbh_num)
is.integer(tree_count)
is.logical(diseases_present)

fault_dbh <- c(12,13,NA)
class(fault_dbh)


pi * (fault_dbh)

clean_dbh <- as.numeric(fault_dbh)

class(clean_dbh)
pi * (clean_dbh^2) / 40000
codes
plot_code_factor <- factor(c("101", "102", "103"))
as.numeric(plot_code_factor)
as.numeric(as.character(plot_code_factor))

mixed_vec <- c(20.2, TRUE, "Shorea")
mixed_vec
class(mixed_vec)
   species_chr == "Pinus roxburghii"
species_chr == 'shorea robusta'
dbh =30
height <- 30
height <= 40
(dbh < 23) & (height < 32)

if(height == 30){
if (dbh >=20) {
   cat("classification: Sawantimber tree/n")
} else if (dbh >=12) {
    cat ("classification : pole_size")
} else {
   cat( "classifciation: sapling")
#  height <- 40

# basal_area <-20

ifelse(test = height >-40, yes = 'medium girth',no = "large girth")



calculate_volume <- function(height, basal_area) {

if(!is.numeric (height) & !is.numeric (basal_area)){

stop("error: height must be grater than 0")

}


if(any(height > 20, na.rm = TRUSE)){
stop("error: height must be grater than 0")
}
 if(any (basal_area <100, na.rm = TRUE)){
    warning ("Warning: Height > 20 detected. Did you record in mm?")

 }
volume <- pi * basal_area * height
return(volume)}

calculate_volume(12,8)

calc_cv <- function (x) {
    cv <- (sd (x, na.rm = TRUE) / mean(b, na.rm=FALSE) * 100)
}

bagmati <- read.csv("./data/raw/bagmati_raw_inventory.csv")

bagmati

trees <- read.csv("./DATA/RAW/bagmati_raw_inventory.csv")
trees 
Head(trees)
nrow(trees) #2005
ncol(trees) #14
names (trees)
str(trees)


trees$Tree_ID
trees$Biomass_kg
trees$Species
trees$Wood_density

trees$Species[trees$Wood_density > 0.8]
trees$Species[trees$Wood_density > 0.6]
trees$Wood_density[trees$Species > 0.7]

champion_idx <- which.max(trees$dbh_cm)
trees[champion_idx, ]
champion_idx <- which.min(trees$Plot_area_ha)
trees[champion_idx]

trees$size_class <- cut(
  trees$Biomass_kg,
  breaks = c(0.5, 0.7, 0.8, Inf),
  labels = c("below", "average", "high"))

table(trees$Species)

hist(trees$Species,
  breaks = seq(10, 50, by = 5),
  freq   = TRUE,
  main   = "Stand height Distribution with Mean & Median",
  sub    = "Bagmati Starter Inventory (n = 10 trees)",
  xlab   = "Height <-100 , height (cm)",
  ylab   = "Number of Stems (Frequency)",
  col    = "#2e8b57",
  border = "white",
  xlim   = c(10, 50),
  ylim   = c(0, 5),
  labels = TRUE,
  las    = 1
)



inv <-read.csv("./DATA/RAW/bagmati_raw_inventory.csv")

#part 5

if (!dir.exists("figure")) {
  dir.create("figure")
}

# Prepare records with valid DBH and height
plot_data <- inv_clean[
  !is.na(inv_clean$Height_m) &
  inv_clean$Height_m > 0 &
  inv_clean$Height_m != -99, 
]

# Save diagnostic graph
png("figures/homework_unit2_diagnostics.png",
    width = 1200,
    height = 1000,
    res = 150)

# Arrange graphs in 2 rows and 2 columns
par(mfrow = c(2, 2))

# ----------------------------------
# Graph 1: Histogram of DBH
# ----------------------------------

hist(inv_clean$DBH_cm,
     main = "Distribution of Tree DBH",
     xlab = "DBH (cm)",
     col = "lightgreen",
     border = "black")

abline(v = mean(inv_clean$DBH_cm, na.rm = TRUE),
       col = "red",
       lty = 2,
       lwd = 2)

# ----------------------------------
# Graph 2: Histogram of Height
# ----------------------------------

hist(plot_data$Height_m,
     main = "Distribution of Tree Height",
     xlab = "Height (m)",
     col = "lightblue",
     border = "black")

abline(v = median(plot_data$Height_m, na.rm = TRUE),
       col = "blue",
       lty = 2,
       lwd = 2)

# ----------------------------------
# Graph 3: DBH comparison by stand
# ----------------------------------

boxplot(DBH_cm ~ Stand_ID,
        data = inv_clean,
        main = "DBH Comparison Among Stands",
        xlab = "Stand ID",
        ylab = "DBH (cm)",
        col = "lightyellow")

# ----------------------------------
# Graph 4: DBH vs Height
# ----------------------------------

plot(plot_data$DBH_cm,
     plot_data$Height_m,
     main = "Relationship Between DBH and Height",
     xlab = "DBH (cm)",
     ylab = "Height (m)",
     pch = 19,
     col = "darkgreen")

# Add linear trendline
abline(lm(Height_m ~ DBH_cm, data = plot_data),
       col = "red",
       lwd = 2)

# Reset graphical layout
par(mfrow = c(1, 1))

# Close graphics device
dev.off()

abline(v = mean(trees$dbh_cm, na.rm = TRUE),   col = "red",  lwd = 2, lty = 2)
abline(v = median(trees$dbh_cm, na.rm = TRUE), col = "blue", lwd = 2, lty = 3)
legend("topright", legend = c("Mean DBH", "Median DBH"), col = c("red", "blue"), lwd = 2, lty = c(2, 3), bty = "n")

trees <- read.csv("./DATA/RAW/unit2_starter_trees.csv")

hist(
  trees$dbh_cm,
  breaks = seq(10, 50, by = 5),
  freq   = TRUE,
  main   = "Stand Diameter Distribution with Mean & Median",
  sub    = "Bagmati Starter Inventory (n = 10 trees)",
  xlab   = "Diameter at Breast Height, DBH (cm)",
  ylab   = "Number of Stems (Frequency)",
  col    = "#2e8b57",
  border = "white",
  xlim   = c(10, 50),
  ylim   = c(0, 5),
  labels = TRUE,
  las    = 1
)

abline(v = mean(trees$dbh_cm, na.rm = TRUE),   col = "red",  lwd = 2, lty = 2)
abline(v = median(trees$dbh_cm, na.rm = TRUE), col = "blue", lwd = 2, lty = 3)
legend("topright", legend = c("Mean DBH", "Median DBH"), col = c("red", "blue"), lwd = 2, lty = c(2, 3), bty = "n")


height <- 30

class(height)
is.numeric(height)

fault_height <-c(12,11,10,NA)
class(fault_height)

clean_height <- as.numeric (fault_height)  #checkkkkkkkkkkkk
clean(clean)



inv <- read.csv(./bagmati_raw_inventory.csv)
nrow(inv)
ncol(inv)
str(inv)
names(inv)
