// API 路由示範
// 訪問 http://localhost:3000/api/time

export async function GET() {
    const currentTime = new Date().toLocaleString('zh-TW', {
        timeZone: 'Asia/Taipei',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    });

    return new Response(
        JSON.stringify({
            time: currentTime,
            timestamp: Date.now(),
            message: '這是從 Server API 回傳的即時資料！'
        }),
        {
            status: 200,
            headers: {
                'Content-Type': 'application/json'
            }
        }
    );
}
