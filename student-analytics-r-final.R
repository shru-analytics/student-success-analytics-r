# ==========================================
# STUDENT SUCCESS ANALYTICS PROJECT
# PCA + K-MEANS CLUSTERING IN R
# ==========================================

# -------------------------------
# 1. Load Libraries
# -------------------------------
library(ggplot2)
library(corrplot)
library(dplyr)

# -------------------------------
# 2. Generate Synthetic Dataset
# -------------------------------
set.seed(123)
n <- 500

student <- data.frame(
  Attendance    = round(rnorm(n, 80, 10)),
  Study_Hours   = round(rnorm(n, 4.5, 1.5), 1),
  Participation = round(rnorm(n, 70, 12)),
  Sleep_Hours   = round(rnorm(n, 7, 1), 1),
  Stress_Level  = round(rnorm(n, 5, 2), 1)
)

# Apply realistic limits
student$Attendance    <- pmin(pmax(student$Attendance, 40), 100)
student$Study_Hours   <- pmin(pmax(student$Study_Hours, 0.5), 10)
student$Participation <- pmin(pmax(student$Participation, 20), 100)
student$Sleep_Hours   <- pmin(pmax(student$Sleep_Hours, 4), 10)
student$Stress_Level  <- pmin(pmax(student$Stress_Level, 1), 10)

# Create academic scores
student$Internal_Marks <- round(
  0.35 * student$Attendance +
    4.00 * student$Study_Hours +
    0.20 * student$Participation -
    1.50 * student$Stress_Level +
    rnorm(n, 0, 5)
)

student$Assignment_Marks <- round(
  0.30 * student$Attendance +
    3.50 * student$Study_Hours +
    0.25 * student$Participation +
    rnorm(n, 0, 5)
)

student$Final_Marks <- round(
  0.40 * student$Internal_Marks +
    0.35 * student$Assignment_Marks +
    0.10 * student$Attendance +
    2.00 * student$Sleep_Hours -
    1.20 * student$Stress_Level +
    rnorm(n, 0, 5)
)

# Restrict marks to 0-100
student$Internal_Marks   <- pmin(pmax(student$Internal_Marks, 0), 100)
student$Assignment_Marks <- pmin(pmax(student$Assignment_Marks, 0), 100)
student$Final_Marks      <- pmin(pmax(student$Final_Marks, 0), 100)

# -------------------------------
# 3. Exploratory Data Analysis
# -------------------------------
summary(student)

corrplot(cor(student),
         method = "color",
         tl.cex = 0.8)

# -------------------------------
# 4. Principal Component Analysis
# -------------------------------
pca_result <- prcomp(student, scale. = TRUE)

summary(pca_result)

# Scree Plot
plot(pca_result, type = "l", main = "Scree Plot")

# PCA Biplot
biplot(pca_result, scale = 0)

biplot(prcomp(student[1:100,], scale=TRUE), scale=0)

plot(pca_result$x[,1], pca_result$x[,2],
     pch=19,
     col="grey60",
     xlab="PC1",
     ylab="PC2",
     main="PCA Score Plot")

arrows(0,0,
       pca_result$rotation[,1]*5,
       pca_result$rotation[,2]*5,
       col="red",
       length=0.1)

text(pca_result$rotation[,1]*5,
     pca_result$rotation[,2]*5,
     labels=rownames(pca_result$rotation),
     col="red",
     pos=3)

# -------------------------------
# 5. K-Means Clustering
# -------------------------------

# Use first 3 principal components
pca_scores <- as.data.frame(pca_result$x[, 1:3])

# Elbow Method
wss <- numeric(10)

for(i in 1:10){
  wss[i] <- kmeans(pca_scores, centers = i, nstart = 25)$tot.withinss
}

plot(1:10, wss,
     type = "b",
     pch = 19,
     xlab = "Number of Clusters",
     ylab = "Within Sum of Squares",
     main = "Elbow Method")

# Final K-Means Model
set.seed(123)
km <- kmeans(pca_scores, centers = 4, nstart = 25)

student$Cluster <- as.factor(km$cluster)

# Cluster Plot
plot(pca_scores$PC1, pca_scores$PC2,
     col = student$Cluster,
     pch = 19,
     xlab = "PC1",
     ylab = "PC2",
     main = "Student Clusters")

# -------------------------------
# 6. Cluster Profiles
# -------------------------------
cluster_summary <- student %>%
  group_by(Cluster) %>%
  summarise_all(mean)

print(cluster_summary)

# -------------------------------
# 7. Export Final Dataset
# -------------------------------
write.csv(student,
          "student_success_project.csv",
          row.names = FALSE)
