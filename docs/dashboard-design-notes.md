# Dashboard Design Notes

## Design Tenets

- **Schema is the contract, not the ETL.** Power BI reads from the `bi` schema views; the SSIS pipeline in this
  repo is one reference way to populate `reporting`, not a required dependency. See
  [Technical Overview](technical-overview.md).
- **One semantic model per Essential Question.** Each `PowerBI/EQ-*` folder is a fully self-contained `.pbip` (report
  + semantic model) rather than several reports sharing one model, so each EQ can be deployed or embedded
  independently.
- **A consistent page pattern across EQs**: Summary → Reference → one or more Indicator Analysis pages → Resources.
  - **Summary** — landing page aggregating the EQ's headline indicators.
  - **Reference** — maps each Indicator covered by the EQ to its corresponding report page.
  - **Indicator Analysis pages** — one or more per Indicator; these carry the filters described below.
  - **Resources** — context and links for the Essential Question; not filterable.

## Filtering Conventions

Shared across Indicator Analysis pages, though not every filter appears on every page:

- **Organization** — SEA / LEA / K–12 School (only one level viewable at a time)
- **Disaggregates** — Race & Ethnicity (default), Gender, Disability Status, Economic Disadvantage, English Learner,
  Foster Care, Homelessness, Neglected/Delinquent status, Urbanicity
- **Cohort / School Year** — defaults to Current Year; selectable for trend comparisons
- **Grade Level** — 11th vs. 12th grade, where applicable
- **Course Type** — AP / IB / Dual Credit / Assessment, where applicable

Filters apply per-page only — they are not synced across the whole report.

## Interaction Pattern

Clicking an individual disaggregate bar (e.g., a specific race/ethnicity value) cross-highlights that subgroup: the
upper-left summary tile compares the subgroup to the overall result, and the upper-right trend line narrows to that
subgroup only.

## Shared Assets

Theme and logo live in [`PowerBI/assets`](../PowerBI/assets) and are referenced by every EQ report for visual
consistency.
