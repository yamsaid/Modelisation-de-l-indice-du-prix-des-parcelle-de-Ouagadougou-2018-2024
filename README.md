![header](https://capsule-render.vercel.app/api?type=cylinder&color=0:16213e,100:0f3460&height=180&text=Modélisation%20de%20l’indice%20du%20prix%20des%20parcelles%20-%20Ouagadougou%202018%20-%202024&fontSize=22&fontColor=ffffff&desc=Econométrie%20des%20Variables%20Quantitatives%20|%20Machine%20Learning&descSize=15&descAlignY=75)


<p align="center">
  <img src="https://img.shields.io/badge/Langage-R-276DC3?style=for-the-badge&logo=r&logoColor=white"/>
  <img src="https://img.shields.io/badge/M%C3%A9thode-H%C3%A9donique-4CAF50?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Mod%C3%A8le-XGBoost-FF6600?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Donn%C3%A9es-SONATUR-0077B5?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Statut-Compl%C3%A9t%C3%A9-success?style=for-the-badge"/>
</p>

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>


## Résumé

Ce projet vise à analyser et modéliser l'évolution des prix des parcelles dans la ville de Ouagadougou entre 2018 et 2024 à partir de données de transactions foncières. L'étude repose sur une approche hédonique permettant d'estimer l'influence des caractéristiques des parcelles (superficie, localisation, usage, modalités de paiement, statut administratif, etc.) sur leur valeur.

Après l'évaluation de modèles économétriques classiques, un modèle d'apprentissage automatique basé sur XGBoost a été développé afin de mieux capturer les relations non linéaires et les interactions complexes entre les variables. Les performances obtenues ont démontré une excellente capacité prédictive et une forte robustesse du modèle.

Les résultats mettent en évidence d'importantes fluctuations du marché foncier sur la période étudiée et identifient la superficie, la taxe de jouissance et les modalités de paiement comme les principaux déterminants du prix des parcelles. Le projet illustre l'intérêt des méthodes statistiques avancées et du machine learning pour le suivi des marchés immobiliers et l'aide à la décision en matière d'aménagement urbain.

### 🚀 Key Results

✔ 1 488 transactions foncières analysées

✔ 3 modèles comparés : LM, GAM, XGBoost

✔ XGBoost : R² jusqu'à 0.996

✔ Superficie = facteur le plus influent

✔ Construction d'un indice hédonique 2018–2024

✔ Application à l'aide à la décision foncière


**Compétences mobilisées** : Analyse statistique, économétrie, modélisation hédonique, machine learning, visualisation de données et aide à la décision.

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 📌 Contexte

Le développement urbain rapide de **Ouagadougou** s'accompagne d'une pression croissante sur les ressources foncières. Face à l'intensification des transactions immobilières, les acteurs publics et privés ont besoin d'outils de mesure fiables pour suivre l'évolution réelle des prix des parcelles.

Ce projet, réalisé dans le cadre du cours d'**Économétrie des Variables Quantitatives** à l'[ISSP](https://www.issp.bf) (Université Joseph Ki-Zerbo), propose une réponse à ce besoin en construisant un **indice hédonique des prix fonciers** pour la période 2018–2024.

> 💡 **Problème central :** Une simple moyenne des prix annuels ne distingue pas les variations *réelles* de celles liées aux caractéristiques des parcelles vendues (superficie, localisation, usage…). La méthode hédonique permet de neutraliser ces effets de composition.

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🎯 Objectifs

- Construire un **indice de prix hédonique** des parcelles à Ouagadougou (base 100 en 2018)
- Modéliser l'impact des **caractéristiques physiques, juridiques et contractuelles** sur le prix au m²
- Comparer trois approches de modélisation : **régression linéaire, GAM, XGBoost**
- Évaluer la **robustesse** de l'indice face aux perturbations des données

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🗂️ Données

| Caractéristique | Détail |
|---|---|
| **Source** | SONATUR — Société Nationale d'Aménagement des Terrains Urbains |
| **Période** | 2018 – 2024 |
| **Observations** | 1 811 parcelles (après nettoyage : 1 488) |
| **Variables** | 15 (quantitatives et qualitatives) |
| **Variable cible** | Coût au m² (`Cout_m2`) |
| **Couverture** | Sites périphériques et centraux de Ouagadougou |

### Variables retenues pour la modélisation

| Variable | Type | Rôle |
|---|---|---|
| `Superficie` | Continue (log) | Taille de la parcelle |
| `Taxe_Jouissance` | Continue (log) | Taxe annuelle de jouissance |
| `Site_rec` | Qualitative (4 modalités) | Localisation — effet spatial |
| `Usage_rec` | Qualitative (3 modalités) | Destination légale du terrain |
| `Type_option` | Qualitative (3 modalités) | Mode de paiement |
| `plan_etablie` | Qualitative | Niveau de formalisation |
| `attestation_etablie` | Qualitative | Sécurité juridique |
| `Annee` | Dummies temporelles | Capture de l'effet prix annuel |

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🔬 Méthodologie

```
Données brutes (SONATUR)
        │
        ▼
  Nettoyage & recodage
  • Suppression des incohérences (coût = 0 FCFA)
  • Transformation logarithmique des variables continues
  • Regroupement des modalités rares (ACM)
        │
        ▼
  Analyse descriptive
  • Statistiques univariées
  • Détection des valeurs aberrantes
  • Vérification de la multicolinéarité (GVIF)
        │
        ▼
  ┌─────────────────────────────────────────┐
  │         3 approches comparées           │
  │                                         │
  │  [1] Régression linéaire (lm)           │
  │  [2] GAM avec splines (mgcv)            │
  │  [3] XGBoost + dummies temporelles ✓   │
  └─────────────────────────────────────────┘
        │
        ▼
  Construction de l'indice hédonique
  Indice_t = exp(δ̂_t) × 100   (base 2018)
        │
        ▼
  Validation & robustesse
  • Validation croisée par année
  • Test de perturbation (+10% superficie)
  • Comparaison indice réel vs indice modèle
```

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🛠️ Stack technique

<p align="center">
  <img src="https://img.shields.io/badge/readr-Importation-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/tidyverse-Manipulation-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/lubridate-Dates-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/lmtest-Tests%20économétriques-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/car-VIF-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/VIM-Valeurs%20manquantes-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/psych-Stats%20descriptives-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/corrplot-Corrélation-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/xgboost-Modélisation-FF6600?style=flat-square"/>
  <img src="https://img.shields.io/badge/Matrix-Algèbre-276DC3?style=flat-square&logo=r"/>
  <img src="https://img.shields.io/badge/mgcv-GAM-276DC3?style=flat-square&logo=r"/>
</p>

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 📊 Résultats


### Performances du modèle XGBoost par année

| Année | RMSE | R² | Interprétation |
|:---:|:---:|:---:|---|
| 2018 | 0.17 | 0.867 | Très bon ajustement |
| 2019 | 0.12 | 0.947 | Très bon ajustement |
| 2020 | 0.12 | 0.893 | Très bon ajustement |
| 2021 | 0.10 | 0.983 | Très bon ajustement |
| 2022 | 0.05 | 0.983 | Très bon ajustement |
| 2023 | 0.03 | 0.976 | Très bon ajustement |
| 2024 | 0.01 | 0.996 | Très bon ajustement |

### Indice hédonique des prix (base 100 en 2018)

| Année | Indice | Variation |
|:---:|:---:|:---:|
| 2018 | 100.0 | — |
| 2019 | 100.4 | +0.4% |
| 2020 | 97.0 | −3.4% |
| 2021 | 87.9 | −9.3% |
| 2022 | **116.1** | **+32.1%** |
| 2023 | 80.7 | −30.5% |
| 2024 | 80.1 | −0.9% |

### Visualisations

### *Indice des prix des parcelles predit par le modèle linéaire*

<img width="581" height="310" alt="image" src="https://github.com/user-attachments/assets/7638f077-c9ac-47c8-8ed4-c36b544b15c9" />

### *Calcul de l’indice de prix base 2018*
<img width="605" height="322" alt="image" src="https://github.com/user-attachments/assets/4312c8e2-4632-412e-a478-cdbdb33c2028" />

### *L'adaptation du modèle aux perturbations*

<img width="783" height="557" alt="image" src="https://github.com/user-attachments/assets/45192e20-ad6d-4db8-b097-88cf43b5c4ed" />

### *Évolution de l'indice de prix de 2018 à 2024*

<img width="857" height="521" alt="image" src="https://github.com/user-attachments/assets/b1a378b3-dc38-4a27-8ecc-bd2b5a4043eb" />

### *Importance des variables dans le modèle XGBoost*
  
<img width="550" height="223" alt="image" src="https://github.com/user-attachments/assets/b4355bf1-dab2-4101-8d93-e5a7c34ddf10" />

### Principaux déterminants du prix au m²

```
Superficie          ████████████████████  Gain: 0.378 — Variable la plus influente
Taxe_Jouissance     ████████████          Gain: 0.224 — Effet complémentaire fort
Type_option         ████                  Gain: 0.080 — Modalités de paiement
Site_rec            ███                   Gain: 0.050 — Effet spatial
Annee (dummies)     ██                    Gain: 0.02–0.045 — Effets temporels
Usage_rec           █                     Gain: 0.011–0.031 — Destination du terrain
```

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 💡 Interprétation économique

L'indice hédonique révèle une **évolution instable** du marché foncier ouagalais sur la période :

- **2018–2019** : marché stable (+0.4%), période de référence
- **2020–2021** : baisse progressive (−12.1% cumulé), probablement liée aux effets de la crise sanitaire mondiale et au contexte sécuritaire au Sahel
- **2022** : pic spectaculaire à **116.1** (+32.1%), traduisant une pression spéculative ou une offre insuffisante face à la demande urbaine
- **2023–2024** : fort recul et stabilisation à **~80**, suggérant un retournement du marché

> ⚠️ Cette volatilité appelle à une **régulation foncière adaptée** et à un suivi continu des dynamiques du marché immobilier à Ouagadougou.

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🌍 Impact

Ce projet fournit un indicateur objectif de suivi du marché foncier urbain à Ouagadougou.

Les résultats peuvent être utilisés par :

- collectivités territoriales
- urbanistes
- investisseurs immobiliers
- chercheurs
- décideurs publics

  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## ⚠️ Limites

- Données limitées aux transactions SONATUR
- Variables socio-économiques indisponibles
- Absence de coordonnées géographiques précises
- Généralisation limitée hors Ouagadougou

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 🧠 Compétences développées

| Domaine | Compétences |
|---|---|
| **Statistiques** | Analyse descriptive multivariée, détection de valeurs aberrantes, tests d'hypothèses (Shapiro, Breusch-Pagan, GVIF) |
| **Économétrie** | Modèle hédonique, dummies temporelles, construction d'indices de prix |
| **Machine Learning** | XGBoost (tuning d'hyperparamètres, validation croisée temporelle, feature importance) |
| **Modèles semi-paramétriques** | GAM avec effets splines (mgcv), interprétation des edf |
| **Traitement des données** | Recodage de variables, ACM pour regroupement de modalités, transformation logarithmique |
| **Visualisation** | ggplot2, corrplot, diagnostics graphiques de résidus |
| **R** | Programmation structurée, pipeline de modélisation reproductible, R Markdown |

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 👥 Équipe & Encadrement

### Réalisé par

<table align="center">
  <tr>
    <td align="center">
      <b>NIAMPA Abdoul Fataho</b><br/>
      <sub>Licence Analyse Statistique — ISSP</sub>
      <a href="https://github.com/fatah">
        <img src="https://img.shields.io/badge/GitHub-fatah-181717?style=flat-square&logo=github"/>
      </a>
    </td>
    <td align="center">
      <b>SAWADOGO Pengdwendé Orianne-Aurele</b><br/>
      <sub>Licence Analyse Statistique — ISSP</sub>
      <a href="https://github.com/#">
        <img src="https://img.shields.io/badge/GitHub-aurele-181717?style=flat-square&logo=github"/>
      </a>
    </td>
    <td align="center">
      <b>YAMEOGO Saïdou</b><br/>
      <sub>Licence Analyse Statistique — ISSP</sub><br/>
      <a href="https://github.com/yamsaid">
        <img src="https://img.shields.io/badge/GitHub-yamsaid-181717?style=flat-square&logo=github"/>
      </a>
    </td>
  </tr>
</table>

### Encadrement

<table align="center">
  <tr>
    <td align="center">
      <b>Dr. Boyam Fabrice YAMEOGO</b><br/>
      <sub>Enseignant — Économétrie des Variables Quantitatives</sub><br/>
      <sub>Institut Supérieur des Sciences de la Population (ISSP)</sub><br/>
      <sub>Université Joseph Ki-Zerbo, Ouagadougou 🇧🇫</sub>
    </td>
  </tr>
</table>

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 📁 Structure du projet

```
📦 indice-prix-foncier-ouaga/
├── 📄 README.md
├── 📊 data/
│   └── sonatur_data.csv          # Données SONATUR (non publiées — confidentielles)
├── 📝 script/
│   └── analyse_hedonic.Rmd       # Script principal R Markdown
├── 📈 figures/
│   ├── indice_prix_2018_2024.png
│   ├── comparaison_indices.png
│   ├── importance_variables.png
│   └── residus_par_annee.png
└── 📋 rapport/
    └── rapport_final.pdf
```

> ⚠️ **Note :** Les données SONATUR sont confidentielles et ne sont pas publiées dans ce dépôt.

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

## 📄 Lire le rapport

<p align="center">
  <img width="700" height="888" alt="image" src="https://github.com/user-attachments/assets/fb6a0445-c0f7-483b-9437-38ae0e672a2d" />
</p>

[Read Full Report](rapport.pdf)

<img src="https://capsule-render.vercel.app/api?type=soft&color=0:4facfe,100:00f2fe&height=3" width="100%"/>


## 📚 Références

- Rosen, S. (1974). *Hedonic Prices and Implicit Markets*. Journal of Political Economy.
- Chen, T. & Guestrin, C. (2016). *XGBoost: A Scalable Tree Boosting System*. ACM SIGKDD.
- Wood, S.N. (2017). *Generalized Additive Models: An Introduction with R*. Chapman & Hall.

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:4facfe,100:00f2fe&height=3" width="100%"/>

<p align="center">
  <sub>Projet réalisé en Juin 2025 — ISSP · Université Joseph Ki-Zerbo · Burkina Faso 🇧🇫</sub>
</p>

![footer](https://capsule-render.vercel.app/api?type=waving&color=0:1a1a2e,100:16213e&height=100&section=footer)
