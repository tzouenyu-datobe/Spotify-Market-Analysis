# Spotify-Market-Analysis
# 🎵 Spotify Market Diffusion & User Behavior Analysis

## 📌 Project Overview
> **⚠️ 專案說明：這是一個資料分析的練習專案。為了快速驗證假說，本次分析僅針對「全球排名前 10 名」的指標性代表歌曲進行抽樣與深度探討。**
傳統觀念認為，歐美流行文化傳遞到亞洲市場需要數週的發酵期。本專案透過分析 2,600 萬筆 Spotify 歷史榜單數據，探索全球音樂的「跨國擴散時差 (Days Lag)」，並對比不同國家聽眾的「榜單生命週期」，藉此拆解背後的消費者行為差異。

## 📊 Data Scale & Tools
* **Dataset**: Spotify Daily Top 200 Charts (2017-2021)
* **Data Size**: 3.48 GB (Over 26,200,000 rows)
* **Tools Used**: 
  * **PostgreSQL**: Used for Data Engineering, large-scale CSV import (`COPY`), Indexing, and advanced querying (CTE, Window Functions).
  * **Python (Pandas, Seaborn)**: Used for Data Visualization.

## 💡 Key Insights
1. **主流文化的「零時差」擴散**：在頂級流行樂 (Pop) 與短影音迷因趨勢上，台灣聽眾的敏銳度與英美市場完全同步 (Days Lag = 0)。
2. **特定曲風的文化發酵期**：對於拉丁等非主流亞洲曲風，台灣市場存在長達 3~4 週的擴散滯後。行銷資源應避免於發行首日 (Day 0) 盲目投放。
3. **殭屍逆襲現象 (長尾清單依賴)**：對比英美市場「短期高密度霸榜」的快節奏消費，台灣聽眾展現出極長的榜單生命週期（總跨度可達 160 天以上）。這印證了台灣市場高度依賴「情境歌單 (Playlist-driven)」的被動收聽行為。

## 📂 Repository Structure
* `01_Data_Pipeline.sql`: DDL setup and high-speed data import for 3.48 GB CSV.
* `02_Cross_Border_Analysis.sql`: Using CTEs and Window Functions to calculate regional time lag.
* `03_Data_Visualization.py`: Generating comparative bar charts and lifespan overlapping graphs.
