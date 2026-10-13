## Status
Concluído (escopo reduzido) / Completed (reduced scope)

---

## 🇧🇷 Resultados

**Recorte:** saídas de 01/01/2023 a 30/09/2025 (RJ, SIH/DataSUS, grupo RD). 33 de 36 meses de faturamento disponíveis (ausentes na fonte: jun/2023, ago/2023, jul/2024).

**Pergunta 1 – Gasto por componente:** o valor total fecha com Serviços Hospitalares (SH) + Serviços Profissionais (SP) + complementos federal e do gestor (resíduo zero). O valor de UTI está **dentro** de SH e SP, então não é somado como fatia separada. Os complementos quase não existem no início de 2023 e crescem até 2025, o que sugere mudança no registro/pagamento, não necessariamente aumento real de gasto.

**Limitações:** totais de 2023 e 2024 ficam subestimados pelos meses ausentes. 2025 tem só 9 meses.

**Aprendizados:** tratar duplicidade de AIH com flags, validar a decomposição de valores antes de usar, documentar lacunas da fonte e proteger colunas pessoais.

**Trabalhos futuros:** perguntas 2 a 5 e dashboard no Looker Studio.

**Como executar:** abra `notebooks/01_download_clean_sih.ipynb` no Google Colab, rode as células em ordem e depois `sql/01_gasto_por_componente.sql`. Instale as dependências com `pip install -r requirements.txt`.

---

## 🇬🇧 Results

**Scope:** discharges from 2023-01-01 to 2025-09-30 (Rio de Janeiro, SIH/DataSUS, RD group). 33 of 36 billing months available (missing at source: Jun/2023, Aug/2023, Jul/2024).

**Question 1 – Spending by component:** the total equals Hospital Services (SH) + Professional Services (SP) + federal and local-manager supplements (zero residual). ICU value is **inside** SH and SP, so it is not added as a separate slice. Supplements are almost absent in early 2023 and grow through 2025, suggesting a change in recording/payment rather than a real spending increase.

**Limitations:** 2023 and 2024 totals are understated due to missing months. 2025 has only 9 months.

**Learnings:** handling duplicate AIH records with flags, validating value decomposition before use, documenting source gaps, and protecting personal columns.

**Future work:** questions 2 to 5 and a Looker Studio dashboard.

**How to run:** open `notebooks/01_download_clean_sih.ipynb` in Google Colab, run the cells in order, then `sql/01_gasto_por_componente.sql`. Install dependencies with `pip install -r requirements.txt`.
