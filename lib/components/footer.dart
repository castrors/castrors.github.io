import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(
      classes: 'w-full py-unit-12 bg-pico-black border-t-4 border-pico-dark-grey mt-auto',
      [
        div(
          classes:
              'flex flex-col md:flex-row justify-between items-center gap-unit-8 max-w-container-max mx-auto px-margin-mobile',
          [
            div(
              classes:
                  'font-label-sm text-pico-blue uppercase tracking-widest bg-pico-dark-blue/50 px-3 py-1.5 border border-pico-blue',
              [.text('Rodrigo Castro // SYS_VER_1.0')],
            ),
            p(
              classes: 'font-label-sm text-pico-light-grey uppercase text-center md:text-left',
              [.text('© 2026 FLUTTER_RUN: SUCCESS.')],
            ),
            div(
              classes: 'flex gap-unit-8',
              [
                a(
                  classes:
                      'text-pico-light-grey hover:text-pico-red transition-colors font-label-sm uppercase tracking-wider',
                  href: 'mailto:rodrigodesouzacastro@gmail.com',
                  [.text('Email')],
                ),
                a(
                  classes:
                      'text-pico-light-grey hover:text-pico-blue transition-colors font-label-sm uppercase tracking-wider',
                  href: 'https://www.linkedin.com/in/castrodev/',
                  [.text('LinkedIn')],
                ),
                a(
                  classes:
                      'text-pico-light-grey hover:text-pico-green transition-colors font-label-sm uppercase tracking-wider',
                  href: 'https://github.com/castrors',
                  [.text('GitHub')],
                ),
                /*
                a(
                  classes:
                      'text-pico-light-grey hover:text-pico-orange transition-colors font-label-sm uppercase tracking-wider',
                  href: '#',
                  [.text('RSS')],
                ),
                */
              ],
            ),
          ],
        ),
      ],
    );
  }
}
