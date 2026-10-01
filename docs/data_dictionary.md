# Data Dictionary / Dicionário de Dados

## Derived columns / Colunas derivadas

### dif

**PT**
1. `dif = VAL_TOT - VAL_SH - VAL_SP`
2. Parte do valor total que não está em SH nem SP. Equivale à soma dos complementos federal e do gestor (`VAL_SH_FED + VAL_SP_FED + VAL_SH_GES + VAL_SP_GES`).
3. Validada com dados do RJ, de 2023 a 2025: resíduo zero em todos os 33 meses. Faltam jun/2023, ago/2023 e jul/2024, que não existem na fonte.

**EN**
1. `dif = VAL_TOT - VAL_SH - VAL_SP`
2. The part of the total value that is not in SH or SP. It equals the sum of the federal and local-manager supplements (`VAL_SH_FED + VAL_SP_FED + VAL_SH_GES + VAL_SP_GES`).
3. Validated with Rio de Janeiro data, 2023 to 2025: zero residual in all 33 months. Jun/2023, Aug/2023 and Jul/2024 are missing because they do not exist in the source.

  ## Limitations / Limitações

### Data completeness / Completude dos dados

#### PT
Escopo: internações do SIH (grupo RD) do Rio de Janeiro, com saídas de 2023 a 2025.
1. Cobertura: 33 de 36 meses disponíveis (91,7%).
2. Meses ausentes: jun/2023, ago/2023 e jul/2024. Eles não constam no catálogo do DATASUS, ou seja, a lacuna é da fonte e não de falha no download.
3. Efeito na análise: esses meses estão ausentes, não zerados. Totais anuais de 2023 e 2024 ficam subestimados, e as séries mensais têm buracos.
4. Verificado em 27/09/2026.

#### EN
Scope: SIH hospital admissions (RD group) for Rio de Janeiro, with discharges from 2023 to 2025.
1. Coverage: 33 of 36 months available (91.7%).
2. Missing months: Jun/2023, Aug/2023 and Jul/2024. They are not listed in the DATASUS catalog, so the gap comes from the source, not from a download failure.
3. Effect on the analysis: these months are missing, not zero. Annual totals for 2023 and 2024 are understated, and monthly series have gaps.
4. Checked on 2026-09-27.
