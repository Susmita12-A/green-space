inv <- read.csv ("./data/raw/bagmati_raw_inventory.csv")
source(inv)
class(inv)
str(inv)
source("carbon_stock_")
source(Plot_area_ha)
typeof(inv)
PA_ha <- inv$Plot_area_ha
den <- inv$Wood_density
head(row)
nrow(inv)
unique(inv)
length(unique(inv$Stand_ID)) 
unique(inv$Stand_ID)                                      
length(unique(inv$Plot_ID))                                  
nrow(unique(inv[, c("Stand_ID", "Plot_ID")]))                                                                     
length(unique(inv$Species))  
table(inv$Stand_ID)
unique(inv$Species)
inv$Species[
    inv$Species == "S. robusta" | inv$Species == "Shorea rubusta"
] <- "Shorea robusta"
unique(inv$Species)

inv$Species[
    inv$Species == "Schima wallichii" | inv$Species == "Schima wallichi"
] <- "Schima wallichi"
unique(inv$Species)

inv$Species[
    inv$Species == "C. indica" 
] <- "Castanopsis indica"
unique(inv$Species)



col(is.na (inv))
colSums(is.na(inv))
sum(!complete.cases(inv))
sum(inv$Biomass_kg <= 0, na.rm = TRUE)

stand_carbon_analysis <- function(stand_data, stand_name = "Stand",
                                  carbon_fraction = 0.47, min_trees = 5) {
if (!is.data.frame(stand_data) || nrow(stand_data) == 0)
    stop("stand_data must be a non-empty data.frame")
  required <- c("Plot_ID", "Tree_ID", "Species", "DBH_cm", "Height_m",
                "Wood_density", "Biomass_kg", "Plot_area_ha")
  if (!all(required %in% names(stand_data)))
    stop("Missing columns: ", paste(setdiff(required, names(stand_data)), collapse = ", "))
  if (!is.numeric(carbon_fraction) || carbon_fraction <= 0 || carbon_fraction >= 1)
    stop("carbon_fraction must be between 0 and 1")}

#Individual tree carbon stock
 carbon_kg <- inv$Biomass_kg * 0.47
carbon_kg


# Conversion to megagrams
carbon_mg <- carbon_kg/ 1000
carbon_mg

#C. Carbon density per hectare
total_carbon_mg <- sum(carbon_mg)
total_carbon_mg

total_sampled_area_ha <- sum(PA_ha)
total_sampled_area_ha

Carbon_Ha <- total_carbon_mg/ total_sampled_area_ha
Carbon_Ha

#biomass 
dbh_cm <- inv$DBH_cm
height <- inv$Height_m

M_Biomass <- 0.0673 *(den * dbh_cm ^ 2 *  height)^ 0.976
M_Biomass
cf <- 0.04

agc_ha <- (sum(M_Biomass * cf) * 0.001) / PA_ha
agc_ha


