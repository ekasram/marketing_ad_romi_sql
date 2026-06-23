------Cevap 2: ROMİ-------

select 
   ad_date,
   SUM(value)/SUM(spend) as romi
from (
    select ad_date,spend,value
    from public.facebook_ads_basic_daily
    
    union all
    
    select ad_date,spend,value
    from public.google_ads_basic_daily)
    facebook_google_union
where spend > 0
group by ad_date 
order by romi desc
limit 5;

