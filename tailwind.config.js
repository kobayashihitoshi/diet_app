// tailwind.config.js
module.exports = {
  // Tailwind CSSがクラスをスキャンするファイルを指定します。
  // ここにアプリケーションのビューファイルやJavaScriptファイルのパスを含めることが重要です。
  content: [
    './app/views/**/*.html.erb', // RailsのERBテンプレート
    './app/helpers/**/*.rb',     // ヘルパーファイル（必要であれば）
    './app/javascript/**/*.js',  // JavaScriptファイル（React/Vueコンポーネントなど）
    './app/javascript/**/*.jsx', // React JSXファイル
    './app/javascript/**/*.ts',  // TypeScriptファイル
    './app/javascript/**/*.tsx', // TypeScript JSXファイル
    './app/components/**/*.rb',  // ViewComponentなどを使用している場合
    './app/components/**/*.html.erb',
  ],
  theme: {
    extend: {
      // ここにカスタムカラー、フォント、ブレークポイントなどを追加できます
    },
  },
  plugins: [
    // ここにTailwind CSSのプラグインを追加できます
  ],
}