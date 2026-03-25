# `specs.yaml` field reference

Machine-readable metadata for each platform lives in `platforms/<Platform_ID>/specs.yaml`. Start from [`platforms/_template_platform_/specs.yaml`](../platforms/_template_platform_/specs.yaml). Allowed values are intentionally flexible strings unless noted; use the platform `README.md` for narrative detail.

## Operator and contacts

| Key | Description | CSV alignment |
| --- | --- | --- |
| **operator_name** | Operating institution(s). | **Operator_name** |
| **wmo_operator_id** | WMO UAS-DC operator ID (number or string as stored). | **Operator_ID** |
| **data_poc** | Primary data contact name. | — |
| **data_poc_email** | Email for data questions. | — |
| **pic_ops_poc** | Pilot in command / operations contact. | — |

## Platform and campaign

| Key | Description |
| --- | --- |
| **platform_model** | Model or product name. |
| **aircraft_type** | e.g. fixed-wing, rotor, hybrid. |
| **scales_component** | Campaign component (e.g. Meso, Micro-UHI). |
| **deployment_sites** | Where the system flew (site labels as used in ops). |
| **campaign_active_dates** | Active dates, typically `YYYYMMDD` tokens. |
| **sensed_variables** | Measured quantities (free text or list-like string). |

## Sensors and installation

| Key | Description |
| --- | --- |
| **wind_adaptation_flag** | Whether wind retrieval / adaptation applies (per project convention). |
| **payload_relative_position** | Where the meteorological payload sits on the airframe. |
| **sensor_airflow_solution** | How sensors are exposed to ambient air (e.g. aspiration, shielding). |
| **airflow_relative_position** | Placement of airflow path relative to rotors or fuselage. |
| **num_rotors** | Rotor count, if applicable. |

When updating the **main index**, keep **Operator_ID**, **Platform_name**, and **Operator_name** consistent with **wmo_operator_id**, **platform_model**, and **operator_name** here unless you document an intentional exception in **Notes_ref**.
