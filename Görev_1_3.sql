----Cevap 3:Haftalık en yüksek toplam value------
select 
     date_trunc('week',ad_date) as week,
     campaign,
     sum(value) as total_value
from (
     select ad_date,campaign_id as campaign, value 
     from public.facebook_ads_basic_daily
     where value IS NOT NULL
     union all
     
     select ad_date,campaign_name as campaign,value 
     from public.google_ads_basic_daily
     where value IS NOT NULL
     )
     facebook_google_union
group by week, campaign
order by total_value desc
limit 100;


select*
from google_ads_basic_daily
limit 100



select *
from facebook_ads_basic_daily


