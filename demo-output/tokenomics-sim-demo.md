# Demo: /tokenomics-sim

Real output from running `/tokenomics-sim` on LendFlow Protocol's proposed token distribution.

## Input (user answers)

1. Total supply: 1,000,000,000 LEND
2. TGE price target: $0.02
3. Team: 20% | cliff: 12 months | linear vest: 24 months
4. Investors/seed: 15% | cliff: 6 months | linear vest: 18 months
5. Community/ecosystem: 35% | 5% airdrop at TGE, rest vested over 36 months
6. Treasury/DAO: 15% | 24-month linear vest, no cliff
7. Public IDO: 5% | 100% unlocked at TGE
8. Liquidity/exchange: 10% | unlocked at TGE
9. Expected 30-day average daily trading volume: $800,000

## Output

```
TOKENOMICS SCORECARD
LendFlow Protocol — LEND Token

Total Supply:          1,000,000,000
FDV at TGE:            $20,000,000
Circulating at TGE:    12% = 120,000,000 tokens = $2,400,000 mcap

DISTRIBUTION
Team:           20%  [FAIL]  threshold: at or below 15%
Investors:      15%  [WARN]  threshold: at or below 10%
Community:      35%  [FAIL]  threshold: at or above 40%
Treasury:       15%  [PASS]  threshold: 15 to 25%
Public/IDO:      5%  [INFO]
Liquidity:      10%  [INFO]

VESTING
Team cliff:      12 months  [PASS]  threshold: at or above 12 months
Investor cliff:   6 months  [PASS]  threshold: at or above 6 months
On-chain vesting: YES (Streamflow)  [PASS]

CIRCULATING SUPPLY AT TGE
12% circulating  [PASS]  threshold: at or below 15%
$2,400,000 circulating mcap

TOKEN UTILITY
Fee requirement:    NOT PROVIDED  [WARN]  — clarify whether LEND pays protocol fees
Governance effect:  NOT PROVIDED  [WARN]  — clarify whether governance votes execute on-chain
Yield source:       NOT PROVIDED  [WARN]  — clarify whether staking yield is protocol revenue or emissions

UNLOCK PRESSURE ANALYSIS
Unlock pressure = monthly unlocks / estimated monthly volume
Est. daily volume: $800,000 → monthly: $24,000,000

Month   Unlocking Tokens     Unlock Value    Pressure Ratio   Signal
1       5,000,000 (IDO+liq)  $100,000        0.004            LOW
3       6,944,444 (treasury) $138,889        0.006            LOW
6       6,944,444 (treasury) $138,889        0.006            LOW
        + investor cliff ends
        13,888,889 investors $277,778 spike  0.012            LOW-MEDIUM
12      13,888,889 (inv)     $277,778        0.012            LOW-MEDIUM
        + team cliff ends
        8,333,333 (team)     $166,667 spike  0.019            LOW-MEDIUM
18      22,222,222 combined  $444,444        0.019            LOW-MEDIUM
24      16,666,667 combined  $333,333        0.014            LOW

Note: Pressure ratios are LOW across all periods given estimated volume.
Risk materializes if actual trading volume is below $200,000/day.
Model this scenario: at $200k/day volume, month-12 spike = 0.075 — still LOW.
At $50k/day, month-12 spike = 0.30 — HIGH. Community liquidity is thin protection.

RECOMMENDATIONS

1. Team allocation at 20% FAILS the 15% threshold. Two options:
   a) Reduce team % to 15% and redistribute 5% to community (brings community
      from 35% to 40%, fixing the second FAIL simultaneously).
   b) Keep 20% but extend vesting to 36 months and document the rationale
      publicly before TGE.

2. Community at 35% FAILS the 40% threshold. Fix is linked to team fix above.
   Reallocating 5% from team to community resolves both flags in one change.

3. Investor allocation at 15% is a WARN. Acceptable with 6-month cliff and
   on-chain vesting. Publish the full investor schedule on tokenunlocks.app
   before TGE so community can verify.

4. Token utility answers are missing. Clarify and document before launch:
   - If LEND is optional for fees, demand is speculative — expect weaker price floor.
   - If governance is cosmetic, token value narrative weakens post-hype.
   - If yield is emissions only, there is inherent sell pressure from stakers.

On-chain vesting tools:
  Streamflow: https://streamflow.finance
  Valhalla: https://valhalla.so
  Magna: https://magna.so

Vesting schedule publication:
  Token Unlocks: https://tokenunlocks.app/request
```
