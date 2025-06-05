self.addEventListener('install', function(event) {
  console.log('[ServiceWorker] Installed');
});

self.addEventListener('activate', function(event) {
  console.log('[ServiceWorker] Activated');
});

self.addEventListener('fetch', function(event) {
  // デフォルトは何もキャッシュせずネットから取得
  return;
});
