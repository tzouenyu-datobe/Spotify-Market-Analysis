CREATE TABLE spotify_charts (
    title TEXT,
    rank INT,
    date DATE,
    artist TEXT,
    url TEXT,
    region VARCHAR(50),
    chart VARCHAR(50),
    trend VARCHAR(50),
    streams BIGINT
);
COPY spotify_charts (title, rank, date, artist, url, region, chart, trend, streams)
FROM 'C:\charts.csv' 
WITH (
    FORMAT CSV, 
    HEADER true, 
    DELIMITER ',', 
    QUOTE '"', 
    ESCAPE '"', 
    NULL ''
);
SELECT COUNT(*) FROM spotify_charts;

-- 1. 針對歌名建立索引（這 2,600 萬列大約需要 30~60 秒，請耐心等待它跑完）
CREATE INDEX idx_spotify_title ON spotify_charts(title);

-- 2. 針對地區建立索引
CREATE INDEX idx_spotify_region ON spotify_charts(region);