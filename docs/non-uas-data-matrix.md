# Non-UAS SCALES data — availability matrix

The SCALES field deployment included **ground-based and other non-UAS** observing systems (e.g. CLAMPS, Doppler lidars, towers, soundings) alongside UAS. This page summarizes **which non-UAS instruments appear in a campaign export bundle** by **calendar day**, with **locations taken from folder names** in that bundle. It does **not** duplicate the UAS platform index under [`platforms/`](../platforms/).

## How to read the matrix

- **Rows** = instrument or dataset family (one row each).
- **Columns** = **`YYYYMMDD`** calendar days (**20240908** is the intercomparison-focused at **KAEFS/WASH**).
- **Cells** = **location label(s)** for that instrument on that day. Multiple sites on the same day are comma-separated.
- **—** = no data available.
- **Not specified in export** = a folder exists for that instrument/day but **did not include a site string** in the folder name.


## Availability (export-derived)

| Instrument | 20240908 | 20240909 | 20240910 | 20240911 | 20240912 | 20240913 |
|---|---|---|---|---|---|---|
| Aerokats | KAEFS/WASH | — | — | — | — | — |
| CLAMPS2 (TROPoe / Doppler lidar) | KAEFS/WASH | KAEFS/WASH  | KAEFS/WASH  | KAEFS/WASH  | KAEFS/WASH  |KAEFS/WASH  |
| CoMeT-1 mesonet | — | Urban - Compact High Rise | Urban - Compact High Rise | Urban - Compact High Rise | Urban - Compact High Rise | Urban - Compact High Rise |
| CoMeT-2 mesonet | KAEFS/WASH | Downstream NW - 20 km | Downstream NNW - 20 km | Downstream NW - 20 km | Downstream NW - 5 km | Downstream NW - 5 km |
| CoMeT-3 mesonet | KAEFS/WASH | Urban - Open Low Rise | Urban - Open Low Rise | Urban - Open Low Rise | Urban - Open Low Rise | Urban - Open Low Rise |
| FMI ground station (WXT) | KAEFS/WASH | Not specified in export | Not specified in export | Not specified in export | Not specified in export | Not specified in export |
| OSU MWS600 surface | — | Upstream - Urban Boundary | Upstream - Urban Boundary, Urban - Large Low Rise | Upstream - Urban Boundary, Urban - Large Low Rise | Upstream - Urban Boundary, Urban - Large Low Rise | Upstream - Urban Boundary, Urban - Large Low Rise |
| WindBorne GSB soundings | Avail. | — | Avail. | Avail. | Avail. | — |
| Windcube Doppler lidar | — | Helmerich Research Center – OSU Tulsa | Helmerich Research Center – OSU Tulsa | Helmerich Research Center – OSU Tulsa | Helmerich Research Center – OSU Tulsa | Helmerich Research Center – OSU Tulsa |
| iMet radiosondes | KAEFS/WASH | Downstream 5 km, Upstream - Main | Downstream 5 km, Upstream - Main | Downstream 5 km, Upstream - Main | Downstream 5 km, Upstream - Main | Downstream 5 km, Upstream - Main |

## Notes
 - **CoMeT-2** uses **NW** vs **NNW** and **20 km** vs **5 km** labels; they are not independently verified here as distinct physical deployments but could reflect a move of the platform.



