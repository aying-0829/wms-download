// 运行时配置（外置，Electron 首启配置页会覆盖本文件 + 写 userData/config.json 双保险）
// apiBase 两种形态：
//   - 浏览器/代理：'/api/v1'
//   - Electron 直连：'http://192.168.1.10:8000/api/v1'
window.__WMS_CONFIG__ = window.__WMS_CONFIG__ || {
  apiBase: '/api/v1'
}
