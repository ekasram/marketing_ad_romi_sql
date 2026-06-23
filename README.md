# Marketing Spend & ROMI Analysis (Facebook Ads & Google Ads, PostgreSQL)

SQL-based analysis of daily advertising performance across Facebook Ads and Google Ads, built as part of my Data Analytics training at GOIT Academy.

## 🎯 Project Goal
Identify which platforms, campaigns, and time periods delivered the strongest return on marketing investment (ROMI), using only SQL against raw ad-platform tables.

## 💡 Core Idea
Spend data lived in two separate tables with slightly different schemas (Facebook Ads vs. Google Ads). The core idea was to unify both sources into one comparable dataset using `UNION ALL`, then layer on time-based aggregation (daily/weekly/monthly) and ROI logic to surface where ad budget was working hardest.

## 🛠️ What's Inside

| File | Task | Description |
|---|---|---|
| `Görev_1_1.sql` | Daily spend stats | MIN / MAX / AVG daily ad spend per platform |
| `Görev_1_2.sql` | ROMI | Calculates `value/spend` and ranks the top 5 highest-ROI days |
| `Görev_1_3.sql` | Weekly value | Highest total campaign value by week |
| `Görev_1_4.sql` | Reach growth | Campaign with the largest month-over-month reach increase (`LAG()`) |
| `Görev_1_5.sql` | Campaign duration | Continuous active periods per ad set, using a gaps-and-islands SQL pattern |

## ⚙️ Tools & Technologies
- PostgreSQL
- CTEs (`WITH` clauses)
- Window functions (`ROW_NUMBER`, `LAG`)
- `UNION ALL` for multi-source data
- `date_trunc()` time-bucketing
- Gaps-and-islands pattern for continuous date ranges

## 📊 Results & Visuals
Query result tables, screenshots, and charts: [Google Drive folder link]

## 🔗 Related
Part of a two-project GOIT Academy Data Analytics series. See also the companion project: **E-commerce Funnel & Engagement Analysis (GA4, BigQuery)** — [repo link]
