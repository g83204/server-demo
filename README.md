# 🚀 Server 模式示範專案

這是一個最簡單的 Astro Server 模式示範，展示與 Static 模式的核心差異。

## 🎯 展示功能

### 1. **伺服器端渲染（SSR）**
- 每次訪問頁面都會在伺服器端重新生成
- 顯示**即時的伺服器時間**
- 每次重新整理都會看到不同的時間

### 2. **動態內容**
- 訪客計數器（模擬）
- 顯示訪客 IP 位址
- 顯示瀏覽器資訊

### 3. **API 路由**
- `/api/time` - 回傳 JSON 格式的即時時間
- 展示如何建立 API 端點

## 📦 安裝與運行

### 步驟 1：安裝依賴
```bash
cd server-demo
npm install
```

### 步驟 2：啟動開發伺服器
```bash
npm run dev
```

### 步驟 3：訪問網站
開啟瀏覽器訪問：http://localhost:3000

## 🔍 關鍵差異觀察

### Static 模式 vs Server 模式

| 特性 | Static 模式 | Server 模式（本專案）|
|------|------------|-------------------|
| **時間顯示** | 固定在建置時 | 每次訪問都更新 |
| **訪客資訊** | 無法取得 | 可以取得 IP、瀏覽器 |
| **API 路由** | 不支援 | 支援 ✅ |
| **個人化內容** | 不支援 | 支援 ✅ |

## 🧪 測試方法

### 測試 1：觀察時間變化
1. 訪問 http://localhost:3000
2. 記下顯示的時間
3. 等待幾秒後重新整理
4. **時間會更新！**（Static 模式不會）

### 測試 2：測試 API 路由
1. 點擊「測試 API 路由」按鈕
2. 會彈出 alert 顯示 API 回傳的資料
3. 或直接訪問：http://localhost:3000/api/time

### 測試 3：查看原始碼
1. 在瀏覽器按 `Ctrl + U` 查看原始碼
2. 會看到時間已經在 HTML 中（伺服器端渲染）
3. Static 模式則是在 JavaScript 中動態插入

## 📁 專案結構

```
server-demo/
├── package.json          # 依賴配置
├── astro.config.mjs      # Server 模式配置
├── src/
│   └── pages/
│       ├── index.astro   # 動態首頁
│       └── api/
│           └── time.js   # API 路由
└── README.md
```

## 💡 核心程式碼解析

### astro.config.mjs
```javascript
export default defineConfig({
  output: 'server',  // ← 關鍵：啟用 Server 模式
  adapter: node({
    mode: 'standalone'
  })
});
```

### index.astro（伺服器端程式碼）
```astro
---
// 這段程式碼在伺服器端執行
const currentTime = new Date().toLocaleString();
const ip = Astro.clientAddress;  // 取得訪客 IP
---

<h1>{currentTime}</h1>  <!-- 伺服器端渲染 -->
```

### API 路由（/api/time.js）
```javascript
export async function GET() {
  return new Response(
    JSON.stringify({ time: new Date() }),
    { headers: { 'Content-Type': 'application/json' } }
  );
}
```

## 🎓 學習重點

### 1. **什麼時候用 Server 模式？**
- ✅ 需要即時資料
- ✅ 需要個人化內容
- ✅ 需要 API 路由
- ✅ 需要保護敏感資訊

### 2. **什麼時候用 Static 模式？**
- ✅ 內容固定
- ✅ 所有人看到一樣
- ✅ 追求最快速度
- ✅ 最簡單部署

## 🚀 部署

Server 模式需要 Node.js 環境：
- **Vercel**：支援（使用 Serverless Functions）
- **Netlify**：支援（使用 Edge Functions）
- **自己的 VPS**：支援（運行 Node.js）

## ⚠️ 注意事項

1. **Server 模式需要伺服器**
   - 不能部署到純靜態主機（如 GitHub Pages）
   - 需要支援 Node.js 的平台

2. **成本較高**
   - Static：幾乎免費
   - Server：按請求數計費

3. **速度較慢**
   - Static：毫秒級
   - Server：需要伺服器處理時間

## 🎉 總結

這個示範展示了 Server 模式的核心能力：
- ✅ 動態生成內容
- ✅ 即時資料
- ✅ API 路由
- ✅ 訪客資訊

**記住：只有在真正需要這些功能時才使用 Server 模式！**

大多數網站用 Static 模式就夠了！
