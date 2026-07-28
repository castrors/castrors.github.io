# rodrigocastro.dev 🌐

Portfólio e blog profissional desenvolvido com **Jaspr** — o framework web moderno para Dart que permite renderização estática rápida (SSG) com hidratação dinâmica no lado do cliente.

O site possui uma identidade visual retro-brutalista inspirada na paleta de cores clássica do Pico-8, com animações sutis, cursor customizado reativo e um efeito de scanline opcional.

---

## 🚀 Funcionalidades

- **🌐 Suporte Bilíngue (PT / EN):**
  - Sistema de tradução reativo com `InheritedComponent` (`TranslationProvider`).
  - Detecção automática do idioma do navegador na primeira visita.
  - Sincronização em tempo real do idioma na URL (`?lang=en` ou `?lang=pt`) sem recarregamento da página (usando `window.history.replaceState`).
  - Salvamento automático de preferência no `localStorage`.
- **💼 Linha do Tempo Profissional (Journey):**
  - Histórico profissional com marcadores e palavras-chave otimizadas a partir do currículo.
- **🎮 Galeria de Projetos (Apps):**
  - Showcase de aplicativos reais desenvolvidos, incluindo o jogo **The Crossing Puzzle** (construído com Flutter e Flame Engine).
- **🔗 Página de Links Integrada:**
  - Versão customizada inspirada em plataformas de Linktree/Bento com acesso direto às redes sociais e projetos principais.
- **⚡ SEO & Acessibilidade:**
  - Cabeçalhos semânticos estruturados, metadados dinâmicos e favicon customizado usando o avatar do GitHub.
- **📦 CI/CD Automatizado:**
  - Pipeline no GitHub Actions para compilação e deploy automático na branch `gh-pages` com suporte a domínio customizado (`CNAME`).

---

## 📁 Estrutura do Projeto

```text
├── .github/workflows/    # Configuração de CI/CD (Deploy para GitHub Pages)
├── lib/
│   ├── components/       # Componentes globais (Header, Footer, TranslationProvider)
│   ├── constants/        # Tokens de estilo e temas
│   ├── data/             # Dados estáticos (Lista de posts do Blog)
│   ├── models/           # Modelos de dados
│   ├── pages/            # Páginas do site (Home, Apps, Links, Blog, PostDetail)
│   ├── utils/            # Utilitários de compilação condicional para Web/Browser
│   └── app.dart          # Componente raiz cliente (@client)
├── web/                  # Arquivos estáticos compilados (Imagens, CNAME, favicon)
├── pubspec.yaml          # Dependências do projeto Dart/Jaspr
└── README.md             # Documentação do projeto
```

---

## 🛠️ Comandos de Desenvolvimento

### Rodar Localmente
Inicia o servidor de desenvolvimento com suporte a recarga rápida:
```bash
jaspr serve
```
O servidor estará acessível em `http://localhost:8080`.

### Formatar o Código
Padroniza a formatação do código de acordo com o estilo oficial do Dart:
```bash
dart format .
```

### Análise Estática
Verifica a presença de erros de sintaxe, warnings e regras de lint do projeto:
```bash
dart analyze
```

### Gerar Build Estática
Gera a versão estática otimizada do site na pasta `build/jaspr/`:
```bash
jaspr build
```

---

## 📦 Publicação no GitHub Pages

O deploy é feito de forma automatizada via GitHub Actions sempre que novas alterações são enviadas para a branch `main`.

1. O fluxo no GitHub Actions executa o `jaspr build`.
2. O resultado da pasta `build/jaspr` é enviado de forma isolada para a branch `gh-pages`.
3. O domínio `rodrigocastro.dev` é mapeado pelo arquivo `CNAME` localizado na raiz da branch de deploy.
