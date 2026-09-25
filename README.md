# SIH Hospital Admissions Analysis (SUS/DataSUS)

🚧 **Status: in progress / em construção**

## 🇬🇧 English

### Overview
Data analysis project using public hospital admissions data from Brazil's
public health system (SUS), sourced from SIH/DataSUS. Focus: State of Rio
de Janeiro, 2023–2025.

### Business questions
1. Spend by admission component, month by month and per year
2. ICD-10 chapters with the most admissions and yearly variation
3. Diagnoses and procedures with highest total value and highest average cost
4. Hospital mortality rate and number of deaths by diagnosis and municipality
5. Total spend per hospital and per municipality

### Tools
- **SQL**: DuckDB (Google Colab)
- **Python**: Google Colab (data download and export)
- **Dashboard**: Looker Studio

### Repository structure

notebooks/       Jupyter notebooks (data download, cleaning, export)
sql/              SQL queries (DuckDB)
data/processed/   Aggregated, processed data (no individual records)
docs/             Data dictionary and dashboard screenshots

### Data source
DataSUS – SIH (Sistema de Informações Hospitalares), public and open data.

---

## 🇧🇷 Português

### Visão geral
Projeto de análise de dados usando dados públicos de internações
hospitalares do Sistema Único de Saúde (SUS), extraídos do SIH/DataSUS.
Recorte: estado do Rio de Janeiro, 2023–2025.

### Perguntas de negócio
1. Gasto por componente da internação, mês a mês e por ano
2. Capítulos do CID-10 com mais internações e variação no ano
3. Diagnósticos e procedimentos com maior valor total e maior custo médio
4. Taxa de mortalidade hospitalar e número de óbitos por diagnóstico e município
5. Gasto total por hospital e por município

### Ferramentas
- **SQL**: DuckDB (Google Colab)
- **Python**: Google Colab (download e exportação dos dados)
- **Dashboard**: Looker Studio

### Estrutura do repositório

notebooks/       Notebooks Jupyter (download, limpeza, exportação)
sql/              Consultas SQL (DuckDB)
data/processed/   Dados processados e agregados (sem registros individuais)
docs/             Dicionário de dados e prints do dashboard

### Fonte dos dados
DataSUS – SIH (Sistema de Informações Hospitalares), dados públicos e abertos.

---

## License
MIT — see [LICENSE](LICENSE)
