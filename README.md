# Github-Project
I made a github project analyzing data taken in 2018 and 2019 with different indicators listed in the data itself.

# 🌍 World Happiness Report Analysis (2018–2019)

A SQL-driven exploratory data analysis (EDA) examining global happiness drivers, year-over-year changes, and key socioeconomic factors across 2018 and 2019 using the World Happiness Report datasets.

---

## 📌 Project Overview

This project analyzes the underlying determinants of nation-level happiness, comparing dataset metrics between **2018** and **2019**. The analysis evaluates how GDP per capita, social support, healthy life expectancy, freedom to make life choices, generosity, and corruption perceptions correlate with national happiness rankings.

Key deliverables include:
- **Year-over-Year Growth View:** A reusable SQL View calculating deltas for ranks, happiness scores, and contributing factors.
- **Economic & Social Factor Segmentation:** Categorization and ranking analysis across high-GDP countries, health expectancy tiers, and generosity levels.

---

## 📂 Database Schema & Datasets

The analysis assumes a database named `Database_Proyek_1` containing two core tables:
- `happy2018`: World Happiness Report metrics for 2018
- `happy2019`: World Happiness Report metrics for 2019

### Key Columns
| Column Name | Description |
| :--- | :--- |
| `Country_or_region` | Country name |
| `Overall_rank` | Global happiness rank (lower is happier) |
| `Score` | Overall happiness score (0.0 to 10.0 scale) |
| `GDP_per_capita` | Economic performance contribution metric |
| `Social_support` | Social foundation/support network score |
| `Healthy_life_expectancy` | Health & life expectation metric |
| `Freedom_to_make_life_choices` | Autonomy and life choice freedom metric |
| `Generosity` | Charitable giving and community generosity metric |
| `Perceptions_of_corruption` | Public perception of institutional corruption |

---
