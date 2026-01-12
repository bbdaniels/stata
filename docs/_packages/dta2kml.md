---
layout: package
title: dta2kml
tagline: Export data to KML for geographic visualization
category: Specialized Tools
package_name: dta2kml
---

## Description

`dta2kml` outputs a KML file from selected datapoints in a Stata dataset for visualization in Google Earth or other geographic software.

## Syntax

```stata
dta2kml using filename [if] [in],
    latitude(varname) longitude(varname)
    [altitude(varname)]
    [folders(varname)] [names(varname)]
    [icons(varname)] [descriptions(varname)]
    [replace]
```

## Options

| Option | Description |
|--------|-------------|
| `latitude()` | Variable with latitude (decimal format) |
| `longitude()` | Variable with longitude (decimal format) |
| `altitude()` | Variable with altitude in meters |
| `folders()` | Variable for folder grouping |
| `names()` | Variable for placemark names |
| `icons()` | Variable with icon URLs |
| `descriptions()` | Variable for placemark descriptions |
| `replace` | Replace existing file |

## Notes

- Coordinates must be in decimal format, not degrees-minutes-seconds
- Altitude in meters
- Icons from [KML Icon Library](http://kml4earth.appspot.com/icons.html)

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
