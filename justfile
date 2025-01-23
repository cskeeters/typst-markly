# This file is used just to generate the thumbnail so that is looks good on the
# typst universe.

template_path := "template"

alias ct := compile_template
alias tt := template_thumbnail
alias pt := preview_thumbnail

[doc('Compiles the template to PDF')]
compile_template:
    cd {{template_path}}; \
    typst compile main.typ

[doc('Generates template thumbnail from PDF')]
template_thumbnail PAGE="1" DPI="250": compile_template
    pdftoppm -f {{PAGE}} -l {{PAGE}} -rx {{DPI}} -ry {{DPI}} -png \
        {{template_path}}/main.pdf > template.png
    oxipng -o 4 --strip safe --alpha template.png

[doc('Previews the generated thumbnail')]
preview_thumbnail: template_thumbnail
    ls -l template.png
    open -a Acorn.app template.png

clean:
    rm template.png {{template_path}}/main.pdf
