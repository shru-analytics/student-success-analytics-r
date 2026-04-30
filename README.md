# Student Success Analytics in R  
### PCA, Segmentation, and Insights

## Overview

This project analyzes student performance data using Principal Component Analysis (PCA) and K-Means Clustering in R.

The objective was to identify the key drivers of academic success and segment students into actionable groups for targeted institutional support.

It demonstrates how analytics can be used to improve decision-making in education, consulting, HR, and people-focused strategy roles.

---

## Business Problem

Many institutions evaluate students primarily through marks.

This overlooks important indicators such as:

- Attendance  
- Study habits  
- Participation  
- Stress levels  
- Sleep quality  

A broader analytics framework can help identify students who need support earlier and improve academic outcomes.

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

Synthetic data was used to demonstrate methodology while avoiding privacy risks.

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

- Generated realistic synthetic student data  
- Applied logical value limits  
- Built academic score relationships

### 2. Exploratory Analysis

- Summary statistics  
- Correlation heatmap  
- Variable relationship review

### 3. Principal Component Analysis

Reduced 8 variables into key dimensions explaining most variation.

### 4. K-Means Clustering

Used PCA scores to segment students into 4 groups.

### 5. Cluster Profiling

Compared average metrics across segments to interpret student types.

---

## Key Findings

### Principal Components

- **PC1: Academic Performance Dimension**  
  Driven by attendance, study hours, internal marks, assignment marks, and final marks.

- **PC2: Wellness Dimension**  
  Influenced mainly by stress levels and sleep patterns.

### Correlation Insights

- Attendance and study hours were positively associated with marks.  
- Higher stress was linked with weaker outcomes.  
- Lower sleep was associated with higher stress.

---

## Student Segments Identified

### 1. High Achievers

- Strong attendance  
- High marks  
- Consistent study habits  

**Action:** Advanced opportunities, mentoring roles.

---

### 2. Burnout Performers

- Good marks  
- High stress  
- Lower sleep levels  

**Action:** Wellness support, workload coaching.

---

### 3. Average Stable Students

- Moderate performance  
- Balanced habits  

**Action:** Skill-building and progression planning.

---

### 4. At-Risk Learners

- Low attendance  
- Lower marks  
- Weak engagement  

**Action:** Early intervention, tutoring, mentoring.

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

## Files Included

- `student_success_analysis.R`
- `student_success_project.csv`
- `README.md`

---

## Future Scope

- Use real institutional data  
- Build predictive dropout models  
- Create Power BI / Tableau dashboards  
- Add longitudinal student tracking  
- Deploy an interactive Shiny dashboard  

---

## Outcome

This project demonstrates an end-to-end analytics workflow covering:

- Data Preparation  
- Statistical Analysis  
- Unsupervised Learning  
- Data Visualization  
- Business Interpretation  
- Strategic Recommendations  

---

## GitHub Profile

**shru-analytics**
