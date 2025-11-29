import { defineConfig } from 'astro/config';
import node from '@astrojs/node';

// Server 模式配置
export default defineConfig({
    output: 'server',  // 關鍵：使用 server 模式
    adapter: node({
        mode: 'standalone'
    }),
    server: {
        port: 3000
    }
});
