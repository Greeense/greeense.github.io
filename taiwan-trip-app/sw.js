// 대만여행 앱 창고지기: 앱 파일을 폰에 저장해 두고 인터넷 없이도 열리게 함
const VERSION = "tw-trip-v4";           // 파일을 고치면 이 숫자를 v2, v3…로 올려 주세요
const APP = ["./", "./index.html", "./manifest.json",
  "./icons/icon-192.png", "./icons/icon-512.png", "./icons/maskable-512.png", "./icons/apple-touch-icon.png"];

self.addEventListener("install", e => {
  e.waitUntil(caches.open(VERSION).then(c => c.addAll(APP)).then(() => self.skipWaiting()));
});
self.addEventListener("activate", e => {
  e.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(k => k !== VERSION).map(k => caches.delete(k))))
    .then(() => self.clients.claim()));
});
self.addEventListener("fetch", e => {
  const req = e.request;
  if (req.method !== "GET") return;
  const url = new URL(req.url);
  // 날씨·주소 서비스는 항상 인터넷으로 (저장 안 함)
  if (url.hostname.includes("open-meteo") || url.hostname.includes("bigdatacloud")) return;
  // 글씨체: 한 번 받으면 저장해 두고 씀
  if (url.hostname.includes("fonts.googleapis.com") || url.hostname.includes("fonts.gstatic.com")) {
    e.respondWith(caches.open(VERSION).then(async c => {
      const hit = await c.match(req); if (hit) return hit;
      try { const res = await fetch(req); c.put(req, res.clone()); return res; } catch (err) { return Response.error(); }
    }));
    return;
  }
  if (url.origin !== location.origin) return;
  // 앱 파일: 인터넷 되면 최신으로, 안 되면 저장해 둔 것으로
  e.respondWith(fetch(req).then(res => {
    const copy = res.clone(); caches.open(VERSION).then(c => c.put(req, copy)); return res;
  }).catch(() => caches.match(req).then(r => r || caches.match("./index.html"))));
});
