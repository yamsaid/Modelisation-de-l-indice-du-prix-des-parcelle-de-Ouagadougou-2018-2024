# 📊 Économétrie des Variables Quantitatives - Modélisation des Prix Immobiliers

## 🎯 Objectif du Projet

Analyse économétrique des déterminants des prix immobiliers en utilisant des méthodes de régression linéaire multiple. Le projet vise à identifier et quantifier l'impact des différentes variables explicatives sur les prix du marché immobilier.

## 📋 Contexte et Données

### Base de Données
- **Source** : SONATUR (Société Nationale des Terrains Urbains)
- **Période** : Données de ventes de terrains
- **Localisation** : Burkina Faso
- **Taille** : Base de données complète des transactions

### Variables d'Analyse
- **Variable dépendante** : Prix au m² (`Cout_m2`)
- **Variables explicatives** :
  - Superficie du terrain
  - Type d'usage (habitation, commerce, etc.)
  - Localisation (ville, site)
  - Infrastructures (électricité, eau)
  - Date de vente
  - Type d'option de paiement

## 🛠️ Technologies Utilisées

### Langage et Packages R
- **R** : Langage de programmation principal
- **tidyverse** : Manipulation et visualisation de données
- **lmtest** : Tests économétriques
- **car** : Tests de diagnostic
- **VIM** : Visualisation des valeurs manquantes
- **psych** : Statistiques descriptives
- **corrplot** : Matrices de corrélation

### Outils de Développement
- **R Markdown** : Création de rapports dynamiques
- **LaTeX** : Formatage des documents
- **Git** : Contrôle de version

## 📊 Méthodologie

### 1. Exploration des Données
- **Statistiques descriptives** : Moyennes, médianes, écarts-types
- **Analyse des valeurs manquantes** : Identification et traitement
- **Détection d'outliers** : Méthode des boîtes à moustaches
- **Matrices de corrélation** : Relations entre variables

### 2. Prétraitement des Données
- **Nettoyage** : Suppression des incohérences
- **Recodage** : Transformation des variables catégorielles
- **Transformation logarithmique** : Normalisation des distributions
- **Traitement des outliers** : Méthode IQR

### 3. Modélisation Économétrique
- **Régression linéaire multiple** : Modèle OLS
- **Tests de diagnostic** : Normalité, homoscédasticité, multicolinéarité
- **Sélection de variables** : Critères d'information
- **Validation du modèle** : Tests de robustesse

## 📈 Résultats Principaux

### Statistiques Descriptives
- **Prix moyen** : [Valeur] FCFA/m²
- **Écart-type** : [Valeur] FCFA/m²
- **Distribution** : Asymétrie positive (log-normale)

### Corrélations Significatives
- **Superficie ↔ Prix** : Corrélation positive forte
- **Infrastructures ↔ Prix** : Impact positif
- **Localisation ↔ Prix** : Effet géographique marqué

### Modèle Final
```
log(Prix_m²) = β₀ + β₁×log(Superficie) + β₂×Usage + β₃×Site + β₄×Infrastructures + ε
```

## 🔍 Tests Économétriques

### Tests de Diagnostic
- **Test de Shapiro-Wilk** : Normalité des résidus
- **Test de Breusch-Pagan** : Homoscédasticité
- **VIF** : Détection de multicolinéarité
- **Test de Ramsey** : Spécification du modèle

### Tests de Robustesse
- **Résidus studentisés** : Détection d'influential observations
- **Cook's Distance** : Points influents
- **Leverage** : Points de levier
- **DFFITS** : Impact sur les prédictions

## 📁 Structure des Fichiers

```
Econometrie des variables quantitatives/
├── script_quanti.R              # Script principal d'analyse
├── script.Rmd                   # Rapport R Markdown
├── Sonatur_csvf.csv            # Base de données
├── xgb_model_features.rds      # Modèle XGBoost
├── docs/                       # Documentation
├── TP/                         # Travaux pratiques
└── Quanti.Rproj               # Projet R
```

