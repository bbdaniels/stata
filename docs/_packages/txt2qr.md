---
layout: package
title: txt2qr
tagline: Generate QR codes from text
category: Specialized Tools
package_name: txt2qr
github: https://github.com/bbdaniels/txt2qr
---

## Description

`txt2qr` generates a QR code containing specified text and saves it to disk as an image file.

## Syntax

```stata
txt2qr text using, replace
```

## Requirements

- Internet connection required
- Special characters not currently supported
- Recommended file extension: `.png`

## Example

```stata
txt2qr "https://github.com/bbdaniels/stata" using "repo_link.png", replace
```

## Use Cases

- Generate QR codes for survey links
- Create scannable identifiers for data collection
- Add QR codes to printed materials

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
