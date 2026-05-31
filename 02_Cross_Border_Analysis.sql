WITH top_10_songs AS (
    -- 步驟 1：重新抓回那 10 首橫掃最多國家的神曲清單
    SELECT title, artist
    FROM spotify_charts
    WHERE rank = 1 AND region != 'Global'
    GROUP BY title, artist
    ORDER BY COUNT(DISTINCT region) DESC
    LIMIT 10
),
global_first_gold AS (
    -- 步驟 2：計算這 10 首歌「在全球各自最早」拿到冠軍的日期
    SELECT c.title, c.artist, MIN(c.date) AS global_start_date
    FROM spotify_charts c
    JOIN top_10_songs t ON c.title = t.title AND c.artist = t.artist
    WHERE c.rank = 1 AND c.region != 'Global'
    GROUP BY c.title, c.artist
),
country_stats AS (
    -- 步驟 3：計算這 10 首歌在 英/美/台 三個核心國家的進榜與霸榜數據
    SELECT 
        c.title, 
        c.artist, 
        c.region,
        MIN(c.date) AS country_first_date,
        MAX(c.date) AS country_last_date,
        COUNT(*) AS actual_gold_count
    FROM spotify_charts c
    JOIN top_10_songs t ON c.title = t.title AND c.artist = t.artist
    WHERE c.rank = 1 AND c.region IN ('Taiwan', 'United States', 'United Kingdom')
    GROUP BY c.title, c.artist, c.region
)
-- 步驟 4：大聯結！一口氣算出時差（days_lag）與生命週期（total_reign_days）
SELECT 
    cs.title,
    cs.artist,
    cs.region,
    (cs.country_first_date - gfg.global_start_date) AS days_lag,
    (cs.country_last_date - cs.country_first_date) AS total_reign_days,
    cs.actual_gold_count
FROM country_stats cs
JOIN global_first_gold gfg ON cs.title = gfg.title AND cs.artist = gfg.artist
ORDER BY cs.title, cs.region;