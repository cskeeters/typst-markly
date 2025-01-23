// #import "@preview/markly:0.1.0": *
#import "@local/markly:0.1.0": *

// Set the stock dimentions
#let stock_width = 8.5in
#let stock_height = 11in

// Set desired content width (not including bleed)
// Do 6x4 to print front and back on an Index card for Recipe box
#let content_width = 6in
#let content_height = 4in

// Set distance between bleed marks and cut marks
#let bleed = 9pt

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

#let title(body, inset_y:12pt) = {
  to_bleed(text(white, size:2.5em, body), margin_width, bleed)
}

#let author(body) = {
  block(
    inset: (bottom: 0.5em),
    text(style:"italic", {
      [by: ]
      body
    })
  )
}

#show heading: it => {
  block(
    inset: (top:0em, bottom: .3em),
    it.body
  )
}



#title[Blue Cheese Salad]

#grid(
  columns: (auto, 1fr),

  row-gutter: 0pt,
  column-gutter: 24pt,

  [

    #author[Chad Skeeters]

    = Ingredients

    - #link("https://www.heb.com/product-detail/h-e-b-kindly-cultivated-fresh-organic-butter-lettuce-blend-4-oz/9296141")[Butter Lettuce]
    - #link("https://www.heb.com/product-detail/marie-s-chunky-blue-cheese-dressing-sold-cold-12-fl-oz/321384")[Blue Cheese Dressing]
    - #link("https://www.heb.com/product-detail/delallo-quartered-marinated-artichoke-hearts-12-oz/1207535")[Artichoke Hearts]
    - #link("https://www.heb.com/product-detail/mezzetta-sliced-greek-kalamata-olives-9-5-oz/1439822")[Kalamata Olives]
    - #link("https://www.heb.com/product-detail/h-e-b-pine-nuts-4-oz/4604552")[Pine Nuts]
    - #link("https://www.heb.com/product-detail/pepperidge-farm-farmhouse-mini-plain-bagels-17-oz/2001048")[Bagels]
    - #link("https://www.heb.com/product-detail/rustico-di-casa-asaro-unfiltered-extra-virgin-olive-oil-17-oz/2935089")[Olive Oil]
    - #link("https://www.heb.com/product-detail/h-e-b-coarse-kosher-sea-salt-4-4-lbs/1917502")[Kosher Salt]
    - #link("https://www.heb.com/product-detail/bolner-s-fiesta-whole-black-pepper-3-oz/169910")[Black Pepper]
  ],

  [
    = Steps

    + Chop bagels into crouton-sized pieces.  Put pieces into a mixing bowl.  Add olive oil, salt, and pepper and mix.  Olive oils #link("https://www.amazon.com/dp/B01MT673U6")[sprayers] work well for this task.
    + Optionally, chop the lettuce into bite-sized pieces.
    + Put bagel pieces into the air fryer for 4-5 minutes on 400#sym.degree.f.
    + Add lettuce and blue cheese dressing to a mixing bowl and mix.
    + Chop artichokes and black olives according to your preference and add to the salad.
    + Sprinkle in pine nuts.
    + Mix salad.
    + Add croutons and serve while hot
  ]
)


#pagebreak(weak: true)

// Image should be 72*content_width+bleed by 72*content_height+bleed to not be distored
// (72*6+9, 72*4+9) = (441x297)
#img_to_bleed("ping-pong.jpg", margin_width, margin_height, bleed)

#text(font:"Source Sans Pro", 4em, white, weight:900)[
  Play On
]