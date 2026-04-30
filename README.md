# Student Success Analytics in R
### PCA, Segmentation, and Insights

> An end-to-end unsupervised learning project identifying student performance drivers and risk segments using PCA and K-Means Clustering in R.

![Language](https://img.shields.io/badge/Language-R-276DC3?style=flat&logo=r)
![Method](https://img.shields.io/badge/Method-PCA%20%2B%20K--Means-2ea44f?style=flat)
![Records](https://img.shields.io/badge/Records-500%20Students-orange?style=flat)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)

---

## Overview

This project analyzes student performance data using **Principal Component Analysis (PCA)** and **K-Means Clustering** in R.

The objective was to identify the key drivers of academic success and segment students into meaningful groups for targeted institutional support. It demonstrates an end-to-end analytics workflow combining data preparation, statistical analysis, visualization, and business recommendations.

---

## Project Snapshot

| Detail | Value |
|---|---|
| Records Analyzed | 500 Students |
| Variables Used | 8 |
| Principal Components Interpreted | 2 |
| Variance Explained (PC1 + PC2) | 56% |
| Student Segments Identified | 4 |
| Methods Used | PCA + K-Means Clustering |

---

## Business Problem

Many institutions evaluate students mainly through marks, which can overlook important indicators such as:

- Attendance
- Study habits
- Participation
- Stress levels
- Sleep quality

A broader analytics framework can help identify students who need support earlier and improve retention and academic outcomes.

---

## Dataset

A synthetic dataset of **500 student records** was designed to mirror real institutional patterns, enabling rigorous methodology demonstration without privacy constraints.

| Variable | Min | Median | Mean | Max |
|---|---|---|---|---|
| `Attendance` (%) | 53 | 80 | 80.3 | 100 |
| `Study_Hours` (weekly) | 0.5 | 4.5 | 4.5 | 8.5 |
| `Participation` | 38 | 71 | 70.3 | 100 |
| `Sleep_Hours` | 4.0 | 7.0 | 7.1 | 10.0 |
| `Stress_Level` (1–10) | 1.0 | 4.9 | 4.9 | 10.0 |
| `Internal_Marks` | 26 | 52.5 | 52.9 | 81 |
| `Assignment_Marks` | 36 | 57.0 | 57.3 | 82 |
| `Final_Marks` | 32 | 58.0 | 57.5 | 86 |

---

## Tools Used

- **Language:** R
- **Libraries:** `ggplot2`, `dplyr`, `corrplot`
- **Methods:** Principal Component Analysis (PCA), K-Means Clustering

---

## Methodology

### 1. Data Preparation
- Generated synthetic student records with realistic value ranges
- Engineered academic scores using weighted formulas reflecting real-world drivers (attendance, study hours, stress)

### 2. Exploratory Analysis
- Summary statistics across all 8 variables
- Correlation analysis via heatmap
- Variable relationship review

### 3. Principal Component Analysis
Reduced 8 variables into key dimensions. PC1 and PC2 together explain **56% of total variance**.

### 4. K-Means Clustering
Applied the Elbow Method to determine optimal clusters. Used first 3 PCA components as input for K-Means with k=4.

### 5. Cluster Profiling
Compared average metrics across all 4 segments to derive actionable student personas.

---

## Visual Outputs

### Correlation Heatmap
Attendance and Study Hours show strong positive correlation with all mark variables. Stress Level shows a negative association with Final Marks.

![Correlation Heatmap](plots/student_correlation_heatmap.png)

---

### PCA Scree Plot
PC1 has the highest eigenvalue (~3.07), capturing the dominant performance dimension. The curve flattens noticeably after PC2, justifying a 2-component interpretation.

![PCA Scree Plot](plots/pca_scree_plot.png)

---

### PCA Score Plot
Academic mark variables load strongly along PC1. Stress Level and Sleep Hours drive separation along PC2.

![PCA Score Plot](plots/pca_score_plot_students.png)

---

### Elbow Method
Within-cluster sum of squares drops sharply from k=1 to k=4, after which gains diminish — confirming **k=4 as the optimal cluster count**.

![Elbow Method](plots/kmeans_elbow_method.png)

---

### Student Segments (K-Means)
Four clearly separated student groups visible in PCA space. The pink cluster (High Achievers) concentrates in the high PC1 region; the blue cluster (At-Risk) sits in the low PC1 region.

![Student Clusters](plots/student_clusters_kmeans.png)

---

## Key Findings

### Principal Components

| Component | Variance Explained | Cumulative | Key Drivers |
|---|---|---|---|
| PC1 | 40.2% | 40.2% | Attendance, Study Hours, Internal, Assignment & Final Marks |
| PC2 | 15.8% | 56.0% | Stress Level, Sleep Hours |
| PC3 | 13.8% | 69.8% | Participation |

> PC1 and PC2 together explain **56% of total variance**, providing a strong 2D representation of student performance and wellness.

### Correlation Insights

- Attendance and Study Hours show **strong positive correlation** with all mark variables
- Stress Level is **negatively associated** with Final Marks
- Sleep Hours and Stress Level are **inversely related**

---

## Student Segments

Cluster averages across key variables:

| Cluster | Attendance | Study Hours | Sleep Hours | Stress Level | Final Marks |
|---|---|---|---|---|---|
| 1 — Burnout Performers | 80.1 | 3.97 | 6.33 | 6.15 | ~56 |
| 2 — High Achievers | 84.8 | 5.82 | 7.08 | 4.34 | ~67 |
| 3 — Average Stable | 80.6 | 4.51 | 7.52 | 3.87 | ~56 |
| 4 — At-Risk Learners | 73.8 | 3.39 | 7.37 | 5.38 | ~47 |

---

### 1. High Achievers (Cluster 2)
- Highest study hours (5.82/week) and attendance (84.8%)
- Best sleep and lowest stress (4.34) in the cohort
- Highest Final Marks (~67)

**Suggested Action:** Advanced opportunities, peer mentoring roles, research tracks.

---

### 2. Burnout Performers (Cluster 1)
- Decent attendance (80.1%) but highest stress levels (6.15)
- Below-average sleep (6.33 hrs) despite moderate marks

**Suggested Action:** Wellness support, workload coaching, stress management workshops.

---

### 3. Average Stable Students (Cluster 3)
- Balanced across all metrics
- Good sleep (7.52 hrs) and lowest stress (3.87) in the cohort

**Suggested Action:** Skill-building and progression planning to move toward Cluster 2.

---

### 4. At-Risk Learners (Cluster 4)
- Lowest attendance (73.8%) and study hours (3.39/week)
- Final Marks (~47) are 30% below High Achievers

**Suggested Action:** Early intervention, tutoring, mentoring, attendance alert programs.

---

## Sample Code

<details>
<summary>📎 PCA Implementation in R</summary>

```r
# Run PCA on scaled student data
pca_result <- prcomp(student, scale. = TRUE)

# View variance explained by each component
summary(pca_result)

# PCA Score Plot with variable loadings
plot(pca_result$x[,1], pca_result$x[,2],
     pch = 19, col = "grey60",
     xlab = "PC1", ylab = "PC2",
     main = "PCA Score Plot")

arrows(0, 0,
       pca_result$rotation[,1] * 5,
       pca_result$rotation[,2] * 5,
       col = "red", length = 0.1)

text(pca_result$rotation[,1] * 5,
     pca_result$rotation[,2] * 5,
     labels = rownames(pca_result$rotation),
     col = "red", pos = 3)
```

</details>

<details>
<summary>📎 K-Means Clustering in R</summary>

```r
# Use first 3 principal components as input
pca_scores <- as.data.frame(pca_result$x[, 1:3])

# Elbow Method to find optimal k
wss <- numeric(10)
for(i in 1:10){
  wss[i] <- kmeans(pca_scores, centers = i, nstart = 25)$tot.withinss
}

# Final K-Means model with k=4
set.seed(123)
km <- kmeans(pca_scores, centers = 4, nstart = 25)
student$Cluster <- as.factor(km$cluster)

# Cluster profile summary
cluster_summary <- student %>%
  group_by(Cluster) %>%
  summarise_all(mean)

print(cluster_summary)
```

</details>

---

## Business Recommendations

Institutions can use this framework to build:

- **Early warning dashboards** — flag At-Risk students before exam season
- **Student retention models** — predict dropout likelihood using cluster membership
- **Personalized mentoring systems** — match students to support pathways by segment
- **Attendance alert programs** — trigger outreach when attendance drops below cluster thresholds
- **Wellness monitoring initiatives** — identify Burnout Performers before stress peaks

---

## Why This Project Matters

This project shows how organizations can move from **reactive decisions to proactive interventions** using data. The same approach can be adapted for:

- HR Analytics & Employee Segmentation
- Customer Churn Analysis
- Consulting Strategy Projects
- ESG / Social Impact Analytics

---

## How to Run

```bash
# 1. Clone the repository
git clone https://github.com/shru-analytics/student-success-analytics-r.git

# 2. Open student-analytics-r-final.R in RStudio

# 3. Install required packages (if not already installed)
install.packages(c("ggplot2", "dplyr", "corrplot"))

# 4. Run the script end-to-end
```

---

## Repository Structure

```
student-success-analytics-r/
│
├── student-analytics-r-final.R      # Main analysis script
├── student_success_project.csv      # Generated dataset
├── README.md                        # Project documentation
│
└── plots/
    ├── student_correlation_heatmap.png
    ├── pca_scree_plot.png
    ├── pca_score_plot_students.png
    ├── kmeans_elbow_method.png
    └── student_clusters_kmeans.png
```

---

## Limitations

- Dataset is synthetic and may not capture the full complexity of real student behaviour
- K-Means assumes spherical clusters and is sensitive to outliers
- PCA loadings reflect dataset-specific patterns; results may differ on real institutional data

---

## Future Scope

- Apply to real institutional data with appropriate anonymization
- Build predictive dropout models using supervised learning
- Create interactive Power BI / Tableau dashboards
- Add longitudinal student tracking across semesters
- Deploy an interactive Shiny dashboard for live segment monitoring

---

## Skills Demonstrated

| Area | Details |
|---|---|
| Data Preparation | Synthetic data generation, realistic feature engineering |
| Statistical Analysis | PCA, variance decomposition, correlation analysis |
| Machine Learning | Unsupervised learning — K-Means with Elbow Method |
| Data Visualization | ggplot2, corrplot, base R plots |
| Business Interpretation | Segment profiling, actionable institutional recommendations |

---

## Author

**[shru-analytics](https://github.com/shru-analytics)** · MBA Business Analytics
