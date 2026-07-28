# rodrigocastro.dev 🌐

Professional portfolio and blog built with **Jaspr** — the modern web framework for Dart that enables fast static site generation (SSG) with dynamic client-side hydration.

The website features a retro-brutalist visual identity inspired by the classic Pico-8 color palette, with subtle animations, a reactive custom cursor, and an optional scanline overlay effect.

---

## 🚀 Features

- **🌐 Bilingual Support (PT / EN):**
  - Reactive translation system using an `InheritedComponent` (`TranslationProvider`).
  - Automatic browser language preference detection on first visit.
  - Real-time language sync with the URL (`?lang=en` or `?lang=pt`) without page reloads (using `window.history.replaceState`).
  - Automatic language preference saving in `localStorage`.
- **💼 Professional Timeline (Journey):**
  - Career history with bullet highlights and optimized keywords imported from the CV.
- **🎮 Project Showcase (Apps):**
  - Showcase of real-world applications, including the game **The Crossing Puzzle** (built with Flutter and Flame Engine).
- **🔗 Integrated Links Page:**
  - A custom page inspired by Linktree/Bento setups with direct access to social networks and main projects.
- **⚡ SEO & Accessibility:**
  - Semantic HTML5 header structures, dynamic metadata tags, and a custom favicon using the GitHub profile avatar.
- **📦 Automated CI/CD:**
  - GitHub Actions pipeline to automatically build and deploy the app to the `gh-pages` branch, with support for a custom domain (`CNAME`).

---

## 📁 Project Structure

```text
├── .github/workflows/    # CI/CD configuration (GitHub Pages Deployment)
├── lib/
│   ├── components/       # Global components (Header, Footer, TranslationProvider)
│   ├── constants/        # Styling tokens and themes
│   ├── data/             # Static data (Blog posts list)
│   ├── models/           # Data models
│   ├── pages/            # App pages (Home, Apps, Links, Blog, PostDetail)
│   ├── utils/            # Multiplatform conditional imports for safe Web/Browser execution
│   └── app.dart          # Client root component (@client)
├── web/                  # Static assets (images, CNAME, favicon)
├── pubspec.yaml          # Project dependencies (Dart/Jaspr configuration)
└── README.md             # Project documentation
```

---

## 🛠️ Development Commands

### Run Locally
Starts the development server with hot reload support:
```bash
jaspr serve
```
The server will be available on `http://localhost:8080`.

### Format Code
Formats all Dart files according to the official style guide guidelines:
```bash
dart format .
```

### Static Analysis
Runs code analysis for syntax errors, warnings, and custom project lint rules:
```bash
dart analyze
```

### Generate Static Build
Compiles the application to optimized static HTML/JS files inside the `build/jaspr/` directory:
```bash
jaspr build
```

---

## 📦 GitHub Pages Deployment

Deployments are automated via GitHub Actions on every push to the `main` branch.

1. The GitHub Actions workflow executes `jaspr build`.
2. The static files in `build/jaspr` are pushed in isolation to the `gh-pages` branch.
3. The custom domain `rodrigocastro.dev` is automatically mapped by the `CNAME` file located in the root of the deployment branch.
