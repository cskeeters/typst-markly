#import "@preview/markly:0.2.0"

#let markly_context = markly.setup(
  stock-width:4in,
  stock-height:3in,

  content-width: 3in,
  content-height:2in,
)

#show: markly.page-setup.with(markly_context)

// Here the local title template uses markly's to_bleed
#let title(body, inset_y:12pt) = {
  markly.to-bleed(text(white, size:2.5em, body), markly_context)
}

#title[Bannar]

- Content
