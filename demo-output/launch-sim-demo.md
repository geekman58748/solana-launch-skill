# Demo: /launch-sim

Real output from running `/launch-sim` on LendFlow Protocol's planned launch parameters.

## Input (user answers)

1. Total supply: 1,000,000,000 LEND
2. Circulating supply at launch: 120,000,000 tokens
3. Initial price target: $0.02
4. Initial LP value: $400,000 (combined both sides)
5. LP type: Standard (constant product)
6. Launch venue: Raydium
7. Jito bundles for LP creation: Yes
8. Expected launch day volume: $3,000,000
9. Largest expected single buy: $80,000

## Output

```
LAUNCH DAY SIMULATION
LendFlow Protocol — LEND/USDC

SETUP
Circulating supply:    120,000,000 tokens
Initial price:         $0.02
Circulating mcap:      $2,400,000
Initial LP value:      $400,000
LP type:               Standard (constant product x*y=k)
Circulating mcap / LP: 6.0x  [WARN]  threshold: at or below 3x preferred
Note: LP is thin relative to circulating supply. Price will move fast on
moderate volume. This is not a launch blocker but expect high volatility.

PRICE IMPACT — BUY
Buy $1,000:    +0.25% price impact  → new price $0.02005
Buy $5,000:    +1.24% price impact  → new price $0.02025
Buy $10,000:   +2.44% price impact  → new price $0.02049
Buy $50,000:   +11.1% price impact  → new price $0.02222
Buy $80,000:   +16.7% price impact  → new price $0.02334
Buy $100,000:  +20.0% price impact  → new price $0.02400

PRICE IMPACT — SELL
Sell 1% circ supply  (1,200,000 tokens / $24,000):   -5.7%  → price $0.01886
Sell 5% circ supply  (6,000,000 tokens / $120,000):  -23.1% → price $0.01538
Sell 10% circ supply (12,000,000 tokens / $240,000): -37.5% → price $0.01250

SNIPE RISK ASSESSMENT
Jito bundle: YES
Launch venue bot protection: MEDIUM (Raydium standard pool)

Snipe risk score: LOW-MEDIUM

Jito bundle protects your LP creation transaction from being front-run.
Your LP seeding is atomic — no sandwich attack on the initial pool creation.
Risk after LP creation: bots monitoring mempool can still buy in block 1.

Worst case (post-bundle snipe, 10% of LP value = $40,000 buy in block 1):
  Price impact: +9.09%
  Sniper entry advantage vs fair price: 9.1%
  Community buys at average price: ~$0.0218 post-snipe (9% premium)

With Jito protecting LP creation, this snipe window is narrow.
Standard Raydium pool has no additional anti-bot delay.
If this is a concern: consider Meteora Alpha Vault, which adds a
configurable delay between LP creation and public trading.

FIRST HOUR PROJECTION
Estimated launch day volume: $3,000,000
Estimated first-hour volume: $1,050,000  (35% of daily in first hour)

If first-hour volume materializes:
  LP fee revenue first hour: $3,150  (Raydium 0.3% fee)
  Note: Standard pool earns fees across full range — no out-of-range risk.

Price corridor, first hour, 1-sigma estimate:
  Low:  $0.0162  (-19% from initial) — if early sellers dominate
  High: $0.0281  (+40.5% from initial) — if buy pressure dominates
  At $3M daily volume, expect significant price discovery swings.

LP ADEQUACY
LP value:          $400,000
Circulating mcap:  $2,400,000
Ratio:             0.17x

WARN: LP is thin relative to circulating supply (6x mcap/LP).
Market standard for a healthy launch is 0.33x LP/mcap or better.
To reach 0.33x: seed $800,000 LP instead of $400,000.
To reach 0.5x: seed $1,200,000 LP.

Thin LP is not fatal but sets expectations correctly:
early buyers will move price significantly, which can attract momentum
traders. If community is large enough to absorb first-hour volatility,
thin LP accelerates price discovery. If community is small, whales
will dominate the pool.

RECOMMENDATIONS

1. Increase LP from $400,000 to at least $800,000 if possible. At $400k,
   a single $100k buy moves price 20%. Coordinated buys at launch will be
   volatile and create a bad experience for retail buyers.

2. Jito bundle is correctly configured — protect LP creation. Confirm your
   bundle is tested on devnet within 48 hours of launch.

3. Sell impact at 5% of circulating supply drops price 23%. Communicate to
   community that early volatility is expected and normal at this LP depth.
   Set a stale-price alert on your monitoring tool for >15% moves in 5 minutes.

4. If anti-snipe is a priority over pump.fun virality, switch venue to
   Meteora Alpha Vault. The configurable deposit window prevents block-1 sniping
   at the cost of less organic price discovery momentum.

For LP setup → skill/launch-day/LIQUIDITY-SEED.md
For anti-snipe config → skill/launch-day/JITO-BUNDLES.md
For venue comparison → skill/launch-day/LAUNCH-DECISION.md
```
