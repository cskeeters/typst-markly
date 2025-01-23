This is a Typst package to add cut, bleed, and registration marks to documents.

# Notes

Since this is a bit difficult to do there are some limitations to using this package.  Here are a few examples:

* `inside`/`outside` margins don't work on pages
* The `background` field of the `page` can't be used unless there is a wrapper function so that `marks` is called also.

# Usage

You need to import the package and setup parameters for the page setup.


```typst
#import "@preview/markly:0.1.0": *

// Set the stock dimentions
#let stock_width = 8.5in
#let stock_height = 11in

// Set desired content width (not including bleed)
// Do 6x4 to print front and back on an Index card for Recipe box
#let content_width = 6in
#let content_height = 4in

// Set distance between bleed marks and cut marks
#let bleed = 9pt

#let bleed_width = content_width + 2 * 6pt

// Distance between cut marks and text
#let margin_width = .2in
#let margin_height = .2in

#set page(
  width: stock_width,
  height: stock_height,
  margin: (
    x: (stock_width - content_width) / 2 + margin_width,
    y: (stock_height - content_height) / 2 + margin_height,
  ),
  background: marks(stock_width:stock_width, stock_height: stock_height, content_width:content_width, content_height:content_height, bleed:bleed),
)

content...

```

Use `to_bleed`, `to_bleed_left`, or `to_bleed_right` to paint a background to the bleed marks.

See [demo.typ](demo.typ) and [demo.pdf](demo.pdf)

# Design

[Cetz](https://github.com/cetz-package/cetz) is used to draw the marks on the page's background.
