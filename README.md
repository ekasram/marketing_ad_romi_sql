**Project: Marketing Spend & ROI Analysis Across Facebook Ads & Google Ads (SQL/PostgreSQL)**

**Goal**
As part of my Data Analytics training at GOIT Academy, I analyzed daily advertising performance from Facebook Ads and Google Ads to identify which platforms, campaigns, and time periods delivered the strongest return on marketing investment (ROMI).

**Core idea**
Spend data lived in two separate tables with slightly different schemas. The core idea was to unify both sources into one comparable dataset, then layer on time-based aggregation (daily/weekly/monthly) and ROI logic to surface where ad budget was working hardest.

**What I did**
- Combined daily spend from both platforms with `UNION ALL` and calculated MIN / MAX / AVG daily spend per platform
- Calculated ROMI (`value / spend`) and ranked the top 5 highest-ROI days
- Aggregated weekly campaign value to find the best-performing weeks and campaigns
- Used a `LAG()` window function to calculate month-over-month reach growth per campaign and find the campaign with the largest increase
- Applied a "gaps-and-islands" SQL pattern to detect continuous active periods per ad set and ranked them by duration
