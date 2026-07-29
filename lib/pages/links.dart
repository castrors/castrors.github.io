import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/translation_provider.dart';
import '../utils/firebase_tracker.dart';

class Links extends StatelessComponent {
  const Links({super.key});

  @override
  Component build(BuildContext context) {
    trackPageView('Links');
    final links = [
      (
        title: 'Portfólio Principal',
        subtitle: 'castrors.github.io',
        url: 'https://castrors.github.io/',
        classes: 'glass-card card-blue',
        icon: 'language',
        iconColorClass: 'bg-pico-blue text-pico-black text-pico-blue',
      ),
      (
        title: 'LinkedIn',
        subtitle: 'Conexões profissionais',
        url: 'https://www.linkedin.com/in/castrodev/',
        classes: 'glass-card card-pink',
        icon: 'work',
        iconColorClass: 'bg-pico-pink text-pico-black text-pico-pink',
      ),
      (
        title: 'GitHub',
        subtitle: 'Repositórios e Open Source',
        url: 'https://github.com/castrors',
        classes: 'glass-card card-green',
        icon: 'code',
        iconColorClass: 'bg-pico-green text-pico-black text-pico-green',
      ),
      (
        title: 'DEV.to',
        subtitle: 'Artigos e publicações técnicas',
        url: 'https://dev.to/rodrigocastro_o',
        classes: 'glass-card card-yellow',
        icon: 'description',
        iconColorClass: 'bg-pico-yellow text-pico-black text-pico-yellow',
      ),

      (
        title: 'Instagram',
        subtitle: 'Fotos e momentos',
        url: 'https://instagram.com/rodrigocastro_o',
        classes: 'glass-card card-pink',
        icon: 'photo_camera',
        iconColorClass: 'bg-pico-pink text-pico-black text-pico-pink',
      ),
      (
        title: 'Bluesky',
        subtitle: 'Rede social descentralizada',
        url: 'https://bsky.app/profile/rodrigocastro.flutter.community',
        classes: 'glass-card card-blue',
        icon: 'cloud',
        iconColorClass: 'bg-pico-blue text-pico-black text-pico-blue',
      ),
      (
        title: 'Unsplash',
        subtitle: 'Fotografia profissional',
        url: 'https://unsplash.com/@rodrigocastro_o',
        classes: 'glass-card card-green',
        icon: 'image',
        iconColorClass: 'bg-pico-green text-pico-black text-pico-green',
      ),
      (
        title: 'YouTube',
        subtitle: 'Vídeos e apresentações',
        url: 'https://www.youtube.com/channel/UCPRdmUZXiPz5_2XokXsPPbA?view_as=subscriber',
        classes: 'glass-card card-orange',
        icon: 'play_circle',
        iconColorClass: 'bg-pico-orange text-pico-black text-pico-orange',
      ),
    ];

    return main_(
      classes: 'relative min-h-screen pt-32 pb-unit-12 px-margin-mobile bg-[#000000] text-[#FFF1E8]',
      [
        Document.head(
          title: 'Links | Rodrigo Castro',
          meta: {
            'description':
                'Conecte-se com Rodrigo Castro. Links oficiais do portfólio, LinkedIn, GitHub e publicações.',
            'keywords': 'linktree, links, contact, social links, portfolio, github',
          },
        ),

        div(
          classes: 'max-w-xl mx-auto relative z-10',
          [
            // Header/Bio Section
            header(
              classes: 'text-center mb-unit-12 pt-unit-4 flex flex-col items-center',
              [
                div(
                  classes: 'inline-block relative mb-unit-8',
                  [
                    div(
                      classes:
                          'w-24 h-24 rounded-full p-1 bg-pico-blue border-2 border-pico-white shadow-[4px_4px_0px_#7E2553] overflow-hidden',
                      [
                        img(
                          classes: 'w-full h-full object-cover rounded-full filter grayscale contrast-125',
                          src: '/images/profile.png',
                          alt: 'Portrait',
                        ),
                      ],
                    ),
                    div(
                      classes:
                          'absolute -bottom-1 -right-1 w-7 h-7 bg-pico-green rounded-full border-2 border-pico-black flex items-center justify-center',
                      [
                        span(
                          classes: 'material-symbols-outlined text-[14px] text-pico-black font-bold',
                          styles: Styles(raw: const {'font-variation-settings': "'FILL' 1"}),
                          [.text('verified')],
                        ),
                      ],
                    ),
                  ],
                ),
                h1(
                  classes:
                      'font-headline-lg text-[40px] md:text-[56px] text-pico-white mb-unit-2 uppercase tracking-tight',
                  [.text('Rodrigo Castro')],
                ),
                p(
                  classes: 'font-body-lg text-pico-light-grey mb-unit-4 max-w-lg mx-auto',
                  [
                    .text(context.t('links_subtitle')),
                  ],
                ),
                div(
                  classes: 'flex justify-center gap-unit-2',
                  [
                    span(classes: 'px-unit-2 py-0.5 border-2 border-pico-blue text-pico-blue font-label-sm uppercase', [
                      .text('Flutter'),
                    ]),
                    span(classes: 'px-unit-2 py-0.5 border-2 border-pico-pink text-pico-pink font-label-sm uppercase', [
                      .text('Dart'),
                    ]),
                    span(
                      classes: 'px-unit-2 py-0.5 border-2 border-pico-green text-pico-green font-label-sm uppercase',
                      [.text('Android')],
                    ),
                  ],
                ),
              ],
            ),

            // Links List
            div(
              classes: 'space-y-unit-4',
              [
                for (var linkItem in links)
                  a(
                    classes: '${linkItem.classes} flex items-center p-unit-4 group cursor-pointer text-decoration-none',
                    href: linkItem.url,
                    [
                      div(
                        classes:
                            'w-12 h-12 flex items-center justify-center ${linkItem.iconColorClass.split(' ').sublist(0, 2).join(' ')} mr-unit-4',
                        [
                          span(
                            classes: 'material-symbols-outlined text-pico-black text-2xl',
                            styles: Styles(raw: const {'font-variation-settings': "'FILL' 1"}),
                            [.text(linkItem.icon)],
                          ),
                        ],
                      ),
                      div(
                        classes: 'flex-grow',
                        [
                          h3(classes: 'font-headline-sm text-[20px] text-pico-white uppercase mb-0', [
                            .text(linkItem.title),
                          ]),
                          p(classes: 'font-label-sm ${linkItem.iconColorClass.split(' ').last} mt-1 mb-0', [
                            .text(linkItem.subtitle),
                          ]),
                        ],
                      ),
                      span(
                        classes:
                            'material-symbols-outlined ${linkItem.iconColorClass.split(' ').last} opacity-0 group-hover:opacity-100 transition-opacity',
                        [.text('arrow_forward')],
                      ),
                    ],
                  ),
              ],
            ),

            /*
            // Featured Bento Cards
            div(
              classes: 'mt-unit-12 grid grid-cols-2 gap-unit-4',
              [
                div(
                  classes: 'glass-card p-unit-4 col-span-2 md:col-span-1 border-t-4 border-t-pico-blue',
                  [
                    div(classes: 'font-label-sm text-pico-blue uppercase mb-unit-2', [.text('PROJETO ATUAL')]),
                    h4(classes: 'font-headline-sm text-pico-white mb-unit-1 uppercase', [.text('Nexus Framework')]),
                    p(classes: 'font-body-md text-pico-light-grey', [
                      .text('Uma biblioteca de UI modular para sistemas de alta performance.'),
                    ]),
                  ],
                ),
                div(
                  classes:
                      'glass-card p-unit-4 col-span-2 md:col-span-1 flex flex-col justify-between border-t-4 border-t-pico-pink',
                  [
                    div(
                      [
                        div(classes: 'font-label-sm text-pico-pink uppercase mb-unit-2', [.text('NEWSLETTER')]),
                        h4(classes: 'font-headline-sm text-pico-white mb-unit-1 uppercase', [.text('The Draft')]),
                      ],
                    ),
                    div(
                      classes: 'flex gap-1 mt-unit-4',
                      [
                        input(
                          classes:
                              'flex-grow bg-pico-black border-2 border-pico-dark-grey focus:border-pico-pink focus:ring-0 text-pico-white font-label-sm px-unit-2 py-2 outline-none',
                          attributes: const {'placeholder': 'E-MAIL'},
                          type: InputType.email,
                        ),
                        button(
                          classes:
                              'bg-pico-pink text-pico-black font-label-sm uppercase px-unit-4 py-2 hover:bg-pico-white transition-all active:translate-y-px cursor-pointer border-none font-bold',
                          [.text('OK')],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            */
          ],
        ),

        // Script for micro-interactions on links
        script(
          content: '''
          (function() {
            document.querySelectorAll('.glass-card').forEach(card => {
              card.addEventListener('mouseenter', () => {
                const icon = card.querySelector('.material-symbols-outlined');
                if (icon) {
                  icon.style.fontVariationSettings = "'FILL' 1, 'wght' 600";
                }
              });
              card.addEventListener('mouseleave', () => {
                const icon = card.querySelector('.material-symbols-outlined');
                if (icon) {
                  icon.style.fontVariationSettings = "'FILL' 0, 'wght' 300";
                }
              });
            });
          })();
        ''',
        ),
      ],
    );
  }
}
