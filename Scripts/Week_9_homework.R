library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
unique_taxa <- unique(surveys$taxa)
for (taxon in unique_taxa) {
  taxa_data <- surveys[surveys$taxa == taxon, ]
  longest_species <- taxa_data[which.max(nchar(subset_data$species)), "species"]
  cat(taxon, longest_species, "\n")
}
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
head(mloa)
mloa %>% 
select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m","temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr") %>% map(max)
C_to_F = function(x){x * 1.8 + 32}
mloa %>% 
  mutate(temp_F_2m =C_to_F(mloa$temp_C_2m)) %>% 
  mutate(temp_F_10m=C_to_F(mloa$temp_C_10m)) %>% 
  mutate(temp_F_towertop=C_to_F(mloa$temp_C_towertop))
