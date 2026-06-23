------Görev_1_4 Aylık bazda en büyük erişim artışı yaşayan kampanya------
with monthly_data as (

  select 
    date_trunc('month',ad_date) as month,
    campaign,
    SUM(reach) as total_reach
    from (
         select ad_date, campaign_id:: text as campaign, reach
         from public.facebook_ads_basic_daily
         where reach is not null
         
         union all
         
         select ad_date, campaign_name::text as campaign, reach
         from public.google_ads_basic_daily
         where reach is not null
         )
         t
    group by campaign, month
),

growth_monthly as(
     select 
         month, campaign, total_reach,
         lag(total_reach) over (partition by campaign
         order by month) as prev_reach
     from monthly_data)
     
 select 
     month,campaign,total_reach, total_reach-prev_reach as growth
 from growth_monthly
 where prev_reach is not null
 order by growth desc 
 limit 1;
     
