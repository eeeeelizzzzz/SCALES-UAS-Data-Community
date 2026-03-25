# Non-UAS SCALES data — availability matrix

The SCALES field deployment included **ground-based and other non-UAS** observing systems (e.g. CLAMPS, Doppler lidars, towers, soundings) alongside UAS. This page summarizes **which non-UAS dataset types appear in a campaign export bundle** organized by **calendar day** and **site label** (folder names). It does **not** duplicate the UAS platform index under [`platforms/`](../platforms/).

## How to read the matrix

- **Dates** use **`YYYYMMDD`** (folder labels follow `2024-09-08` … `2024-09-13`; **20240908** corresponds to the intercomparison-focused tree).
- **✓** = that instrument **site folder** is present for that day in the export used to build this table.
- **UAS-only** folders (e.g. iMet CopterSonde3 under Bixby) are **excluded** here; see per-platform docs under `platforms/`.
- Rows with **“Not specified in folder name”** mean the export folder did not repeat a site string; deployment may still be documented elsewhere.

## Availability (export-derived)

| Non-UAS dataset | Site / label | 20240908 | 20240909 | 20240910 | 20240911 | 20240912 | 20240913 |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Aerokats | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| CLAMPS2 (TROPoe / AERI NetCDF) | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| CLAMPS2 (TROPoe / AERI NetCDF) | Not specified in folder name | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| CoMeT-1 tower | Urban - Compact High Rise | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| CoMeT-2 tower | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| CoMeT-2 tower | Downstream NW - 20 km | — | ✓ | — | ✓ | — | — |
| CoMeT-2 tower | Downstream NNW - 20 km | — | — | ✓ | — | — | — |
| CoMeT-2 tower | Downstream NW - 5 km | — | — | — | — | ✓ | ✓ |
| CoMeT-3 tower | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| CoMeT-3 tower | Urban - Open Low Rise | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| FMI ground (WXT) | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| FMI ground (WXT) | Not specified in folder name | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| OSU MWS600 surface | Upstream - Urban Boundary | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| OSU MWS600 surface | Urban - Large Low Rise | — | — | ✓ | ✓ | ✓ | ✓ |
| WindBorne GSB soundings | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| WindBorne GSB soundings | Not specified in folder name | — | — | ✓ | ✓ | ✓ | — |
| Windcube Doppler lidar | Helmerich Research Center – OSU Tulsa | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| iMet radiosondes | Intercomparison (Kessler) | ✓ | — | — | — | — | — |
| iMet radiosondes | Downstream 5 km | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| iMet radiosondes | Upstream - Main | — | ✓ | ✓ | ✓ | ✓ | ✓ |

## Notes

1. **CoMeT-2** has two **~20 km downstream** rows (**NW** vs **NNW**) reflecting **different folder names** in the export, not an independent verification of two separate deployments.
2. This matrix reflects **one export bundle** (folder presence). It is **not** a substitute for the authoritative **NSSL THREDDS** campaign catalogs for CLAMPS and related products.

## NSSL THREDDS catalogs (SCALES)

Server-side access for CLAMPS and related products (stares, VADs, TROPoe, mobile lidar) is documented on NOAA; for example:

- [DL fixed-point / stare products](https://data.nssl.noaa.gov/thredds/catalog/FRDD/CLAMPS/campaigns/SCALES/dlfp/catalog.html)
- [DL VAD products](https://data.nssl.noaa.gov/thredds/catalog/FRDD/CLAMPS/campaigns/SCALES/dlvad/catalog.html)
- [TROPoe](https://data.nssl.noaa.gov/thredds/catalog/FRDD/CLAMPS/campaigns/SCALES/tropoe/catalog.html)
- [NSSL mobile Doppler lidar (lidar truck)](https://data.nssl.noaa.gov/thredds/catalog/FRDD/CLAMPS/campaigns/SCALES/lidarTruck/catalog.html)
