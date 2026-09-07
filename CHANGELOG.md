# Changelog

## [5.0.0] - 2026-09-05

### Added
- Compensation-timing outcomes: issue-to-event delay, maturity lead, 7/30/60/90-day relief, and relief-days.
- Formula-variant timing correlations and buyer-specific timely-relief selection tests.
- Exact 250-word abstract, expanded Chapter 8 applications, and a more thorough conclusion.
- Mendeley Data citation DOI 10.17632/28rbmvwsm9.1.
- `scripts/timing/analyze_compensation_timing.py`, aggregate timing outputs, documentation, and release tests.

### Changed
- Reframed the public repository around prospective relief and timing rather than accounting continuity.
- Updated paper artifacts and results workbook to v5.0.0.

### Interpretation
- CCA ranks the incidence and amount of timely compensation better than the exact conditional event date.
- A compensation event is not necessarily a creditor cash-receipt date.

## 4.0.0 - 2026-09-03

- Replaced independently restarted future windows with one continuous residual-state stream for each outcome environment.
- Implemented the January-February bridge rule: each invoice identifier enters once, bridge consumption is permanent, and only residual balance carries forward.
- Added source-fragment issue-cohort attribution and boundary non-reuse audits.
- Re-estimated Q1-Q4 2022 and Q1-Q4 2023 frozen-origin results using bridge-adjusted labels.
- Added all 2022-2023 month windows and sixteen pre-specified weekly samples.
- Re-estimated week, month, quarter, semester, and year horizon comparisons.
- Added bridge-increment diagnostics and period-end versus post-bridge rank comparisons.
- Added cycle/path annual reconciliation against the companion algorithm paper.
- Reframed Q4 2022 solely as part of the unusually cycle-saturated second half of 2022.
- Replaced the manuscript, workbook, documentation, metadata, tests, and public-release verifier.
- Removed commercial row-level data from the public GitHub package and retained a controlled-data reproduction workflow.

## 3.0.0 - 2026-09-03

- Added the first repeated frozen-origin Q4 2022 and Q1-Q4 2023 horizon study.
- That version rebuilt future windows independently and is superseded for scientific use by v4.0.0.

## 2.0.0 - 2026-08-25

- Reframed the repository around predictive validation of CCA rather than algorithm comparison.

## 1.0.0 - 2026-07-14

- Initial public reproducibility package for the 2021 aggregate-edge experiments.
