PYTHON ?= python
CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra -pedantic
SOURCE_ARCHIVE ?=
CONTROLLED_ROOT ?=
WORKDIR ?= build/controlled_reproduction
TIMING_OUT ?= build/timing_results
PAPER = paper/CCA_Compensability_Timing_Applications_2022_2023.tex

.PHONY: verify test lint build-engines paper reproduce-controlled reproduce-timing clean

verify:
	$(PYTHON) scripts/verify_current_release.py

test:
	pytest

lint:
	ruff check scripts src tests
	$(PYTHON) -m compileall -q scripts src tests

build-engines:
	mkdir -p bin
	$(CXX) $(CXXFLAGS) cpp/enumerate_cycles_bounded.cpp -o bin/enumerate_cycles_bounded
	$(CXX) $(CXXFLAGS) cpp/full_tranche_engine.cpp -o bin/full_tranche_engine
	$(CXX) $(CXXFLAGS) cpp/rolling_bridge_engine.cpp -o bin/rolling_bridge_engine

paper:
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error $(notdir $(PAPER))
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error $(notdir $(PAPER))

reproduce-controlled: build-engines
	@test -n "$(SOURCE_ARCHIVE)" || (echo "Set SOURCE_ARCHIVE=/absolute/path/archive.csv" >&2; exit 2)
	bash scripts/bridge_correct/reproduce_controlled.sh "$(SOURCE_ARCHIVE)" "$(WORKDIR)"

reproduce-timing:
	@test -n "$(CONTROLLED_ROOT)" || (echo "Set CONTROLLED_ROOT=/absolute/path/controlled-repository" >&2; exit 2)
	$(PYTHON) scripts/timing/analyze_compensation_timing.py --controlled-root "$(CONTROLLED_ROOT)" --output-dir "$(TIMING_OUT)" --data-end 2024-02-08

clean:
	rm -rf bin build .pytest_cache
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
