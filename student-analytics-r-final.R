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

# Apply limits
student$Attendance    <- pmin(pmax(student$Attendance, 40), 100)
student$Study_Hours   <- pmin(pmax(student$Study_Hours, 0.5), 10)
student$Participation <- pmin(pmax(student$Participation, 20), 100)
student$Sleep_Hours   <- pmin(pmax(student$Sleep_Hours, 4), 10)
student$Stress_Level  <- pmin(pmax(student$Stress_Level, 1), 10)

# Academic Scores
student$Internal_Marks <- round(
  0.35 * student$Attendance +
  4.00 * student$Study_Hours +
  0.20 * student$Participation -
  1.50 * student$Stress_Level +
  rnorm(n,0,5)
)

student$Assignment_Marks <- round(
  0.30 * student$Attendance +
  3.50 * student$Study_Hours +
  0.25 * student$Participation +
  rnorm(n,0,5)
)

student$Final_Marks <- round(
  0.40 * student$Internal_Marks +
  0.35 * student$Assignment_Marks +
  0.10 * student$Attendance +
  2.00 * student$Sleep_Hours -
  1.20 * student$Stress_Level +
  rnorm(n,0,5)
)

# Restrict marks
student$Internal_Marks   <- pmin(pmax(student$Internal_Marks,0),100)
student$Assignment_Marks <- pmin(pmax(student$Assignment_Marks,0),100)
student$Final_Marks      <- pmin(pmax(student$Final_Marks,0),100)

# -------------------------------
# 3. Correlation Heatmap
# -------------------------------
corrplot(cor(student),
         method = "color",
         tl.cex = 0.8)

# -------------------------------
# 4. PCA
# -------------------------------
pca_result <- prcomp(student, scale. = TRUE)

# PCA Scores
pca_scores <- as.data.frame(pca_result$x[,1:3])

# -------------------------------
# 5. Elbow Method (ggplot2)
# -------------------------------
wss <- numeric(10)

for(i in 1:10){
  wss[i] <- kmeans(pca_scores, centers = i, nstart = 25)$tot.withinss
}

elbow_df <- data.frame(
  Clusters = 1:10,
  WSS = wss
)

ggplot(elbow_df, aes(x = Clusters, y = WSS)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(
    title = "Elbow Method for Optimal Clusters",
    x = "Number of Clusters",
    y = "Within Sum of Squares"
  ) +
  theme_minimal()

# -------------------------------
# 6. K-Means Clustering
# -------------------------------
set.seed(123)
km <- kmeans(pca_scores, centers = 4, nstart = 25)

student$Cluster <- as.factor(km$cluster)
pca_scores$Cluster <- student$Cluster

# -------------------------------
# 7. Cluster Plot (ggplot2)
# -------------------------------
ggplot(pca_scores,
       aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 2.5, alpha = 0.75) +
  labs(
    title = "Student Segments using PCA + K-Means",
    x = "Principal Component 1",
    y = "Principal Component 2"
  ) +
  theme_minimal()

# -------------------------------
# 8. Cluster Profiles
# -------------------------------
cluster_summary <- student %>%
  group_by(Cluster) %>%
  summarise(across(where(is.numeric), mean))

print(cluster_summary)

# -------------------------------
# 9. Export Dataset
# -------------------------------
write.csv(student,
          "student_success_project.csv",
          row.names = FALSE)
