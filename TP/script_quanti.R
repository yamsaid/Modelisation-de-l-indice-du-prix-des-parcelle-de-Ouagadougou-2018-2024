#===============================================================================
#================= Projet Pratique Quanti ======================================
#================= 19 - 06 - 2025         ======================================
#===============================================================================

#************************** Les packages  **************************************
library(readr) # Pour importer la base
library(tidyverse)  # Pour la manipulation des données
library(lubridate)  # Pour les dates
library(lmtest)     # Pour les tests économétriques
library(car)        # Pour le VIF
library(VIM)        #Visualisation des valeurs manquantes
library(psych)      # Statistique descriptives
library(corrplot)   # pour la matrice de correlation
library(xgboost)
library(Matrix)
#library(dplyr)       # pour les traitements
#library(car)        # pour les tests

#************************** Chargement de la base ******************************
sonatur <- read_delim("Sonatur_csvf.csv",delim = ";", escape_double = FALSE, 
                       trim_ws = TRUE)

col = c( "Numero","Ville" , "Site",
         "Usage", "Superficie", "Cout_m2",
         "COUT", "Taxe_Jouissance", "Type_option",
         "Date_vente", "Date_fin_contrat","attestation_etablie",
         "plan_etablie", "Presence_ONEA","Presence_SONABEL" 
)

names(sonatur)<- col

#************************* Structure de la base ********************************
# Aperçu
head(sonatur)
str(sonatur)
summary(sonatur)

#Convertir en factor
sonatur <- sonatur %>%
  mutate(across(where(is.character), as.factor))
#Conversion en date


sonatur$Date_fin_contrat <- as.Date(sonatur$Date_fin_contrat,format = "%d/%m/%Y")
sonatur$Date_vente <- as.Date(sonatur$Date_vente,format = "%d/%m/%Y")

# Les frequences des variables categorielles
table(sonatur$attestation_etablie, useNA = "always")
table(sonatur$plan_etablie, useNA = "always")
table(sonatur$Ville, useNA = "always")
table(sonatur$Presence_SONABEL, useNA = "always")
table(sonatur$Presence_ONEA, useNA = "always")
table(sonatur$Usage, useNA = "always")
table(sonatur$Site, useNA = "always")
table(sonatur$Type_option, useNA = "always")

# correction des incoherrences 

sonatur <- sonatur[- which((sonatur$Date_vente==sonatur$Date_fin_contrat) & sonatur$Type_option != "COMPTANT"), ]

# Comme les valeurs manquantes ne sont que deux, on peux les supprimer
sonatur <- na.omit(sonatur)

# Réinitialisation des noms de lignes



#library(questionr)
#irec()
## Recodage de donnees$Site en donnees$Site_rec
sonatur$Site_rec <- sonatur$Site |>
  fct_recode(
    "SITE GROUPE" = "CISSIN 2020 - SITE G",
    "SITE GROUPE" = "OUAGA 2000 - SITE A",
    "SITE GROUPE" = "SECTEUR 16 OUAGA"
  )## Recodage de donnees$Usage en donnees$Usage_rec
sonatur$Usage_rec <- sonatur$Usage |>
  fct_recode(
    "1" = "COMMERCE",
    "3" = "COMMERCE  A L'ANGLE",
    "2" = "COMMERCE ANGLE",
    "1" = "COMMERCE ANGLE 1 BITUME",
    "1" = "COMMERCE ANGLE 2 VOIES",
    "3" = "COMMERCE ORDINAIRE ANGLE",
    "2" = "COMMUNAUTAIRE",
    "3" = "HABITATION",
    "2" = "HABITATION ANGLE",
    "2" = "STATION SERVICE"
  )## Recodage de sonatur$Type_option en sonatur$Type_option_rec

#====================================================
# Statistiques détaillées avec {psych}
psych::describe(sonatur)

# Matrice de corrélation
vars_quant = c("Superficie","Cout_m2","Taxe_Jouissance","COUT")
df <- sonatur %>%
  dplyr::select(all_of(vars_quant))

cor(df[, sapply(df, is.numeric)], use="complete.obs")

# Visualisation
corrplot(cor(df[, sapply(df, is.numeric)], use="complete.obs"))

# la superficie et le cout sont fortement correlé (0.6848391)
# de même la superficie est corrélée au taxe de jouissance (0.4817311 )
# en considerant le cout_m2 comme variable expliquée, nous allons laisser tomber 
# le cout total (fortement corrélé à la superficie)

