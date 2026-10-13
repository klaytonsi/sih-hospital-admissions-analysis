-- EN: Requires view rd_clean (created in notebooks/01_download_clean_sih.ipynb)
-- PT: Requer a view rd_clean (criada em notebooks/01_download_clean_sih.ipynb)--
EN: Q1 - Spending by component, by discharge month and by year
-- PT: P1 - Gasto por componente, por mês de saída e por ano
-- EN: Window: discharges 2023-01-01 to 2025-09-30; 33 of 36 billing months available
--     (missing at source: Jun/2023, Aug/2023, Jul/2024). Totals for 2023/2024 are understated.
-- PT: Recorte: saídas de 01/01/2023 a 30/09/2025; 33 de 36 meses de faturamento disponíveis
--     (ausentes na fonte: jun/2023, ago/2023, jul/2024). Totais de 2023/2024 ficam subestimados.
-- EN: Sum uses ALL rows (project rule). ICU is inside SH+SP, shown as "of which".
-- PT: Soma usa TODAS as linhas (regra do projeto). UTI está dentro de SH+SP, mostrada como "dos quais".

WITH mensal AS (
    SELECT
        DATE_TRUNC('month', dt_saida)::DATE AS mes_saida,
        SUM(TRY_CAST(VAL_SH AS DOUBLE))     AS val_sh,
        SUM(TRY_CAST(VAL_SP AS DOUBLE))     AS val_sp,
        SUM(TRY_CAST(VAL_SH_FED AS DOUBLE) + TRY_CAST(VAL_SP_FED AS DOUBLE)
          + TRY_CAST(VAL_SH_GES AS DOUBLE) + TRY_CAST(VAL_SP_GES AS DOUBLE)) AS val_compl,
        SUM(TRY_CAST(VAL_UTI AS DOUBLE))    AS val_uti_dos_quais,
        SUM(val_tot)                        AS val_total
    FROM rd_clean
    GROUP BY 1
)
SELECT
    EXTRACT(year FROM mes_saida)::INT AS ano,
    ROUND(SUM(val_sh) / 1e6, 2)            AS sh_mi,
    ROUND(SUM(val_sp) / 1e6, 2)            AS sp_mi,
    ROUND(SUM(val_compl) / 1e6, 2)         AS compl_mi,
    ROUND(SUM(val_total) / 1e6, 2)         AS total_mi,
    ROUND(SUM(val_uti_dos_quais) / 1e6, 2) AS uti_dos_quais_mi,
    ROUND(SUM(val_total - val_sh - val_sp - val_compl), 2) AS residuo
FROM mensal
GROUP BY 1
ORDER BY 1;
