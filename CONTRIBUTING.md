# Contributing

Contributions are welcome for code quality, tests, documentation, synthetic examples, and methodological extensions.

Before submitting a pull request:

1. run `python scripts/verify_current_release.py`;
2. run `pytest`;
3. run `python -m compileall -q scripts src tests`;
4. do not include commercial or row-level research data;
5. document any numerical change to checked-in release results;
6. preserve the distinction between the CCA research question and the two independent outcome environments.

Scientific result changes should be proposed against a new versioned release rather than silently replacing the current versioned aggregates.