# Scatterplots
win.graph()
pairs(~ Superficie + Cout_m2 + COUT + Taxe_Jouissance,data=df)

# Densité
win.graph()
plot(density(log(df$COUT), na.rm=TRUE), main="Densité du COUT")
plot(density(df$Cout_m2, na.rm=TRUE), main="Densité du COUT_m2")
plot(density(df$Superficie, na.rm=TRUE), main="Densité du Superficie")
plot(density(df$Taxe_Jouissance, na.rm=TRUE), main="Densité du taxe")

#Log des variables quantitatives
sonatur$Cout_m2 <- log(sonatur$Cout_m2)
sonatur$cout_log <- log(sonatur$COUT+1)
sonatur$superficie_log <- log(sonatur$Superficie+1)
sonatur$taxe_log <- log(sonatur$Taxe_Jouissance+1)

plot(density(sonatur$Cout_m2, na.rm=TRUE), main="Densité du COUT")
plot(density(sonatur$cout_log, na.rm=TRUE), main="Densité du COUT_m2")
plot(density(sonatur$superficie_log, na.rm=TRUE), main="Densité du Superficie")
plot(density(sonatur$taxe_log, na.rm=TRUE), main="Densité du taxe")


# Vérifier les valeurs aberrantes pour Cout_m2
boxplot(sonatur$Cout_m2, main = "Boxplot de Cout_m2")

# Traitement des valeurs aberentes (outliers)
traitement_outliers <- function(df, df_var){
  # Visualisation des valeurs manquantes avant le traitement
  #boxplot(df_var, main = "Boxplot Avant")
  # Calcul des quartiles
  Q1 <- quantile(df_var, 0.25, na.rm = TRUE)
  Q3 <- quantile(df_var, 0.75, na.rm = TRUE)
  
  # IQR
  IQR_val <- Q3 - Q1
  
  # Bornes
  borne_basse <- Q1 - 1.5 * IQR_val
  borne_haute <- Q3 + 1.5 * IQR_val
  
  # Filtrage : suppression des outliers
  df_clean <- df[df_var >= borne_basse & df_var <= borne_haute, ]
  return (df_clean)
}

sonatur <- traitement_outliers(df=sonatur,df_var = sonatur$COUT)
sonatur <- traitement_outliers(df=sonatur,df_var = sonatur$Cout_m2)
sonatur <- traitement_outliers(df=sonatur,df_var = sonatur$Superficie)
sonatur <- traitement_outliers(df=sonatur,df_var = sonatur$Taxe_Jouissance)


# Test de normalité
shapiro.test(df$COUT)  # pour petits échantillons
shapiro.test(df$Cout_m2)
shapiro.test(df$Superficie)
shapiro.test(df$Taxe_Jouissance)

# Convertir Date vente en format date et extraire l'année
sonatur$Date_vente <- as.Date(sonatur$Date_vente, format = "%d/%m/%Y")  # Ajustez le format si nécessaire
sonatur$Annee <- year(sonatur$Date_vente)
sonatur$Annee <- as.factor(sonatur$Annee)

#**************** choix des variables ******************************************
#* 
#* Cout_m2 : la variable dépendante
#* superficie , variable explicative (quantitative)
#* plan_etablie : variable explicative (facteur)
#* attestation_etablie : variable explicative (facteur)
#* site : variable explicative (facteur)
#* usage : variable explicative (facteur)
#* Annee : variable explicative (facteur)
#* Type_option : variable explicative (facteur)
#* 
#******************************** Le modèle OLS ********************************

# Charger les packages nécessaires
library(tidyverse)
library(lubridate)

# Convertir les variables catégoriques en facteurs
sonatur$Ville <- as.factor(sonatur$Ville)
sonatur$Site <- as.factor(sonatur$Site)
sonatur$Usage <- as.factor(sonatur$Usage)
sonatur$Type_option <- as.factor(sonatur$Type_option)
sonatur$attestation_etablie <- as.factor(sonatur$attestation_etablie)
sonatur$plan_etablie <- as.factor(sonatur$plan_etablie)
sonatur$Presence_ONEA <- as.factor(sonatur$Presence_ONEA)
sonatur$Presence_SONABEL <- as.factor(sonatur$Presence_SONABEL)


# Vérifier les niveaux après conversion
print(sapply(sonatur[, c("Ville", "Site", "Usage", "Type_option", "attestation_etablie", 
                         "plan_etablie", "Presence_ONEA", "Presence_SONABEL", "Annee")], 
             function(x) levels(x)))

# Vérifier les NA et la taille de l'échantillon
colSums(is.na(sonatur))
nrow(sonatur)

