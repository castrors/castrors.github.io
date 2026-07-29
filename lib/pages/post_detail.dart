import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/translation_provider.dart';
import '../models/post.dart';
import '../data/posts.dart';

String _translateCategory(BuildContext context, String category) {
  switch (category) {
    case 'Tecnologia':
      return context.t('cat_tech');
    case 'Carreira':
      return context.t('cat_career');
    case 'Design':
      return context.t('cat_design');
    default:
      return category;
  }
}

String _translateReadingTime(BuildContext context, String readingTime) {
  if (context.locale == 'en') {
    return readingTime.replaceAll('min de leitura', 'min read');
  }
  return readingTime;
}

class PostDetailPage extends StatefulComponent {
  final String id;
  const PostDetailPage({required this.id, super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Component build(BuildContext context) {
    final uri = Uri.parse(context.url);
    final id = uri.queryParameters['id'] ?? component.id;

    final post = allPosts.firstWhere(
      (postItem) => postItem.id == id || postItem.slug == id,
      orElse: () => Post(
        id: '',
        slug: '',
        title: context.t('post_not_found_title'),
        category: '',
        date: '',
        summary: '',
        bodyMarkdown: context.t('post_not_found_desc'),
        imageUrl: '',
        readingTime: '',
      ),
    );

    final isNotFound = post.id.isEmpty;

    return main_(
      classes: 'pt-32 pb-unit-12 px-margin-mobile bg-[#011038] text-[#dbe1ff] min-h-screen',
      [
        if (!isNotFound)
          Document.head(
            title: '${post.title} | Rodrigo Castro',
            meta: {
              'description': post.summary,
              'keywords': 'blog, flutter, dart, software engineering, ${post.category.toLowerCase()}',
            },
          ),

        div(
          classes: 'max-w-3xl mx-auto',
          [
            // Back Button
            div(
              classes: 'mb-unit-8',
              [
                a(
                  classes:
                      'inline-flex items-center gap-unit-2 bg-pico-black/40 border-2 border-pico-dark-grey text-pico-white font-label-sm uppercase px-unit-4 py-2 hover:border-pico-blue hover:text-pico-blue transition-all cursor-pointer text-decoration-none shadow-[2px_2px_0px_#000]',
                  href: '/blog',
                  [
                    span(classes: 'material-symbols-outlined text-sm', [.text('arrow_back')]),
                    .text(context.t('post_back_to_blog')),
                  ],
                ),
              ],
            ),

            if (isNotFound)
              div(
                classes:
                    'text-center py-16 bg-pico-black/30 border-4 border-pico-red rounded-2xl p-unit-8 shadow-[8px_8px_0px_#000]',
                [
                  span(classes: 'material-symbols-outlined text-[64px] text-pico-red mb-unit-4', [.text('error')]),
                  h1(classes: 'font-headline-md text-pico-white uppercase mb-unit-2', [.text(post.title)]),
                  p(classes: 'font-body-md text-pico-light-grey mb-unit-6', [.text(post.bodyMarkdown)]),
                ],
              )
            else ...[
              // Post Header
              header(
                classes: 'mb-unit-8 border-b-4 border-pico-dark-grey pb-unit-8',
                [
                  span(classes: 'font-label-sm text-pico-orange uppercase block mb-unit-2 tracking-widest', [
                    .text(_translateCategory(context, post.category)),
                  ]),
                  h1(
                    classes:
                        'font-headline-lg-mobile md:font-headline-lg text-pico-white uppercase mb-unit-4 leading-tight',
                    [.text(post.title)],
                  ),
                  div(
                    classes: 'flex flex-wrap items-center gap-unit-4 text-pico-dark-grey font-label-sm',
                    [
                      div(
                        classes: 'flex items-center gap-1',
                        [
                          span(classes: 'material-symbols-outlined text-[14px]', [.text('calendar_today')]),
                          span([.text(post.date)]),
                        ],
                      ),
                      span(classes: 'w-1.5 h-1.5 bg-pico-dark-grey rounded-full', []),
                      div(
                        classes: 'flex items-center gap-1',
                        [
                          span(classes: 'material-symbols-outlined text-[14px]', [.text('schedule')]),
                          span([.text(_translateReadingTime(context, post.readingTime))]),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Post Featured Image
              if (post.imageUrl.isNotEmpty)
                div(
                  classes:
                      'mb-unit-8 rounded-2xl overflow-hidden border-4 border-pico-black bg-pico-black shadow-[8px_8px_0px_#000] aspect-video relative',
                  [
                    img(
                      classes: 'w-full h-full object-cover grayscale hover:grayscale-0 transition-all duration-500',
                      src: post.imageUrl,
                      alt: post.title,
                    ),
                  ],
                ),

              // Post Body
              article(
                classes: 'prose prose-invert max-w-none',
                [
                  MarkdownBody(post.bodyMarkdown),
                ],
              ),

              // Share / Bottom Info
              div(
                classes:
                    'mt-unit-12 pt-unit-8 border-t-4 border-pico-dark-grey flex flex-col sm:flex-row items-center justify-between gap-unit-4',
                [
                  div(
                    classes: 'flex items-center gap-unit-2',
                    [
                      span(classes: 'font-label-sm text-pico-dark-grey uppercase', [.text(context.t('post_liked_it'))]),
                      a(
                        classes:
                            'bg-pico-black/60 border-2 border-pico-dark-grey text-pico-yellow hover:border-pico-yellow font-label-sm uppercase px-3 py-1.5 text-decoration-none transition-all',
                        href: 'https://dev.to/rodrigocastro_o',
                        target: Target.blank,
                        [
                          .text(context.t('post_follow_devto')),
                        ],
                      ),
                    ],
                  ),
                  a(
                    classes:
                        'text-pico-blue hover:text-pico-white font-label-sm uppercase text-decoration-none flex items-center gap-1',
                    href: '/blog',
                    [
                      .text(context.t('post_see_all')),
                      span(classes: 'material-symbols-outlined text-sm', [.text('arrow_forward')]),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class MarkdownBody extends StatelessComponent {
  final String markdown;
  const MarkdownBody(this.markdown, {super.key});

  @override
  Component build(BuildContext context) {
    final List<Component> elements = [];
    final lines = markdown.split('\n');
    bool inCodeBlock = false;
    String codeBlockContent = '';

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i].trim();

      // Code blocks
      if (line.startsWith('```')) {
        if (inCodeBlock) {
          elements.add(
            pre(
              classes:
                  'bg-pico-black text-pico-green p-unit-4 border-2 border-pico-dark-grey overflow-x-auto font-mono text-sm my-unit-4 block whitespace-pre no-scrollbar',
              [
                code([.text(codeBlockContent.trim())]),
              ],
            ),
          );
          codeBlockContent = '';
          inCodeBlock = false;
        } else {
          inCodeBlock = true;
        }
        continue;
      }

      if (inCodeBlock) {
        codeBlockContent += '${lines[i]}\n';
        continue;
      }

      // Headers
      if (line.startsWith('# ')) {
        elements.add(
          h1(classes: 'font-headline-lg text-pico-white mt-unit-8 mb-unit-4 uppercase', [.text(line.substring(2))]),
        );
      } else if (line.startsWith('## ')) {
        elements.add(
          h2(
            classes:
                'font-headline-md text-pico-green mt-unit-8 mb-unit-4 border-b-2 border-pico-dark-grey pb-unit-2 uppercase',
            [.text(line.substring(3))],
          ),
        );
      } else if (line.startsWith('### ')) {
        elements.add(
          h3(classes: 'font-headline-sm text-pico-yellow mt-unit-6 mb-unit-2 uppercase', [.text(line.substring(4))]),
        );
      }
      // Blockquotes
      else if (line.startsWith('> ')) {
        elements.add(
          blockquote(
            classes:
                'border-l-4 border-pico-red bg-pico-dark-blue/40 px-unit-4 py-unit-2 my-unit-4 text-pico-peach italic font-body-md',
            [.text(line.substring(2))],
          ),
        );
      }
      // Images
      else if (line.startsWith('![') && line.contains('](')) {
        final altEnd = line.indexOf(']');
        final urlStart = line.indexOf('(') + 1;
        final urlEnd = line.lastIndexOf(')');
        if (altEnd > 2 && urlEnd > urlStart) {
          final alt = line.substring(2, altEnd);
          final url = line.substring(urlStart, urlEnd);
          elements.add(
            div(
              classes: 'my-unit-8 flex flex-col items-center',
              [
                img(
                  classes:
                      'max-w-full rounded border-4 border-pico-black shadow-[4px_4px_0px_#000] grayscale hover:grayscale-0 transition-all',
                  src: url,
                  alt: alt,
                ),
                if (alt.isNotEmpty)
                  span(classes: 'font-label-sm text-pico-dark-grey mt-unit-2 block uppercase text-center', [
                    .text(alt),
                  ]),
              ],
            ),
          );
        }
      }
      // Lists
      else if (line.startsWith('- ') || line.startsWith('* ')) {
        elements.add(
          li(
            classes: 'font-body-md text-[#dbe1ff] ml-unit-4 list-disc list-inside my-unit-1',
            [_parseInline(line.substring(2))],
          ),
        );
      } else if (line.isNotEmpty) {
        // Embed links / gifs custom handling or just general paragraphs
        if (line.startsWith('{% embed') && line.contains('https://dev.to/')) {
          final urlStart = line.indexOf('https://');
          var urlEnd = line.indexOf(' ', urlStart);
          if (urlEnd == -1) {
            urlEnd = line.indexOf('%}', urlStart);
          }
          final url = urlEnd != -1 ? line.substring(urlStart, urlEnd).trim() : line.substring(urlStart).trim();
          elements.add(
            div(
              classes:
                  'my-unit-6 p-unit-4 bg-pico-dark-blue border-2 border-pico-blue rounded-xl flex items-center justify-between',
              [
                div([
                  span(classes: 'font-label-sm text-pico-blue block uppercase mb-1', [.text(context.t('post_related_article'))]),
                  a(classes: 'font-headline-sm text-pico-white hover:text-pico-blue text-decoration-none', href: url, [
                    .text(context.t('post_view_article_devto')),
                  ]),
                ]),
                span(classes: 'material-symbols-outlined text-pico-blue', [.text('launch')]),
              ],
            ),
          );
        } else {
          elements.add(
            p(
              classes: 'font-body-md text-[#dbe1ff]/90 leading-relaxed my-unit-4',
              [_parseInline(line)],
            ),
          );
        }
      }
    }

    return div(elements, classes: 'markdown-body');
  }

  Component _parseInline(String text) {
    final List<Component> spans = [];
    var currentText = text;

    while (currentText.isNotEmpty) {
      final boldStart = currentText.indexOf('**');
      final linkStart = currentText.indexOf('[');

      if (boldStart == -1 && linkStart == -1) {
        spans.add(span([.text(currentText)]));
        break;
      }

      if (boldStart != -1 && (linkStart == -1 || boldStart < linkStart)) {
        if (boldStart > 0) {
          spans.add(span([.text(currentText.substring(0, boldStart))]));
        }
        final boldEnd = currentText.indexOf('**', boldStart + 2);
        if (boldEnd != -1) {
          spans.add(
            strong(classes: 'text-pico-white font-bold', [.text(currentText.substring(boldStart + 2, boldEnd))]),
          );
          currentText = currentText.substring(boldEnd + 2);
        } else {
          spans.add(span([.text(currentText.substring(boldStart))]));
          break;
        }
      } else if (linkStart != -1) {
        if (linkStart > 0) {
          spans.add(span([.text(currentText.substring(0, linkStart))]));
        }
        final linkEnd = currentText.indexOf(']', linkStart);
        final urlStart = currentText.indexOf('(', linkEnd);
        final urlEnd = currentText.indexOf(')', urlStart);

        if (linkEnd != -1 && urlStart == linkEnd + 1 && urlEnd != -1) {
          final linkText = currentText.substring(linkStart + 1, linkEnd);
          final linkUrl = currentText.substring(urlStart + 1, urlEnd);
          spans.add(
            a(
              classes: 'text-pico-blue hover:text-pico-white hover:underline transition-colors font-bold',
              href: linkUrl,
              [.text(linkText)],
            ),
          );
          currentText = currentText.substring(urlEnd + 1);
        } else {
          spans.add(span([.text(currentText.substring(linkStart))]));
          break;
        }
      }
    }

    return span(spans);
  }
}