## 🎯 Compétences Développées

### Économétrie
- **Régression linéaire multiple** : Estimation et interprétation
- **Tests de diagnostic** : Validation des hypothèses
- **Sélection de modèles** : Critères d'information
- **Inférence statistique** : Tests d'hypothèses

### Statistiques
- **Statistiques descriptives** : Résumés numériques
- **Analyse exploratoire** : Visualisation des données
- **Tests de normalité** : Validation des distributions
- **Corrélation** : Relations entre variables

### Programmation R
- **Manipulation de données** : tidyverse, dplyr
- **Visualisation** : ggplot2, corrplot
- **Modélisation** : lm, diagnostics
- **Reporting** : R Markdown, LaTeX

### Traitement de Données
- **Nettoyage** : Correction des erreurs
- **Recodage** : Transformation des variables
- **Gestion des valeurs manquantes** : Imputation
- **Détection d'outliers** : Méthodes robustes

## 📊 Interprétation des Résultats

### Effets Principaux
1. **Superficie** : Impact positif et significatif
2. **Usage commercial** : Prime sur les prix
3. **Infrastructures** : Valeur ajoutée importante
4. **Localisation** : Effet géographique marqué

### Implications Politiques
- **Planification urbaine** : Optimisation des aménagements
- **Politique foncière** : Tarification des terrains
- **Investissement** : Priorisation des infrastructures
- **Développement** : Stratégies d'aménagement

## 🚀 Améliorations Possibles

### Méthodologiques
- **Modèles non-linéaires** : Régression polynomiale
- **Variables instrumentales** : Endogénéité
- **Modèles de panel** : Données temporelles
- **Machine Learning** : XGBoost, Random Forest

### Techniques
- **Données géospatiales** : Coordonnées GPS
- **Imagerie satellitaire** : Variables environnementales
- **Données socio-économiques** : Indicateurs locaux
- **Séries temporelles** : Évolution des prix

## 📚 Applications Pratiques

### Secteur Immobilier
- **Évaluation foncière** : Estimation des prix
- **Investissement** : Analyse de rentabilité
- **Développement** : Planification urbaine
- **Régulation** : Politiques de prix

### Recherche
- **Publications académiques** : Articles scientifiques
- **Thèses** : Recherche doctorale
- **Consulting** : Études de marché
- **Formation** : Cours d'économétrie

## 🎓 Formation

Ce projet a été réalisé dans le cadre d'une formation en :
- **Économétrie appliquée**
- **Statistiques avancées**
- **Analyse de données**
- **Programmation R**

## Equipe

- **NIAMPA Abdoul Fatah**
- **SAWADOGO Pengdwendé Orianne-Aurele**
- **YAMEOGO Saïdou**

## Enseignant

- **Dr Boyam Fabrice YAMEOGO**

---

# Le résumé du projet : Modélisation de l’indice du prix des parcelles entre 2018 et 2024 à Ouagadougou

*Université Joseph Ki-Zerbo – Institut Supérieur des Sciences de la Population*  
**Licence Professionnelle en Analyse Statistique – 2e année**  
**Groupe 4 – Économétrie des Variables Quantitatives**  
**Réalisé par :** NIAMPA Abdoul Fataho, SAWADOGO Pengdwendé Orianne-Aurele, YAMEOGO Saïdou  
**Encadrant :** Dr. Boyam Fabrice YAMEOGO  
**Date :** Juin 2025  

---

## 🎯 Objectif

Estimer un **indice d’évolution des prix des parcelles** dans la ville de Ouagadougou entre 2018 et 2024 à partir des données de la SONATUR, en neutralisant les effets de composition grâce à une **approche hédonique**.

---

## 📦 Données utilisées

- **Source :** Société Nationale d’Aménagement des Terrains Urbains (SONATUR)
- **Taille :** 1811 observations, 15 variables
- **Variables clés :** `Cout_m2`, `Superficie`, `Taxe_Jouissance`, `Usage`, `Site`, `Type_option`, etc.

