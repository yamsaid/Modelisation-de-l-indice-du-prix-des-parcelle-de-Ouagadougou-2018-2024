mesdonnees  <- read.csv("data/Poids_naissance.csv",sep = "")

#Conversion de Livre en Kg : 1livre = 0,453592kg
kg = 0.453592
mesdonnees[,"LWT"] = mesdonnees$LWT*kg

newdata= mesdonnees[c("BWT","AGE", "LWT","SMOKE")]

# correlation
library(stats)
newdata[,-4]%>%
  cor

library(GGally)
ggpairs(newdata)

# Estimer le modele lineire avec la fonction lm

modele2 <- lm( BWT ~ AGE + LWT + as.factor(SMOKE), data = newdata)
summary(modele2)

'''

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)       2362.720    300.687   7.858 3.11e-13 ***
  AGE                  7.093      9.925   0.715   0.4757    
LWT                  8.860      3.791   2.337   0.0205 *  
  as.factor(SMOKE)1 -267.213    105.802  -2.526   0.0124 * 
  
(Intercept) = a0 constante
Std. Error : la variance de l estimation du coef : sigma_chapeau bêta_chapeau 
t value : la statistique; 
Pr(>|t|) : p valu


# interpretation de SMOK
A poid et age identique, toute chose etant égale par ailleurs, l enfant né d une
mère fumeuse a un poids de 267.213 g de moins qu un enfant né d une maman non fumeuse
'''




# les intervalles de confiance 
# niveau de confiance à 95%

confint(modele2, level = 0.95)


'''
> confint(modele2, level = 0.95)
                        2.5 %     97.5 %
(Intercept)       1769.504181 2955.93509
AGE                -12.486773   26.67319
LWT                  1.380733   16.34008
as.factor(SMOKE)1 -475.945996  -58.48000


si 0 est dans l interrvalle de confiance, cette var n est pas significative
sinon oui
'''

" =============== 08-05-2025 ============================================

 modèle 1 : BWT = β0 + β1LWT + epsilon ;
 modèle 2 : BWT = β0 + β1LWT + β2AGE + β3SMOKE + epsilon
 
 on cherche à verifier la significativité des paramètres
 
 h0 : 




"
model3= lm( BWT ~ LWT + as.factor(SMOKE), data = newdata)
anova(model3,modele2)

model4 <- lm( BWT ~ LWT + as.factor(RACE), data = mesdonnees)
summary(model4)


# reorganiser

model4 <- lm( BWT ~ LWT + relevel(as.factor(RACE), ref = "2"), data = mesdonnees)
summary(model4)


model5 <- lm( BWT ~ LWT+as.factor(LOW)+FVT+as.factor(UI)+as.factor(HT)+PTL+as.factor(SMOKE)+AGE+ relevel(as.factor(RACE), ref = "2"), data = mesdonnees)
summary(model5)

# librairy

library(performance)

#Multicollinéarité
dbase=data("mtcars")
mod.rlm1=lm(mpg~.,data=mtcars)
summary(mod.rlm1)
check_collinearity(mod.rlm1)

# toutes les variables ayant VIF (fort) superieur à 10 doivent etre suprimer

mod.rlm2 <- update(mod.rlm1, .~.-disp)

check_collinearity(mod.rlm2)

# supprimer cyl
mod.rlm3 <- update(mod.rlm2, .~.-cyl)

check_collinearity(mod.rlm3)

summary(mod.rlm3)

# formellement on elimine tous ce qui depasse 5

mod.rlm4 <- update(mod.rlm3, .~.-hp)

check_collinearity(mod.rlm4)

mod.rlm5 <- update(mod.rlm4, .~.-wt)

check_collinearity(mod.rlm5)

summary(mod.rlm5)


#test d'heteroscedasticité

check_heteroscedasticity(mod.rlm5)


# Autocorelation

check_autocorrelation(mod.rlm5)


#la normalité 
check_normality(mod.rlm5)



# subdiviser l'ecran
par(mfrow= c(2,2))
plot(mod.rlm5)






