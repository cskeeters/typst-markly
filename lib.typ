#import "@preview/cetz:0.3.1"

#let marks(stock_width:8.5in, stock_height: 11in, content_width:6in, content_height:9in, bleed:3mm) = {
  let mark_length=10pt
  let mark_standoff=bleed + 2pt
  let cut_mark_color = black
  let bleed_mark_color = red

  let slug_width=(stock_width - content_width) / 2
  let slug_height=(stock_height - content_height) / 2

  cetz.canvas(
    length: 1pt,
    {
      import cetz.draw: *

      // This just ensures that we have a coordinate system that covers the whole page
      // grid((0,0), (612,792), stroke:none, step: 72)
      grid((0,0), (stock_width.pt(),stock_height.pt()), stroke:none, step: 72)

      let draw_marks(top_left, top_right, bottom_left, bottom_right, color:black) = {
        // Top Left
        let from = top_left
        from.at(1) += mark_standoff

        let to = from
        to.at(1) += mark_length

        line(from, to, stroke: color)


        let from = top_left
        from.at(0) -= mark_standoff

        let to = from
        to.at(0) -= mark_length
        line(from, to, stroke: color)


        // Top Right
        let from = top_right
        from.at(1) += mark_standoff

        let to = from
        to.at(1) += mark_length

        line(from, to, stroke: color)


        let from = top_right
        from.at(0) += mark_standoff

        let to = from
        to.at(0) += mark_length
        line(from, to, stroke: color)



        // Bottom Left
        let from = bottom_left
        from.at(1) -= mark_standoff

        let to = from
        to.at(1) -= mark_length

        line(from, to, stroke: color)


        let from = bottom_left
        from.at(0) -= mark_standoff

        let to = from
        to.at(0) -= mark_length
        line(from, to, stroke: color)


        // Bottom Right
        let from = bottom_right
        from.at(1) -= mark_standoff

        let to = from
        to.at(1) -= mark_length

        line(from, to, stroke: color)


        let from = bottom_right
        from.at(0) += mark_standoff

        let to = from
        to.at(0) += mark_length
        line(from, to, stroke: color)
      }

      let cut_top_left = (slug_width, stock_height - slug_height)
      let cut_top_right = (stock_width - slug_width, stock_height - slug_height)
      let cut_bottom_left = (slug_width, slug_height)
      let cut_bottom_right = (stock_width - slug_width, slug_height)
      draw_marks(cut_top_left, cut_top_right, cut_bottom_left, cut_bottom_right)

      if bleed != 0pt {

        let bleed_top_left = (slug_width - bleed, stock_height - slug_height + bleed)
        let bleed_top_right = (stock_width - slug_width + bleed, stock_height - slug_height + bleed)
        let bleed_bottom_left = (slug_width - bleed, slug_height - bleed)
        let bleed_bottom_right = (stock_width - slug_width + bleed, slug_height - bleed)

        draw_marks(bleed_top_left, bleed_top_right, bleed_bottom_left, bleed_bottom_right, color:bleed_mark_color)
      }

      let registration_color(position, color) = {
        circle(position, radius: 6pt, stroke: .6pt + color)
        circle(position, radius: 4pt, stroke: none, fill: color)

        let from = position
        from.at(0) -= 8pt
        let to = position
        to.at(0) += 8pt
        line(from, to, stroke: .6pt + color)

        let from = position
        from.at(0) -= 4pt
        let to = position
        to.at(0) += 4pt
        line(from, to, stroke: white + .6pt)

        let from = position
        from.at(1) -= 8pt
        let to = position
        to.at(1) += 8pt
        line(from, to, stroke: .6pt + color)

        let from = position
        from.at(1) -= 4pt
        let to = position
        to.at(1) += 4pt
        line(from, to, stroke: white + .6pt)
      }

      let registration(position) = {
        // I'm not sure that this will not be sqashed before these are printing.
        registration_color(position, cmyk(100%,   0%,   0%,   0%))
        registration_color(position, cmyk(  0%, 100%,   0%,   0%))
        registration_color(position, cmyk(  0%,   0%, 100%,   0%))
        registration_color(position, cmyk(  0%,   0%,   0%, 100%))
      }


      registration((stock_width / 2, stock_height - slug_height / 2)) // Top
      registration((stock_width / 2, slug_height / 2)) //Bottom
      registration((slug_width / 2, stock_height / 2)) // Left
      registration((stock_width - slug_width / 2, stock_height / 2)) // Right
    }
  )
}

// This creates a background color that extends to the bleed line on the left and right
#let to_bleed(body, margin_width, bleed, color: white, bg_color:blue.darken(30%), inset_y:12pt) = {
  block(
    fill: bg_color,
    width: 100%,
    outset: (x: bleed+margin_width), // paints until bleed cutoff
    inset: (y:inset_y), // padding height for background color
    text(color, body)
  )
}


// This creates a background color that extends to the bleed line on the right
#let to_bleed_right(body, margin_width, bleed, color: white, bg_color:blue.darken(30%), padding:12pt) = {
  block(
    fill: bg_color,
    width: 100%,
    outset: (right: bleed+margin_width), // paints until bleed cutoff
    inset: (left:padding, y:padding), // padding height for background color
    text(color, body)
  )
}

// This creates a background color that extends to the bleed line on the left
#let to_bleed_left(body, margin_width, bleed, color: white, bg_color:blue.darken(30%), padding:12pt) = {
  block(
    fill: bg_color,
    width: 100%,
    outset: (left: bleed+margin_width), // paints until bleed cutoff
    inset: (right:padding, y:padding), // padding height for background color
    text(color, body)
  )
}

#let img_to_bleed(img_src, margin_width, margin_height, bleed) = {
  place(
    top + left,
    dx: -(margin_width+bleed),
    dy: -(margin_height+bleed),
    image(
      img_src,
      width:100%+margin_width*2+bleed*2,
      height:100%+margin_height*2+bleed*2)
  )
}
