# Arrow's Impossibility Theorem (Lean 4)

A Lean 4 / Mathlib formalization of **Arrow's impossibility theorem** (general
finite version): with finitely many voters and at least three alternatives,
every social welfare function satisfying **unanimity** and **independence of
irrelevant alternatives (IIA)** is **dictatorial**.

## Proof outline

The classical decisive-coalition argument:

1. **Definitions** (`Arrow/Basic.lean`): ballots as injective rankings, profiles,
   social welfare functions, unanimity, IIA, decisive coalitions, dictatorship.
2. **Field expansion** (`Arrow/FieldExpansion.lean`): weak decisiveness for one
   ordered pair of distinct alternatives (decisiveness on polarized profiles)
   is enough to make a coalition decisive for every such pair (via a third
   alternative, unanimity, and IIA).
3. **Group contraction** (`Arrow/GroupContraction.lean`): a decisive coalition
   with at least two voters contains a strictly smaller nonempty decisive
   coalition.
4. **Main theorem** (`Arrow/ArrowTheorem.lean`): the whole electorate is
   decisive by unanimity; contracting down to a singleton yields a dictator.

## Palomar packaging

- `Challenge.lean` / `Solution.lean`: statement/solution split for the Palomar
  Comparator.
- `comparator.json`, `formalization.yaml`: registry metadata.
- `scripts/verify-palomar.sh`: local audit (statement match, declaration kinds,
  axiom audit); `scripts/replica-palomar-verifier.sh`: closest local replica of
  the registry verifier.

## Build

Pinned to Lean/Mathlib `v4.35.0-rc2` (Palomar's minimum toolchain):

```bash
lake build
```

## Status

Submission-ready; see `formalization.yaml` for the audited scope, sorry count
(0 in the implementation), and axioms (`propext`, `Quot.sound`,
`Classical.choice` only).
