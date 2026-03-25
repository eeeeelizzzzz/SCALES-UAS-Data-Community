# Intercomparison calibration PDFs (`calibration/`)

Some platforms include PDFs from the **ISARRA SCALES** UAS calibration / intercomparison (**8 September 2024**, Kessler Field Station area, Oklahoma). Those flights compared participating systems to reference CopterSondes and Doppler lidars; reports summarize corrections for temperature, relative humidity, wind speed, and wind direction relative to those references.

The original archive ships **two** report directories whose PDFs often share the **same basename** as each other and as the corresponding netCDF (`UASDC_<OperatorID>_<AircraftID>_<UTCstart>Z`):

- **T and RH Calibration Reports** — temperature and relative humidity.
- **Wind Speed and Direction Calibration Reports** — wind speed and direction.

Because basenames can collide between the two, copies in this repository add **`_TRH`** or **`_WIND`** before `.pdf` so both reports are preserved (e.g. `..._20240908142201Z_TRH.pdf` and `..._20240908142201Z_WIND.pdf`).

For full narrative on panels, correction forms (e.g. `T_c`, `RH_c`, `U_c`, `φ_c`), and data standards, see the **ReadMe** packaged with the intercomparison archive and the [WMO UAS Data Representation Standards](https://community.wmo.int/site/knowledge-hub/programmes-and-initiatives/wmo-uncrewed-aircraft-systems-demonstration-campaign/uas-demonstration-campaign-uas-data-representation-standards).
