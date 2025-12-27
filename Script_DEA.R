##importation des données 

data <- read.csv("C:/Users/ACER/Downloads/Dossier_Invest/Resultats/output/watershed_results_wyield.csv", 
                 sep = ";")

summary(data)

hist(data$wyield_vol)

boxplot(data$wyield_vol)


model <- lm(wyield_vol ~ precip_mn + area, data = data)

summary(model)

##importation des packages 
library(raster)
library(landscapemetrics)
library(exactextractr)
library(sf)

##chargement du raster LULC et shapefile 

raster <- raster("~/Mémoire Master 2025-2026/Data_folder/Rasters/LULC_2019.tif")


bassins <- st_read("C:/Users/ACER/Downloads/Dossier_Invest/watershed.shp")


##extraction 

extraction <- sample_lsm(raster, bassins, what = "lsm_l_shdi")


##fusion 

extraction_fusion <- extraction %>% 
  select(value, plot_id)

data_fusion <- data %>% left_join(
  extraction_fusion, by = join_by(fid == plot_id)
)
  

mod1 <- lm(wyield_vol ~ precip_mn + area, data_fusion)

summary(mod1)

##normalisation 

data_fusion$normalisation <- data_fusion$wyield_vol/data_fusion$area


##

X <- as.matrix(data_fusion[, c("precip_mn", "area", "value.y")])   # inputs
Y <- as.matrix(data_fusion[, c("normalisation")])
# output
dea_model <- Benchmarking::dea(X, Y, RTS = "vrs", ORIENTATION = "in")

summary(dea_model)

data_fusion$efficience <- dea_model$eff



hist(data_fusion$efficience)

hist(data_fusion$value.y)


bassin_leader <- data_fusion %>% 
  filter(efficience == 1)


##slacks

sl <- slack(X, Y, dea_model)

##ajout à la base de données 

df <- as.data.frame(sl$sx)

df_y <- as.data.frame(sl$sy)


data_complet <- cbind(data_fusion, df, df_y)

##bassin efficient 

bassin_effic <-data_complet %>% 
  filter(efficience == 1 & sx1 == 0 & 
           sx2 == 0 & sx3 == 0 & 
           sy1 == 0)
