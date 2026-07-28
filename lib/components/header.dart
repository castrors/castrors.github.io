import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'translation_provider.dart';

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  bool _menuOpen = false;

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    final routes = [
      (label: context.t('nav_journey'), path: '/'),
      (label: context.t('nav_blog'), path: '/blog'),
      (label: context.t('nav_links'), path: '/links'),
      (label: context.t('nav_apps'), path: '/apps'),
    ];

    return nav(
      classes:
          'fixed top-0 w-full z-50 bg-pico-black/95 backdrop-blur-sm border-b-4 border-pico-dark-grey transition-all',
      [
        div(
          classes:
              'flex justify-between items-center px-margin-mobile md:px-margin-desktop max-w-container-max mx-auto h-20',
          [
            Link(
              to: '/',
              classes:
                  'font-headline-md text-[24px] uppercase tracking-widest text-pico-white cursor-pointer header-anchor active:translate-y-0.5 transition-all text-decoration-none',
              child: .text('rodrigocastro.dev'),
            ),
            // Desktop Links
            div(
              classes: 'hidden md:flex items-center gap-unit-8',
              [
                for (var r in routes)
                  Link(
                    to: r.path,
                    classes: activePath == r.path
                        ? '${r.path == '/apps' ? 'text-pico-green border-pico-green' : 'text-pico-blue border-pico-blue'} font-bold border-b-4 pb-1 font-label-md uppercase'
                        : 'text-pico-light-grey hover:text-pico-blue transition-colors font-label-md uppercase glitch-text',
                    child: .text(r.label),
                  ),
              ],
            ),
            // Contact Button & Language Selector (Desktop)
            div(
              classes: 'hidden md:flex items-center gap-unit-4',
              [
                button(
                  classes:
                      'bg-pico-black text-pico-white px-unit-3 py-unit-2 font-label-sm uppercase font-bold border-2 border-pico-white shadow-[4px_4px_0px_#fff] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all cursor-pointer',
                  events: {
                    'click': (_) {
                      context.toggleLocale();
                    },
                  },
                  [.text(context.locale == 'pt' ? '🌐 EN' : '🌐 PT')],
                ),
                a(
                  classes:
                      'inline-block bg-pico-green text-pico-black px-unit-4 py-unit-2 font-label-sm uppercase font-bold border-2 border-pico-black shadow-[4px_4px_0px_#000] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all cursor-pointer text-decoration-none',
                  href: 'mailto:rodrigodesouzacastro@gmail.com',
                  [.text(context.t('nav_contact'))],
                ),
              ],
            ),
            // Mobile Menu Hamburger Button
            button(
              classes: 'md:hidden text-pico-blue focus:outline-none bg-transparent border-none cursor-pointer',
              events: {
                'click': (_) {
                  setState(() {
                    _menuOpen = !_menuOpen;
                  });
                },
              },
              [
                span(
                  classes: 'material-symbols-outlined text-[32px]',
                  [.text(_menuOpen ? 'close' : 'menu')],
                ),
              ],
            ),
          ],
        ),
        // Mobile Menu Dropdown Panel
        if (_menuOpen)
          div(
            classes:
                'md:hidden bg-pico-black border-b-4 border-pico-dark-grey px-margin-mobile py-unit-4 flex flex-col gap-unit-4',
            [
              for (var r in routes)
                div(
                  events: {
                    'click': (_) {
                      setState(() {
                        _menuOpen = false;
                      });
                    },
                  },
                  [
                    Link(
                      to: r.path,
                      classes: activePath == r.path
                          ? '${r.path == '/apps' ? 'text-pico-green' : 'text-pico-blue'} font-bold font-label-md uppercase py-2 block'
                          : 'text-pico-white hover:text-pico-blue font-label-md uppercase py-2 border-b border-pico-dark-grey/20 block',
                      child: .text(r.label),
                    ),
                  ],
                ),
              button(
                classes:
                    'w-full text-center bg-pico-black text-pico-white py-unit-2 font-label-sm uppercase font-bold border-2 border-pico-white shadow-[4px_4px_0px_#fff] active:translate-y-px cursor-pointer',
                events: {
                  'click': (_) {
                    context.toggleLocale();
                  },
                },
                [.text(context.locale == 'pt' ? '🌐 ENGLISH' : '🌐 PORTUGUÊS')],
              ),
              a(
                classes:
                    'w-full text-center inline-block bg-pico-green text-pico-black py-unit-2 font-label-sm uppercase font-bold border-2 border-pico-black shadow-[4px_4px_0px_#000] active:translate-y-px text-decoration-none box-border',
                href: 'mailto:rodrigodesouzacastro@gmail.com',
                [.text(context.t('nav_contact'))],
              ),
            ],
          ),
      ],
    );
  }
}
