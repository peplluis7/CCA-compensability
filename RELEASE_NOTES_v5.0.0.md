# Release notes - v5.0.0

## Scope

This release adds compensation-timing validation to the CCA prospective-relief study. It does not change the underlying frozen-origin relief results or turn the two compensation environments into an algorithm comparison.

## Scientific additions

1. **Timely relief.** Reports attributed PMR occurring within 7, 30, 60, and 90 days of invoice issue.
2. **Maturity lead.** Reports the number of days between the attributed compensation event and contractual maturity.
3. **Relief-days.** Weights PMR by remaining maturity days, capped at 365 days, to represent the duration of gross exposure avoided.
4. **Predictive tests.** Evaluates CPM, Raw CCA, Log-CCA, square-root CCA, capped CCA, and leave-one-relation-out CCA against timing outcomes.
5. **Buyer choice.** Tests whether the highest frozen Log-CCA relation captures the buyer-specific best timely relief.
6. **Interpretive boundary.** Explicitly distinguishes claim transformation from cash receipt and exact event-time prediction.
7. **Applications.** Expands the research agenda to circular supply chains, industrial symbiosis, public-sector networks, SME ecosystems, resilience, agentic coordination, and responsible deployment.

## Reproducibility

The new script `scripts/timing/analyze_compensation_timing.py` regenerates all timing CSV and JSON outputs from the authorized controlled repository. The public release includes only aggregate timing results.

## Data citation

Esteva de la Rosa, Peplluis (2026), *Atomic Common-Day Invoice Clearing: Pseudonymized Invoice Records and Reproducibility Data, 2012-2023*, Mendeley Data, V1. https://doi.org/10.17632/28rbmvwsm9.1
