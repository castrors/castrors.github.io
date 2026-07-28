/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(
    Document(
      title: 'Rodrigo Castro',
      head: [
        link(
          rel: 'icon',
          type: 'image/png',
          href: '/images/profile.png',
        ),
        link(
          href:
              'https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@600;700&family=JetBrains+Mono:wght@400;500;700&family=Hanken+Grotesk:wght@400;600&display=swap',
          rel: 'stylesheet',
        ),
        link(
          href:
              'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap',
          rel: 'stylesheet',
        ),
        script(src: 'https://cdn.tailwindcss.com?plugins=forms,container-queries'),
        script(
          content: '''
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              "colors": {
                "error-container": "#93000a",
                "inverse-surface": "#dbe1ff",
                "on-error-container": "#ffdad6",
                "on-surface": "#dbe1ff",
                "surface-container": "#1D2B53",
                "background": "#011038",
                "on-primary-fixed-variant": "#004b74",
                "tertiary": "#dac900",
                "pico-brown": "#AB5236",
                "pico-black": "#000000",
                "pico-yellow": "#FFEC27",
                "on-secondary": "#68001a",
                "surface-variant": "#25335b",
                "surface-dim": "#011038",
                "outline": "#5F574F",
                "pico-red": "#FF004D",
                "on-secondary-fixed": "#40000c",
                "primary-fixed-dim": "#93ccff",
                "outline-variant": "#3f4851",
                "primary": "#29ADFF",
                "pico-light-grey": "#C2C3C7",
                "on-primary-container": "#003e61",
                "secondary-fixed": "#ffdada",
                "on-primary": "#003351",
                "on-tertiary-fixed-variant": "#4e4800",
                "inverse-primary": "#006398",
                "on-secondary-fixed-variant": "#920028",
                "tertiary-fixed": "#f8e51d",
                "error": "#ffb4ab",
                "surface-container-lowest": "#000b2e",
                "primary-fixed": "#cde5ff",
                "secondary": "#FFA300",
                "pico-peach": "#FFCCAA",
                "pico-green": "#00E436",
                "primary-container": "#29adff",
                "pico-blue": "#29ADFF",
                "on-tertiary-fixed": "#1f1c00",
                "surface-tint": "#29ADFF",
                "on-error": "#690005",
                "secondary-fixed-dim": "#ffb3b6",
                "pico-orange": "#FFA300",
                "pico-pink": "#FF77A8",
                "secondary-container": "#ff5168",
                "surface-container-highest": "#25335b",
                "pico-dark-green": "#008751",
                "tertiary-fixed-dim": "#dac900",
                "pico-dark-blue": "#1D2B53",
                "surface-container-low": "#091941",
                "pico-dark-purple": "#7E2553",
                "pico-dark-grey": "#5F574F",
                "on-tertiary": "#363100",
                "on-background": "#dbe1ff",
                "on-tertiary-container": "#413b00",
                "on-surface-variant": "#83769C",
                "surface-bright": "#2a3760",
                "surface-container-high": "#1a2850",
                "inverse-on-surface": "#212e57",
                "pico-indigo": "#83769C",
                "on-primary-fixed": "#001d31",
                "tertiary-container": "#b5a700",
                "pico-white": "#FFF1E8",
                "surface": "#011038",
                "on-secondary-container": "#5b0015"
              },
              "borderRadius": {
                "DEFAULT": "0px",
                "lg": "4px",
                "xl": "8px",
                "full": "9999px"
              },
              "spacing": {
                "unit-4": "16px",
                "margin-desktop": "64px",
                "unit-2": "8px",
                "margin-mobile": "16px",
                "unit-12": "48px",
                "unit-1": "4px",
                "base": "4px",
                "unit-8": "32px",
                "gutter": "24px",
                "container-max": "1120px"
              },
              "fontFamily": {
                "headline-md": ["Space Grotesk"],
                "label-sm": ["JetBrains Mono"],
                "body-md": ["Hanken Grotesk"],
                "label-md": ["JetBrains Mono"],
                "body-lg": ["Hanken Grotesk"],
                "headline-lg": ["Space Grotesk"],
                "headline-lg-mobile": ["Space Grotesk"],
                "headline-sm": ["Space Grotesk"]
              }
            }
          }
        };
      ''',
        ),
      ],
      styles: [
        css('html, body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: .zero,
          margin: .zero,
          fontFamily: const .list([FontFamily('Hanken Grotesk'), FontFamilies.sansSerif]),
        ),
        css('body').styles(
          color: Color('#FFF1E8'),
          backgroundColor: Color('#000000'),
        ),
        css('::-webkit-scrollbar').styles(raw: {'width': '8px'}),
        css('::-webkit-scrollbar-track').styles(raw: {'background': '#011038'}),
        css('::-webkit-scrollbar-thumb').styles(raw: {'background': '#5F574F', 'border': '2px solid #011038'}),
        css('::-webkit-scrollbar-thumb:hover').styles(raw: {'background': '#29ADFF'}),
        css('.pico-border').styles(
          raw: {
            'border': '2px solid #5F574F',
            'box-shadow': '4px 4px 0px #000000',
          },
        ),
        css('.pico-border-hover:hover').styles(
          raw: {
            'border-color': '#29ADFF',
            'box-shadow': '4px 4px 0px #1D2B53',
          },
        ),
        css('.no-scrollbar').styles(
          raw: {
            '-ms-overflow-style': 'none',
            'scrollbar-width': 'none',
          },
        ),
        css('.no-scrollbar::-webkit-scrollbar').styles(
          raw: {
            'display': 'none',
          },
        ),
        css('.glass-card').styles(
          raw: {
            'background': '#1D2B53',
            'border': '2px solid #5F574F',
            'transition': 'all 0.2s steps(4)',
          },
        ),
        css('.glass-card:hover').styles(
          raw: {
            'transform': 'translate(-2px, -2px)',
            'box-shadow': '4px 4px 0px #000000',
          },
        ),
        css('.card-pink:hover').styles(raw: {'border-color': '#FF77A8'}),
        css('.card-blue:hover').styles(raw: {'border-color': '#29ADFF'}),
        css('.card-green:hover').styles(raw: {'border-color': '#00E436'}),
        css('.card-yellow:hover').styles(raw: {'border-color': '#FFEC27'}),
        css('.card-orange:hover').styles(raw: {'border-color': '#FFA300'}),
        css('.pico-card').styles(
          raw: {
            'background-color': '#1D2B53',
            'border': '4px solid #83769C',
            'box-shadow': '6px 6px 0px #000000',
            'transition': 'all 0.1s steps(2)',
          },
        ),
        css('.pico-card:hover').styles(
          raw: {
            'transform': 'translate(-2px, -2px)',
            'box-shadow': '8px 8px 0px #29ADFF',
            'border-color': '#29ADFF',
          },
        ),
        css('.pico-btn-primary').styles(
          raw: {
            'background-color': '#00E436',
            'color': '#000000',
            'box-shadow': '4px 4px 0px #008751',
            'border': 'none',
          },
        ),
        css('.pico-btn-primary:active').styles(
          raw: {
            'transform': 'translate(2px, 2px)',
            'box-shadow': '0px 0px 0px #008751',
          },
        ),
        css('.pico-btn-secondary').styles(
          raw: {
            'background-color': '#29ADFF',
            'color': '#000000',
            'box-shadow': '4px 4px 0px #1D2B53',
            'border': 'none',
          },
        ),
        css('.pico-btn-secondary:active').styles(
          raw: {
            'transform': 'translate(2px, 2px)',
            'box-shadow': '0px 0px 0px #1D2B53',
          },
        ),
        css('.scanline').styles(
          raw: {
            'position': 'fixed',
            'top': '0',
            'left': '0',
            'width': '100%',
            'height': '100%',
            'background':
                'linear-gradient(to bottom, rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.1) 50%), linear-gradient(to right, rgba(255, 0, 0, 0.03), rgba(0, 255, 0, 0.01), rgba(0, 0, 255, 0.03))',
            'background-size': '100% 4px, 3px 100%',
            'pointer-events': 'none',
            'z-index': '100',
          },
        ),
        css('.header-anchor').styles(
          raw: {
            'letter-spacing': '-0.05em',
            'text-shadow': '4px 4px 0px #AB5236',
          },
        ),
        css('.glitch-text:hover').styles(
          raw: {
            'color': '#FF004D',
            'text-shadow': '2px 2px 0px #29ADFF',
          },
        ),
        css('.custom-cursor').styles(
          raw: {
            'width': '16px',
            'height': '16px',
            'border': '2px solid #FFEC27',
            'position': 'fixed',
            'pointer-events': 'none',
            'z-index': '9999',
            'transition': 'transform 0.05s linear',
            'image-rendering': 'pixelated',
          },
        ),
        css('.timeline-line').styles(
          raw: {
            'background': 'linear-gradient(to bottom, transparent, #FF004D 10%, #FF004D 90%, transparent)',
          },
        ),
      ],
      body: App(),
    ),
  );
}
