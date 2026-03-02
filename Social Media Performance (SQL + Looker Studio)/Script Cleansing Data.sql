-- Memisahkan post_datetime menjadi kolom tanggal dan kolom waktu
SELECT *,
SUBSTRING(post_datetime ,1,10) as post_date,
SUBSTRING(post_datetime,12,2) as post_hour
FROM social_media_performance 

-- Mengecek apakah terdapat data duplikat?
SELECT
    post_id,
    platform,
    content_type,
    topic,
    language,
    region,
    post_datetime,
    sentiment_score, 
    views,
    likes,
    comments,
    shares,
    engagement_rate,
    is_viral,
    COUNT(*) AS total
FROM social_media_performance
GROUP BY
    post_id,
    platform,
    content_type,
    topic,
    language,
    region,
    post_datetime,
    sentiment_score,
    views,
    likes,
    comments,
    shares,
    engagement_rate ,
    is_viral
HAVING COUNT(*) > 1;

-- Mengecek apakah terdapat data kosong?
SELECT *
FROM social_media_performance 
WHERE post_id IS NULL
OR platform IS NULL
OR content_type IS NULL
OR topic IS NULL
OR language IS NULL
OR region IS NULL
OR post_datetime IS NULL
OR hashtags IS NULL
OR sentiment_score IS NULL
OR views IS NULL
OR likes IS NULL
OR comments IS NULL
OR shares IS NULL
OR engagement_rate IS NULL
OR is_viral IS NULL

-- Mengecek data unik setiap kolom, apakah ada yang perlu diubah/diperbaiki?
select DISTINCT topic
from social_media_performance 

-- Mengganti nilai kolom is_viral dari 1 dan 0 menjadi Yes dan No
SELECT *,
    CASE 
        WHEN is_viral  = '1' THEN 'Yes'
        WHEN is_viral  = '0' THEN 'No'
        ELSE NULL
    END AS viral
FROM social_media_performance 

-- Pengambilan data akhir
SELECT post_id, platform, content_type,topic,language,region, 
SUBSTRING(post_datetime ,1,10) as post_date,
SUBSTRING(post_datetime,12,2) as post_hour,
sentiment_score,views,likes,comments,shares,engagement_rate, 
CASE 
        WHEN is_viral  = '1' THEN 'Yes'
        WHEN is_viral  = '0' THEN 'No'
        ELSE NULL
    END AS viral
from social_media_performance 
