# Student Success Analytics in R  
### PCA, Segmentation, and Insights

## Overview

This project analyzes student performance data using Principal Component Analysis (PCA) and K-Means Clustering in R.

The objective was to identify the key drivers of academic success and segment students into meaningful groups for targeted institutional support.

It demonstrates an end-to-end analytics workflow combining data preparation, statistical analysis, visualization, and business recommendations.

---

## Project Snapshot

- **Records Analyzed:** 500 Students  
- **Variables Used:** 8  
- **Principal Components Interpreted:** 2  
- **Student Segments Identified:** 4  
- **Methods Used:** PCA + K-Means Clustering  

---

## Business Problem

Many institutions evaluate students mainly through marks.

This can overlook important indicators such as:

- Attendance  
- Study habits  
- Participation  
- Stress levels  
- Sleep quality  

A broader analytics framework can help identify students who need support earlier and improve retention and academic outcomes.

---

## Dataset

Synthetic dataset of **500 student records** with **8 variables**:

- Attendance  
- Study_Hours  
- Participation  
- Sleep_Hours  
- Stress_Level  
- Internal_Marks  
- Assignment_Marks  
- Final_Marks  

Synthetic data was used to demonstrate methodology while avoiding privacy concerns.

---

## Tools Used

- R  
- ggplot2  
- dplyr  
- corrplot  
- Principal Component Analysis (PCA)  
- K-Means Clustering  

---

## Methodology

### 1. Data Preparation

- Generated synthetic student records  
- Applied realistic value ranges  
- Created linked academic score variables  

### 2. Exploratory Analysis

- Summary statistics  
- Correlation analysis  
- Variable relationship review  

### 3. Principal Component Analysis

Reduced 8 variables into key dimensions explaining most variation.

### 4. K-Means Clustering

Used PCA scores to segment students into 4 groups.

### 5. Cluster Profiling

Compared average metrics across segments to interpret student types.

---

## Visual Outputs

### Correlation Heatmap

Shows relationships between attendance, study habits, stress, and marks.

![Correlation Heatmap](plots/student_correlation_heatmap.png)


---

### PCA Scree Plot

Displays variance explained by each principal component.

![PCA Scree Plot](plots/pca_scree_plot.png)

---

### PCA Score Plot

Students mapped across major performance dimensions.

![PCA Score Plot](plots/pca_score_plot_students.png)

---

### Elbow Method

Used to determine the optimal number of clusters.

![Elbow Method](plots/kmeans_elbow_method.png)

---

### Student Segments (K-Means)

Final clustering output showing four student groups.

![Student Clusters](plots/student_clusters_kmeans.png)

---

## Key Findings

### Principal Components

- **PC1: Academic Performance Dimension**  
  Driven by attendance, study hours, internal marks, assignment marks, and final marks.

- **PC2: Wellness Dimension**  
  Influenced mainly by stress levels and sleep patterns.

### Correlation Insights

- Attendance and study hours were positively associated with marks.  
- Higher stress was linked with weaker academic outcomes.  
- Lower sleep was associated with higher stress.

---

## Student Segments Identified

### 1. High Achievers

- Strong attendance  
- High marks  
- Consistent study habits  

**Suggested Action:** Advanced opportunities, mentoring roles.

---

### 2. Burnout Performers

- Good marks  
- High stress  
- Lower sleep levels  

**Suggested Action:** Wellness support, workload coaching.

---

### 3. Average Stable Students

- Moderate performance  
- Balanced habits  

**Suggested Action:** Skill-building and progression planning.

---

### 4. At-Risk Learners

- Low attendance  
- Lower marks  
- Weak engagement  

**Suggested Action:** Early intervention, tutoring, mentoring.

---

## Business Recommendations

Institutions can use this framework to build:

- Early warning dashboards  
- Student retention models  
- Personalized mentoring systems  
- Attendance alert programs  
- Wellness monitoring initiatives  

---

## Why This Project Matters

This project shows how organizations can move from reactive decisions to proactive interventions using data.

The same approach can be adapted for:

- HR Analytics  
- Employee Segmentation  
- Customer Churn Analysis  
- Consulting Strategy Projects  
- ESG / Social Impact Analytics  

---

## Repository Structure

```text
student_success_analysis.R
student_success_project.csv
student_correlation_heatmap.png
pca_scree_plot.png
pca_score_plot_students.png
kmeans_elbow_method.png
student_clusters_kmeans.png
README.md ```

## Future Scope

- Use real institutional data  
- Build predictive dropout models  
- Create Power BI / Tableau dashboards  
- Add longitudinal student tracking  
- Deploy an interactive Shiny dashboard  

---

## Outcome

This project demonstrates practical capability in:

- Data Preparation  
- Statistical Analysis  
- Unsupervised Learning  
- Data Visualization  
- Business Interpretation  
- Strategic Recommendations  

---

## GitHub Profile

**shru-analytics**