# Supprimer les variables redondantes ou constantes (si confirmées)
# Par exemple, si Presence_ONEA et Presence_SONABEL n'ont qu'un niveau
if (length(levels(sonatur$Presence_ONEA)) == 1) sonatur$Presence_ONEA <- NULL
if (length(levels(sonatur$Presence_SONABEL)) == 1) sonatur$Presence_SONABEL <- NULL

# Modèle simple
model_simple <- lm((Cout_m2) ~ Superficie + Annee, data = sonatur)
summary(model_simple)

# Si cela échoue, vérifier les erreurs
if (inherits(model_simple, "try-error")) {
  print("Erreur dans le modèle :")
  print(model_simple)
}

synthese_test <- function(model){
  # Résultats des tests
  shapiro <- shapiro.test(resid(model))
  bp <- bptest(model)
  dw <- dwtest(model)
  vif_vals <- vif(model)
  
  # Link test
  yhat <- fitted(model)
  yhat2 <- yhat^2
  link_test <- lm(log(Cout_m2+1) ~ yhat + yhat2, data = sonatur)
  link_summary <- summary(link_test)
  
  # 📄 Création de la synthèse textuelle
  cat("========= Synthèse des Hypothèses du Modèle Hédonique =========\n\n")
  
  cat("1. Hypothèse de normalité des résidus (Shapiro-Wilk Test) :\n")
  cat("   - Statistique W =", round(shapiro$statistic, 3), "\n")
  cat("   - p-value =", round(shapiro$p.value, 4), "\n")
  if (shapiro$p.value > 0.05) {
    cat("   => Résidus probablement normaux ✅\n\n")
  } else {
    cat("   => Normalité des résidus remise en question ❌\n\n")
  }
  
  cat("2. Homoscédasticité (Breusch-Pagan Test) :\n")
  cat("   - Statistique BP =", round(bp$statistic, 3), "\n")
  cat("   - p-value =", round(bp$p.value, 4), "\n")
  if (bp$p.value > 0.05) {
    cat("   => Homoscédasticité respectée ✅\n\n")
  } else {
    cat("   => Présence d'hétéroscédasticité ❌\n\n")
  }
  
  cat("3. Indépendance des erreurs (Durbin-Watson Test) :\n")
  cat("   - Statistique DW =", round(dw$statistic, 3), "\n")
  cat("   - p-value =", round(dw$p.value, 4), "\n")
  if (dw$p.value > 0.05) {
    cat("   => Pas d’autocorrélation détectée ✅\n\n")
  } else {
    cat("   => Autocorrélation suspectée ❌\n\n")
  }
  
  cat("4. Multicolinéarité (Facteurs d'inflation de variance - VIF) :\n")
  print(round(vif_vals, 2))
  if (any(vif_vals > 5)) {
    cat("   => Multicolinéarité possible ❌\n\n")
  } else {
    cat("   => Pas de multicolinéarité préoccupante ✅\n\n")
  }
  
  cat("5. Spécification du modèle (Link Test) :\n")
  cat("   - Coefficient de yhat² =", round(link_summary$coefficients[3, 1], 3), "\n")
  cat("   - p-value =", round(link_summary$coefficients[3, 4], 4), "\n")
  if (link_summary$coefficients[3, 4] > 0.05) {
    cat("   => Forme fonctionnelle correcte ✅\n")
  } else {
    cat("   => Spécification du modèle remise en question ❌\n")
  }
  
  cat("\n===============================================================\n")
}

synthese_test(model_simple)

#*****************Option 1 : Méthode des dummies temporelles*****************

#Créez une matrice de design avec des dummies pour Anne
dmat <- sparse.model.matrix(~ Superficie + Usage_rec + Type_option_rec + Site_rec + Annee - 1, data = sonatur)

# Entraînez un modèle linéaire (ou XGBoost pour une approche plus robuste) :
dtrain <- xgb.DMatrix(data = as.matrix(dmat), label = sonatur$Cout_m2)
model_td <- xgboost(data = dtrain, nrounds = 100, objective = "reg:squarederror")

# Calculez l’indice :
pred_td <- predict(model_td, dtrain)
sonatur$pred_log <- pred_td
indice_td <- aggregate(pred_log ~ Annee, data = sonatur, FUN = mean)
indice_td$indice <- exp(indice_td$pred_log - indice_td$pred_log[indice_td$Annee == "2018"]) * 100
print(indice_td$indice)

