This is a Typst package to add cut, bleed, and registration marks to documents.


# Demo

![Markly Demo](img.png)

...can be generated with:

```typst
#import "@preview/markly:0.2.0"

#let markly-context = markly.setup(
  stock-width:4in,
  stock-height:3in,

  content-width: 3in,
  content-height:2in,
)

#show: markly.page-setup.with(markly-context)

// Here the local title template uses markly's to-bleed
#let title(body, inset-y:12pt) = {
  markly.to-bleed(text(white, size:2.5em, body), markly-context)
}

#title[Bannar]

- Content
```


For a more detailed example, see [main.typ](template/main.typ) and [main.pdf](main.pdf).

# Getting Started

    typst init @preview/markly:0.2.0


# Notes

Since this is a bit difficult to do there are some limitations to using this package.  Here are a few examples:

* `inside`/`outside` margins don't work on pages
* The `background` field of the `page` can't be used unless there is a wrapper function so that `marks` is called also.


# Usage

You need to import the package and setup parameters for the page setup.


```typst
#import "@preview/markly:0.2.0": *

// Set a dictionary of layout parameters that will be passed to other markly functions
#let markly-context = markly-setup(
  // stock-width:8.5in,
  // stock-height:11in,

  content-width:7in,
  content-height:5in,

  // bleed:9pt,

  // margin-width:.2in,
  // margin-height:.2in
)

// Configure the page to draw marks
#show: markly-page-setup.with(markly-context)

content...

```

Use `to-bleed`, `to-bleed-left`, or `to-bleed-right` to paint a background to the bleed marks.

Use `img-to-bleed` to stretch an image horizontally and vertically to the bleed marks.  The position of the "cursor" is not updated (like in the case of a background image) since it uses the `place` function.


# Design

[Cetz](https://github.com/cetz-package/cetz) is used to draw the marks on the page's background.
