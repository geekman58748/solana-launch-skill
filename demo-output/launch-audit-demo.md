# Demo: /launch-audit

This is a real output from running `/launch-audit` on a fictional DeFi lending protocol, LendFlow, preparing to launch on Solana mainnet. The AI asked the 8 interview questions, received the answers below, and produced the report.

## Input (user answers)

1. SECURITY — Audited by OtterSec, completed March 2025. Two High findings resolved, one Medium accepted as known risk (no user funds affected path).
2. UPGRADE AUTHORITY — Squads multisig, 3-of-5 signers.
3. TOKEN CONTROLS — Mint authority burned. Freeze authority held by Squads multisig.
4. TOKENOMICS — 12% circulating at TGE. Team 20%, investors 15%. Vesting via Streamflow on-chain.
5. LIQUIDITY — $400,000 USDC seeding initial LP. Circulating mcap at launch price ($0.02) = $2,400,000. LP not locked yet — planning to lock after launch settles.
6. LEGAL — Cayman Islands foundation. No formal token legal opinion. US users geofenced from IDO.
7. COMMUNITY — 3,200 Discord members. Discord created 4 months before launch. DAU/MAU around 18%.
8. LAUNCH MECHANICS — Meteora Alpha Vault. Using Jito bundles for LP creation. Last devnet rehearsal was 6 days ago.

## Output

```
SOLANA LAUNCH READINESS REPORT
Generated: June 26, 2025

LAUNCH READINESS SCORE: 71/100

VERDICT: READY WITH CAUTIONS

GATE RESULTS

[PASS] SECURITY (25 pts)
  Audit firm: OtterSec
  Completed: March 2025 (3 months ago, within threshold)
  Critical findings: None
  High findings: 2 resolved
  Medium findings: 1 accepted — documented
  Score: 22/25
  Note: Accepted medium risk must be disclosed in documentation.

[PASS] UPGRADE AUTHORITY (20 pts)
  Authority type: Squads multisig, 3-of-5
  Score: 20/20
  Best practice met.

[WARN] TOKEN CONTROLS (15 pts)
  Mint authority: Burned — PASS
  Freeze authority: Squads multisig — WARN
  Score: 11/15
  Freeze authority via multisig can halt token transfers. Acceptable if
  disclosed clearly. Consider burning or communicating freeze power to community.

[FAIL] TOKENOMICS (15 pts)
  Circulating supply at TGE: 12% — PASS (threshold: at or below 15%)
  Team allocation: 20% — FAIL (threshold: at or below 15%)
  Investor allocation: 15% — WARN (threshold: at or below 10%)
  Vesting: Streamflow on-chain — PASS
  Score: 6/15
  Team + investor = 35% combined. High insider ownership is a red flag
  for community trust and token distribution optics.

[FAIL] LIQUIDITY (10 pts)
  LP value: $400,000
  Circulating mcap: $2,400,000
  LP ratio: 0.17x — PASS (threshold: at or above 1x not required, ratio is healthy)
  LP lock: NOT LOCKED — FAIL
  Score: 4/10
  No LP lock at launch is an auto-fail. Community cannot verify liquidity
  is committed. This is the #1 rug signal regardless of intent.

[WARN] LEGAL (10 pts)
  Entity: Cayman Islands foundation — PASS
  Token legal opinion: None — WARN
  US geofencing: Yes — PASS
  Score: 7/10
  No legal opinion is acceptable pre-launch but increases exposure.
  Prioritize within 60 days post-launch.

[PASS] COMMUNITY (5 pts)
  Discord: 3,200 members, 4 months old — PASS
  DAU/MAU: 18% — acceptable
  Score: 5/5

LAUNCH BLOCKERS (fix before launch)

1. LP LOCK — Lock LP before launch, not after. Use Streamflow or Raydium's
   built-in lock. Minimum 6 months recommended. "Planning to lock after launch"
   is indistinguishable from a rug to the market.

2. TEAM ALLOCATION — 20% to team exceeds the 15% threshold. Either reduce
   team allocation or extend vesting period to 36 months to justify the size.
   Document and publish the rationale before TGE.

CAUTIONS (address soon, not blocking)

1. Devnet rehearsal was 6 days ago — run a fresh one within 48 hours of mainnet
   launch. Meteora Alpha Vault parameters may have changed.

2. Freeze authority held by multisig — publish a clear disclosure to community
   explaining what conditions would trigger a freeze and who holds the keys.

3. No token legal opinion — acceptable now, prioritize post-launch.

4. Investor allocation at 15% (WARN threshold) — publish full vesting schedule
   on tokenunlocks.app before TGE.

NEXT STEPS
1. Lock LP today via Streamflow (streamflow.finance) — this is the launch blocker
   that will kill community trust if not resolved before announcement.
2. Run a devnet rehearsal within 48 hours of launch date.
3. Publish full token distribution and vesting schedule publicly.

For deep-dives, load:
  Tokenomics flags → skill/pre-launch/TOKENOMICS.md + /tokenomics-sim
  LP setup → skill/launch-day/LIQUIDITY-SEED.md + /launch-sim
  Legal baseline → skill/pre-launch/LEGAL-BASICS.md
```
