# Generate img.svg for README.md

```bash
typst compile --format svg img.typ
```

# Integration Testing

Tests are made with [tingerrr/tytanic](https://github.com/tingerrr/tytanic).

Install/update:

```sh
cargo binstall tytanic
```

Establish baseline:

```sh
tt --use-system-fonts update main
```

Compile Tests and compare output:

```bash
tt --use-system-fonts run
```

Inspect failures by looking in either

* tests/main/diff
* tests/img/diff
