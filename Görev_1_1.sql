
------Cevap 1:AVG, MAX, MIN-----
WITH daily_totals AS (
select 
     ad_date,
     'facebook' as platform,
     SUM(spend) as daily_spend
from public.facebook_ads_basic_daily
group by ad_date

union all

select
     ad_date,
     'google' as platform,
     SUM(spend) as daily_spend
from public.google_ads_basic_daily
group by ad_date
)

select 
     platform,
     MIN(daily_spend) as min_spend,
     MAX(daily_spend) as max_spend,
     AVG(daily_spend) as avg_spend
     
from daily_totals
group by platform;
     
     