---

## 📊 Analyse descriptive

### Variables quantitatives
- Fortes **asymétries positives** sur le coût au m², la superficie et la taxe de jouissance.
- Présence d’**observations incohérentes** : prix nuls, contrat incohérent → supprimées.

### Variables qualitatives
- Parcelles toutes situées à **Ouagadougou**
- **Usage principal :** habitation (64.5 %)
- **Site dominant :** SILMIOUGOU (56.9 %)
- Certaines variables administratives ("plan établi", "attestation") peu informatives.

---

## ⚙️ Traitements et transformation des données

- Recodage de variables (`Usage_rec`, `Site_rec`) pour réduire la rareté de certaines modalités.
- Transformation **logarithmique** des variables quantitatives pour réduire l’hétéroscédasticité.
- Suppression de variables constantes ou redondantes (`COUT` = `Cout_m2 × Superficie`).
- Vérification de **multicolinéarité** (GVIF^(1/2df) < 2.5 pour toutes les variables retenues).

---

## 🧠 Méthodologie : Approche hédonique

### Spécification du modèle

Modèle de base : 

```log(Cout_m2) = α + βₖXᵢₖ + γₜDᵢₜ + εᵢ
```

- Variables explicatives : caractéristiques du terrain (superficie, usage, site…), variables temporelles (`Annee`).
- Vérification des hypothèses classiques (normalité, linéarité, homoscédasticité, etc.).

---

## 🔍 Modélisation

### 1. Modèle linéaire classique
- **Problèmes détectés** : hétéroscédasticité, non-normalité des résidus, non-linéarité.
- **Indice estimé (base 2018 = 100)** :
  - 2018 : 100
  - 2021 : 98.95
  - 2022 : 101.65
  - 2024 : 97.97

### 2. Modèle GAM (Additif généralisé)
- Utilise une **fonction spline** pour modéliser l'effet non linéaire de la superficie.
- Meilleur ajustement, mais toujours présence d’asymétrie et hétéroscédasticité.

### 3. Modèle XGBoost avec dummies temporelles
- **Excellente performance prédictive** :
  - R² entre 0.87 et 0.99
  - RMSE très faible (0.01 en 2024)
- **Test de robustesse** : indice stable malgré perturbation de la superficie (+10 %)

---

## 📈 Indice estimé des prix (modèle XGBoost)

| Année | Indice (base 2018 = 100) | Variation annuelle |
|-------|---------------------------|---------------------|
| 2018 | 100.0                     | NA                  |
| 2019 | 100.4                     | +0.39 %             |
| 2020 | 97.0                      | -3.42 %             |
| 2021 | 87.9                      | -9.33 %             |
| 2022 | 116.1                     | +32.13 %            |
| 2023 | 80.7                      | -30.48 %            |
| 2024 | 80.1                      | -0.85 %             |

---

## 🧮 Importance des variables (XGBoost)

| Variable            | Gain   | Fréquence |
|---------------------|--------|-----------|
| Superficie          | 0.378  | 0.416     |
| Taxe_Jouissance     | 0.224  | 0.089     |
| Type_option         | 0.080  | 0.046     |
| Variables temporelles (`Annee`) | ~0.03 – 0.04 | -         |
| Usage_rec, Site_rec | ~0.01 – 0.05 | -     |

---

## 🧾 Conclusion

- L’approche hédonique permet de construire un **indice plus fiable** que la moyenne brute.
- Le modèle **XGBoost** s’avère le plus performant, capturant bien les non-linéarités et interactions complexes.
- Les **variations de l’indice** montrent une instabilité du marché foncier entre 2018 et 2024.
- Les variables **superficie**, **taxe de jouissance** et **type d’option** sont les plus influentes.
- L’indice obtenu peut servir de **référence stratégique** pour les acteurs publics et privés du secteur foncier.

---



---
*Ce projet démontre l'application rigoureuse des méthodes économétriques pour l'analyse des marchés immobiliers et l'aide à la décision.* 