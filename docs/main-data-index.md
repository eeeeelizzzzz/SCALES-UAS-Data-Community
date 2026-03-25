# `main_data_index.csv` column reference

One row per **platform** (or curated reference) that has a row in this repository. Values should stay aligned with `platforms/<Platform_ID>/specs.yaml` where both exist (see [specs.yaml field reference](./specs-yaml.md)).

| Column | Meaning |
| --- | --- |
| **Platform_ID** | Canonical ID used in filenames, labels (`platform:<id>`), and folder names under `platforms/`. |
| **last_mod** | Date this row was last reviewed or changed (`YYYY-MM-DD`). Update whenever **Best_Available_DOI** or other indexed fields change. |
| **Best_Available_DOI** | The Zenodo (or other) DOI for the **recommended** dataset for this platform—typically post–QC / intercomparison-aware when applicable. Use `null` until a DOI is chosen. |
| **Platform_name** | Human-readable system or model name (may match `platform_model` in `specs.yaml`). |
| **Operator_name** | Operating organization(s) as listed for the campaign. |
| **Operator_ID** | **WMO UAS Demonstration Campaign operator ID** (numeric), same sense as `wmo_operator_id` in `specs.yaml`. |
| **Notes_ref** | Short, stable pointer for maintainers (e.g. issue number, “see platform README,” provenance note). Not a substitute for long-form narrative—use the platform `README.md` for that. |

If a platform appears in field archives under an alternate label (e.g. legacy or ambiguous IDs) but has no row here, that is expected until the community adds a curated entry—see the root README **Scope** section.
