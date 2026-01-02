SELECT ROUND(SUM(tiv_2016),2) tiv_2016
FROM(
    SELECT tiv_2016,
            COUNT(*) OVER (PARTITION BY tiv_2015) cnt_tiv_2015,
            COUNT(*) OVER (PARTITION BY lat, lon) cnt_lat_lon
    FROM Insurance
) t
WHERE cnt_tiv_2015 > 1 AND cnt_lat_lon = 1;