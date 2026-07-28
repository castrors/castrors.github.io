import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/translation_provider.dart';

class Apps extends StatelessComponent {
  const Apps({super.key});

  @override
  Component build(BuildContext context) {
    return main_(
      classes:
          'pt-20 pb-unit-12 px-unit-4 md:px-margin-desktop max-w-container-max mx-auto mt-20 bg-pico-black text-pico-white min-h-screen relative',
      [
        Document.head(
          title: 'Apps | Rodrigo Castro',
          meta: {
            'description': 'Aplicações e ferramentas desenvolvidas por Rodrigo Castro, incluindo The Crossing Puzzle.',
            'keywords': 'apps, flutter, game, flame engine, puzzle, dev, rodrigo de souza castro',
          },
        ),

        // Retro scanline overlay
        div(id: 'scanline-el', classes: 'scanline', []),

        // Page Header
        header(
          classes: 'mb-unit-12 space-y-unit-4 border-l-8 border-pico-red pl-unit-4',
          [
            h1(
              classes:
                  'font-headline-lg-mobile md:font-headline-lg text-headline-lg-mobile md:text-headline-lg text-pico-white uppercase',
              [
                .text(context.t('apps_title_part1')),
                span(classes: 'text-pico-green', [.text('&')]),
                .text(context.t('apps_title_part2')),
              ],
            ),
            p(
              classes:
                  'font-label-md text-pico-light-grey max-w-2xl bg-pico-dark-blue p-unit-2 border border-pico-indigo leading-relaxed',
              [
                .text('RUNNING: selection_curated_projects.exe'),
                br(),
                .text('STATUS: performance_optimized | minimalist_aesthetic | utility_verified'),
              ],
            ),
          ],
        ),

        // Apps Grid
        div(
          classes: 'grid grid-cols-1 lg:grid-cols-2 gap-unit-8 md:gap-gutter',
          [
            // App Card: The Crossing Puzzle (Spans 2 columns)
            div(
              classes: 'pico-card p-unit-4 flex flex-col lg:col-span-2',
              [
                div(
                  classes:
                      'relative w-full aspect-video overflow-hidden border-4 border-pico-black mb-unit-4 bg-pico-black',
                  [
                    div(
                      classes:
                          'bg-cover bg-center w-full h-full grayscale hover:grayscale-0 transition-all duration-300',
                      styles: Styles(raw: const {'background-image': "url('/images/the_crossing_puzzle.png')"}),
                      [],
                    ),
                  ],
                ),
                div(
                  classes: 'flex-grow',
                  [
                    div(
                      classes: 'flex justify-between items-start mb-unit-2',
                      [
                        h2(classes: 'font-headline-sm text-pico-green uppercase mb-0', [.text('The Crossing Puzzle')]),
                        span(
                          classes:
                              'font-label-sm text-pico-peach bg-pico-dark-purple px-unit-1 border border-pico-dark-purple',
                          [.text('2023')],
                        ),
                      ],
                    ),
                    p(
                      classes: 'font-body-md text-pico-white mb-unit-4 border-b border-pico-indigo pb-unit-2',
                      [
                        .text(context.t('apps_game_desc')),
                      ],
                    ),
                    div(
                      classes: 'flex flex-wrap gap-unit-1 mb-unit-8',
                      [
                        span(classes: 'font-label-sm text-pico-blue bg-pico-black px-unit-1 border border-pico-blue', [
                          .text('FLUTTER'),
                        ]),
                        span(classes: 'font-label-sm text-pico-blue bg-pico-black px-unit-1 border border-pico-blue', [
                          .text('FLAME'),
                        ]),
                        span(classes: 'font-label-sm text-pico-blue bg-pico-black px-unit-1 border border-pico-blue', [
                          .text('DART'),
                        ]),
                        span(classes: 'font-label-sm text-pico-blue bg-pico-black px-unit-1 border border-pico-blue', [
                          .text('GAME'),
                        ]),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: 'flex gap-unit-4',
                  [
                    a(
                      classes:
                          'flex-1 text-center pico-btn-primary py-unit-2 font-label-sm uppercase font-bold text-decoration-none cursor-pointer',
                      href: 'https://castrors.github.io/the_crossing_puzzle/',
                      [.text('PLAY')],
                    ),
                    a(
                      classes:
                          'flex-1 text-center pico-btn-secondary py-unit-2 font-label-sm uppercase font-bold text-decoration-none cursor-pointer',
                      href: 'https://github.com/castrors/the_crossing_puzzle',
                      [.text('SRC_CODE')],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Inline console logging for inputs as requested in the design
        script(
          content: '''
          (function() {
            document.querySelectorAll('a, button').forEach(el => {
              el.addEventListener('click', () => {
                console.log('INPUT_RECEIVED: Processing command...');
              });
            });
          })();
        ''',
        ),
      ],
    );
  }
}