#******************************************************************************
#*
#****************************** Option 2 : Méthode d’imputation hédonique*******
#*Séparez les données par année (ex. 2017, 2018, etc.) :

data_by_year <- split(sonatur, sonatur$Annee)
#*
#*Entraînez un modèle XGBoost pour chaque année

models_impute <- lapply(data_by_year, function(df) {
  dmat_year <- sparse.model.matrix(~ Superficie + Usage_rec + Type_option_rec + Site_rec - 1, data = df)
  dtrain_year <- xgb.DMatrix(data = as.matrix(dmat_year), label = df$Cout_m2)
  xgb.train(data = dtrain_year, nrounds = 100, objective = "reg:squarederror")
})


#*Imputez les prix pour un panier moyen (ex. moyenne de Superficie et mode des autres variables) :
#*
ref_data <- data.frame(
  Superficie = mean(sonatur$Superficie, na.rm = TRUE),
  Usage_rec = names(sort(table(sonatur$Usage_rec), decreasing = TRUE))[1],
  Type_option_rec = names(sort(table(sonatur$Type_option_rec), decreasing = TRUE))[1],
  Site_rec = names(sort(table(sonatur$Site_rec), decreasing = TRUE))[1]
)

ref_data$Usage_rec <- factor(ref_data$Usage_rec, levels = levels(sonatur$Usage_rec))
ref_data$Type_option_rec <- factor(ref_data$Type_option_rec, levels = levels(sonatur$Type_option_rec))
ref_data$Site_rec <- factor(ref_data$Site_rec, levels = levels(sonatur$Site_rec))

dref <- sparse.model.matrix(~ Superficie + Usage_rec + Type_option_rec + Site_rec - 1, data = ref_data)
dref_xgb <- xgb.DMatrix(data = as.matrix(dref))

# calcul des indices base 2018
pred_impute <- sapply(models_impute, function(model) predict(model, dref_xgb))
indice_impute <- exp(pred_impute) / exp(pred_impute[names(pred_impute) == "2018"]) * 100
print(indice_impute)


plot(as.numeric(names(indice_impute)), indice_impute, type = "b", xlab = "Année", ylab = "Indice des prix", main = "Indice des prix immobiliers (2018 = 100)")


#******************************************************************************


#***************************** Diagnostic du modèle ***************************
#* =========Étape 1 : Diagnostiquer la qualité du modèle====================

#1.1 Évaluer la performance des modèles par année

#Validation croisée : Comme discuté précédemment, utilisez xgb.cv() pour chaque
#année afin d'estimer l'erreur de prédiction (RMSE) et vérifier la stabilité du 
#modèle. Exécutez pour chaque dtrain_year :

# Créer une liste de matrices d'entraînement pour chaque année
dtrain_year_list <- lapply(data_by_year, function(df) {
  dmat_year <- sparse.model.matrix(~ Superficie + Usage_rec + Type_option_rec + Site_rec - 1, data = df)
  xgb.DMatrix(data = as.matrix(dmat_year), label = df$Cout_m2)
})

# Choisir une année (ex. 2018)
dtrain_year <- dtrain_year_list[["2018"]]

cv_results <- lapply(dtrain_year_list, function(dtrain_year) {
  xgb.cv(data = dtrain_year, nrounds = 100, nfold = 5, metrics = "rmse", verbose = FALSE)
})

names(cv_results) <- names(dtrain_year_list)

# Extraire la RMSE moyenne
rmse_by_year <- sapply(cv_results, function(x) tail(x$evaluation_log$test_rmse_mean, 1))
print(rmse_by_year)


#*******************************************************************************
win.graph()
plot(sonatur$Cout_m2/sonatur$Superficie)


## valeurs aberrantes


# Traitement des valeurs aberentes (outliers)
traitement_outliers <- function(df, df_var){
  # Visualisation des valeurs manquantes avant le traitement
  #boxplot(df_var, main = "Boxplot Avant")
  # Calcul des quartiles
  Q1 <- quantile(df_var, 0.25, na.rm = TRUE)
  Q3 <- quantile(df_var, 0.75, na.rm = TRUE)
  
  # IQR
  IQR_val <- Q3 - Q1
  
  # Bornes
  borne_basse <- Q1 #- 1.5 * IQR_val
  borne_haute <- Q3 #+ 1.5 * IQR_val
  
  # Filtrage : suppression des outliers
  df_clean <- df[df_var >= borne_basse & df_var <= borne_haute, ]
  return (df_clean)
}

sonatur <- traitement_outliers(df=sonatur,df_var = sonatur$Cout_m2)

