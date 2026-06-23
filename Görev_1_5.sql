select *
from public.facebook_ads_basic_daily
limit 1;

select *
from public.google_ads_basic_daily
limit 1;

with facebook_google_data as(

    select f.ad_date, a.adset_name as adset_name
    from public.facebook_ads_basic_daily f
    inner join public.facebook_adset a on f.adset_id= a. adset_id
    where a.adset_name is not null
    
    union all
    
    select ad_date, adset_name
    from public.google_ads_basic_daily
    where adset_name is not null),
    
distinct_active as (
    select distinct adset_name, ad_date
    from facebook_google_data),

numbered as(
    select adset_name, ad_date,
    row_number() over (partition by adset_name order by ad_date) as rn
    from distinct_active),

grouped as(
    select adset_name, ad_date, ad_date - rn::int as grp
    from numbered),
    
timing as (
    select 
       adset_name,
       min(ad_date) as start_date,
       max(ad_date) as end_date,
       count(*) as duration
    from grouped
    group by adset_name, grp)
    
select 
    adset_name,
    start_date,
    end_date,
    duration
from timing
order by duration desc
limit 50;
    

