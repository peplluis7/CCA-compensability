# CCA-compensability
Ex ante prediction of payable relief and compensation timing from temporal invoice networks using CCA, validated on 2012–2023 invoice data.


[![Tests](https://github.com/OWNER/cca-compensability-experiments/actions/workflows/ci.yml/badge.svg)](https://github.com/OWNER/cca-compensability-experiments/actions/workflows/ci.yml)
[![Release verification](https://github.com/OWNER/cca-compensability-experiments/actions/workflows/current-release.yml/badge.svg)](https://github.com/OWNER/cca-compensability-experiments/actions/workflows/current-release.yml)
[![Code license: MIT](https://img.shields.io/badge/code%20license-MIT-blue.svg)](LICENSE)

This repository accompanies **“Ex Ante Estimation of Payable Relief and Compensation Timing for Supplier Selection: Frozen-Origin Evidence from Weekly to Annual Horizons, 2022-2023.”** Release **v5.0.0** extends the prospective CCA study from relief amount to the likely timing of compensation or claim transformation, while preserving the Q1-Q4 2022 and Q1-Q4 2023 frozen-origin sequence and the weekly, monthly, quarterly, semester, and annual horizon comparison.

The scientific object is the predictive validity and decision value of the **Compensability Capacity Assessment (CCA)**. Cycle-restricted and path-enabled clearing are two independent maturity-aware environments used to generate outcome labels. They are not the technologies compared by this study, and their separately generated totals are never interpreted as one jointly executable settlement total.

## Primary data citation

> Esteva de la Rosa, Peplluis (2026), *Atomic Common-Day Invoice Clearing: Pseudonymized Invoice Records and Reproducibility Data, 2012-2023*, Mendeley Data, Version 1. https://doi.org/10.17632/28rbmvwsm9.1

The analytical sequence contains 749,952 invoices issued during 2012-2023. Public redistribution and use remain subject to the dataset's license and the privacy limits described in [`DATA_LICENSE.md`](DATA_LICENSE.md).

## Main prospective relief result

Frozen scores use the preceding nine months. Seven quarters from Q1 2022 through Q3 2023 have complete follow-up; Q4 2023 is retained only as right-censored evidence.

| Result across seven complete quarters | Value |
|---|---:|
| Median Log-CCA Spearman with future integrated relief | **0.638** |
| Median Log-Pearson | **0.632** |
| Median future relief carried by persistent relations | **93.5%** |
| Median buyer-specific best relief captured | **92.5%** |
| Median uplift over the buyer-specific mean candidate | **348.4%** |

Q4 2022 is not treated as a singular success. It is noted only as part of an unusually reciprocal and cycle-saturated second half of 2022. The full sequence of quarter tests is the evidential basis.

## New compensation-timing results

The timing analysis joins source-fragment outcome attribution to each invoice's issue date and due date. It reports:

- issue-to-event delay;
- days remaining to contractual maturity;
- relief generated within 7, 30, 60, and 90 days;
- **relief-days**, defined as attributed relief multiplied by remaining days to maturity, capped at 365 days;
- buyer-specific selection performance for thirty-day relief and relief-days.

Across the seven complete quarters:

| Timing result | Path-enabled | Cycle-restricted |
|---|---:|---:|
| PMR-weighted mean issue-to-event delay | 4.0 days | 3.6 days |
| PMR-weighted median issue-to-event delay | 0 days | 0 days |
| Mean days before contractual maturity | 16.0 days | 15.4 days |
| Relief generated within 7 days | 89.4% | 90.8% |
| Relief generated within 30 days | 94.0% | 95.9% |
| Relief generated within 60 days | 99.6% | 99.4% |

For the integrated opportunity target, frozen Log-CCA has median Spearman correlations of **0.564** with thirty-day relief and **0.566** with relief-days. The highest Log-CCA quartile has a **96.5%** median incidence of positive thirty-day compensation, versus **57.6%** in the lowest quartile. Highest-Log-CCA supplier selection captures a median **94.7%** of buyer-specific best thirty-day relief and produces a **307.6%** uplift over the mean candidate.

The exact conditional waiting-time association is weaker: median Spearman is **0.209** for the integrated target after conditioning on eventual positive relief. CCA should therefore be interpreted as ranking the likelihood and amount of timely compensation opportunity, not as forecasting an exact payment date.

A compensation event is the date on which an admissible operation extinguishes or transforms an attributed claim in the experimental ledger. For path operations that create a settlement instruction, this is not necessarily the date on which cash reaches the creditor. Claims about days-sales-outstanding, funding cost, or receipt time require direct operational payment-finality data.

## Formula interpretation

- **CPM** is the transparent, size-neutral structural kernel.
- **Raw CCA** uses an unrestricted capacity multiplier and is vulnerable to heavy-tailed firm scale.
- **Square-root CCA** and **capped CCA** are alternative concave capacity adjustments.
- **Log-CCA** is the preferred operational specification: it is strongest for thirty-day relief among the tested integrated timing variants and retains most of CPM's relief-days signal.
- **Leave-one-relation-out CCA** is a diagnostic for mechanical use of the focal relation in capacity, not the preferred production score.

## Forecast-horizon interpretation

The amount analysis remains positive from week to year. The practical recommendation is:

- quarterly recalibration for the main supplier-ranking model;
- monthly drift monitoring;
- weekly exception diagnostics;
- semester portfolio review;
- annual strategic exposure analysis, interpreted cautiously because only one fully observed annual origin is available.

## Methodological continuity

The controlled workflow maintains one auditable chronological residual state for each outcome environment. Every invoice identifier is introduced once, consumed capacity is never restored, and only residual amounts remain available later. This is an accounting and reproducibility requirement in the methodology, not a substantive hypothesis or headline result.

## Repository map

- `paper/` - A4 portrait manuscript, PDF, results workbook, figures, and table fragments.
- `results/current/` - public aggregate relief and timing results.
- `results/audit/` - aggregate continuity and accounting audits.
- `scripts/bridge_correct/` - controlled-data state construction and prospective relief analysis.
- `scripts/timing/` - compensation-timing aggregation and validation.
- `cpp/` - C++17 bounded-cycle and continuous-state outcome engines.
- `tests/` - release, timing, privacy, methodology, and paper-artifact tests.
- `metadata/` - machine-readable expected metrics and release metadata.
- `data/` - source citation, access boundary, and synthetic fixtures only.

## Verify the public release

```bash
python -m pip install -e .[dev]
python scripts/verify_current_release.py
pytest
make build-engines
```

These commands verify the checked-in aggregate results and compile the engines. Exact row-level reproduction additionally requires authorized access to the pseudonymized source and contribution logs.

## Reproduce the timing extension in an authorized environment

```bash
python scripts/timing/analyze_compensation_timing.py \
  --controlled-root /absolute/path/to/controlled-repository \
  --output-dir build/timing-results \
  --data-end 2024-02-08
```

The controlled root must contain `data/atomic/atomic_invoices_2012_2024.csv`, `data/outcomes/{path,cycle}/cohort_contributions.csv`, and `data/analysis/panels/Q*_panel.csv`.

## Data, software, and manuscript rights

The MIT license applies to the software only. It does not grant rights to the invoice data, manuscript, or third-party materials. Do not publish reversible identity maps or commercially sensitive row-level topology without authorization.
