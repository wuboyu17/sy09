# UV : SY09 - TP02: Classification automatique
# Exercice 2 : Classification hi�rarchique
# Auteurs : Bertrand Bon - Antoine Hars
# Fichier : exercice2.R

# 1)
# La segmentation hi�rarchique ascendante d'un jeu de donn�es standard
# est obtenue par la fonction hclust(dist(matrice))
# dist permet de calculer la distance euclidienne entre chaque paire
# de donn�es

# Dans notre cas, nous avons d�j� une matrice des distances.
# nous la triangularisons pour avoir ensuite y appliquer la fonction hclust
trig = as.dist(mutations)

# Classification hi�rarchique ascendante des donn�es.
png(file = "plots/plot_ward_1.png")
plot(hclust((trig * trig), method = "ward"), main = "CHA m�thode Ward")
dev.off();

png(file = "plots/plot_complete_1.png")
plot(hclust(trig, method = "complete"), main = "CHA m�thode Complete")
dev.off();

png(file = "plots/plot_centroid_1.png")
plot(hclust(trig, method = "centroid"), main = "Centroid")
dev.off();

png(file = "plots/plot_median_1.png")
plot(hclust(trig, method = "median"), main = "Median")
dev.off();

png(file = "plots/plot_mcquitty_1.png")
plot(hclust(trig, method = "mcquitty"), main = "Mcquitty")
dev.off();

png(file = "plots/plot_single_1.png")
plot(hclust(trig, method = "single"), main = "Single")
dev.off();

# classifications � comparer...
# s'il y en a une � utiliser, il s'agit de la m�thode WARD.

# 2)
# classification hi�rarchique ascendante des donn�es iris (m�thode WARD).
library(MASS)
data(iris)
d = dist(iris[,1:4]) * dist(iris[,1:4])
irisclust = hclust (d, method = "ward")

png(file = "plots/plot_ward_2.png")
plot(irisclust, main = "Dendogramme irisclust, m�thode WARD")
rect.hclust(irisclust, 3, border = c("blue", "green", "red"))
dev.off();

# http://www.grappa.univ-lille3.fr/~ppreux/ensg/miashs/fouilleDeDonneesII/tp/segmentation-hierarchique/
# http://dlanguig.nonutc.fr/sy09/rapport_tp3.pdf
# http://www.site-naheulbeuk.com/utbm/sy09/sy09_rapport_tp2.pdf

library(cluster)

# Clusplot pour la CAH d'iris
iris.x <- iris[, 1:4]
cl3 <- pam(iris.x, 3)$clustering
png(file = "plots/clusplot_ward_1.png")
clusplot(iris.x, cl3, color = TRUE, main = "Clusplot iris, crit�re WARD", shade = TRUE, labels = 2)
dev.off();

# Une autre mani�re pour avoir la CAH avec agnes.
png(file = "plots/plot_ward_3.png")
plot(agnes(iris.x, metric = "euclidian", method = "ward"))
dev.off();

# Classification descendante de iris avec diana
png(file = "plots/plot_euclidian_1.png")
plot(diana(iris.x, metric = "euclidian"))
dev.off();

cl4 = kmeans(iris.x, 3)$cluster
png(file = "plots/clusplot_kmeans_10.png")
clusplot(iris.x, cl4, color = TRUE, shade = TRUE, labels = 2, main = "Clusplot iris en CDH")
dev.off();
