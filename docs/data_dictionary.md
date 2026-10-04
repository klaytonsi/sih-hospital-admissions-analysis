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

### eh_internacao

#### PT
- **Fórmula:** `ROW_NUMBER() OVER (PARTITION BY N_AIH ORDER BY dt_saida DESC, ANO_CMPT DESC, MES_CMPT DESC) = 1`
- **Significado:** vale 1 na última linha de cada N_AIH (saída mais recente) e 0 nas demais. Uma internação pode ter várias linhas; esta coluna marca a que conta como a internação. Use-a para contar internações e óbitos. Para somar valores (`val_tot`), use todas as linhas.
- **Validação:** a soma de `eh_internacao` (2.248.946) é igual ao número de N_AIH distintos no recorte. Óbitos: 144.682 na linha marcada contra 144.684 em todas as linhas (diferença de 2).

#### EN
- **Formula:** `ROW_NUMBER() OVER (PARTITION BY N_AIH ORDER BY dt_saida DESC, ANO_CMPT DESC, MES_CMPT DESC) = 1`
- **Meaning:** 1 on the last row of each N_AIH (latest discharge date), 0 on the others. One hospitalization can have several rows; this column flags the one that counts as the hospitalization. Use it to count hospitalizations and deaths. To sum amounts (`val_tot`), use all rows.
- **Validation:** the sum of `eh_internacao` (2,248,946) equals the number of distinct N_AIH in the study window. Deaths: 144,682 on the flagged row vs 144,684 across all rows (difference of 2).

### flag_valor_zero

#### PT
- **Fórmula:** `val_tot = 0`
- **Significado:** vale 1 quando o valor total da AIH (`val_tot`) é zero e 0 nas demais. As linhas não foram apagadas. Para contar internações, use todas as linhas. Para médias de custo, use só `flag_valor_zero = 0`, porque os zeros puxariam a média para baixo.
- **Validação:** 8.986 linhas com valor zero (cerca de 0,4% das 2.270.016 do recorte). Não há valores negativos.

#### EN
- **Formula:** `val_tot = 0`
- **Meaning:** 1 when the total AIH amount (`val_tot`) is zero, 0 otherwise. Rows were not removed. To count hospitalizations, use all rows. For average cost, use only `flag_valor_zero = 0`, because zeros would pull the average down.
- **Validation:** 8,986 rows with zero amount (about 0.4% of the 2,270,016 in the study window). There are no negative values.

### flag_aih_repetida

#### PT
- **Fórmula:** `COUNT(*) OVER (PARTITION BY N_AIH) > 1`
- **Significado:** vale 1 em todas as linhas de uma N_AIH que aparece 2 ou mais vezes no recorte, e 0 nas N_AIH que aparecem uma vez. Não são cópias exatas: nenhuma N_AIH repetida tem a mesma data de saída em todas as linhas. As linhas não foram apagadas. Para contar internações, use `eh_internacao = 1`; para somar valores, use todas as linhas. Observação: as linhas marcadas têm permanência média de 24,9 dias, contra 5,8 nas não marcadas.
- **Validação:** 26.357 linhas marcadas, de 5.287 números de AIH repetidos, o que dá 21.070 linhas excedentes (cerca de 0,9% das 2.270.016 do recorte). Dessas AIHs, 4.159 se repetem em competências diferentes e 1.128 na mesma competência.

#### EN
- **Formula:** `COUNT(*) OVER (PARTITION BY N_AIH) > 1`
- **Meaning:** 1 on every row of an N_AIH that appears 2 or more times in the study window, 0 on N_AIH that appear once. They are not exact copies: no repeated N_AIH has the same discharge date on all its rows. Rows were not removed. To count hospitalizations, use `eh_internacao = 1`; to sum amounts, use all rows. Note: flagged rows have an average stay of 24.9 days, versus 5.8 for unflagged rows.
- **Validation:** 26,357 flagged rows, from 5,287 repeated AIH numbers, giving 21,070 excess rows (about 0.9% of the 2,270,016 in the study window). Of these AIH, 4,159 repeat across different competence months and 1,128 within the same one.

## Limitations / Limitações

### Period scope / Recorte do período

#### PT

A análise considera internações com data de saída (`dt_saida`) entre 2023-01-01 e 2025-09-30. Saídas de out a dez/2025 foram excluídas: o SIH fatura a internação depois da saída (até 3 meses em 99,88% das AIHs dos arquivos baixados; o restante levou 4 a 5 meses) e só baixamos competências até dez/2025, então esses meses ficariam incompletos e mostrariam uma queda falsa. Também ficaram fora 39.398 saídas de 2022 faturadas em 2023. No total, 216.479 AIHs (8,71%) ficam fora da `rd_clean`; os arquivos brutos não foram alterados.

#### EN

The analysis covers hospitalizations with a discharge date (`dt_saida`) between 2023-01-01 and 2025-09-30. Discharges from Oct to Dec 2025 were excluded: SIH bills a hospitalization after discharge (within 3 months for 99.88% of AIHs in the downloaded files; the rest took 4 to 5 months), and we only downloaded billing months up to Dec 2025, so those months would be incomplete and show a false drop. Also excluded are 39,398 discharges from 2022 that were billed in 2023. In total, 216,479 AIHs (8.71%) are outside `rd_clean`; the raw files were not changed.

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
   
