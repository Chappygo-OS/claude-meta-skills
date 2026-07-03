---
name: market-report-docx
description: >
  Word (DOCX) marketing report for client delivery. Requires: pip install python-docx.
---

# DOCX Marketing Report Generator

## Skill Purpose
Generate a professional, client-ready Microsoft Word (.docx) marketing report using Python's `python-docx` library. This skill collects all available audit and analysis data, generates a branded Word document with cover page, formatted tables, styled headings, score breakdowns, detailed findings, competitor comparisons, revenue impact estimates, and a prioritized action plan.

## When to Use
- User wants a Word/DOCX version of the marketing report
- User needs an editable document (unlike PDF which is read-only)
- User wants to customize the report before sending to a client
- User is preparing a deliverable that the client may want to edit or translate
- Triggered by `/market report-docx` or `/market report-docx <domain>`

## When to Use DOCX vs PDF vs Markdown

| Format | Best For | Pros | Cons |
|---|---|---|---|
| **DOCX** | Client deliverables that need editing, proposals, agency white-labeling | Editable, professional formatting, tables, widely compatible, printable | Requires python-docx |
| **PDF** | Final presentations, email attachments, read-only deliverables | Consistent formatting, visual charts, tamper-proof | Not editable, requires reportlab |
| **Markdown** | Internal use, quick reference, iterative editing, version control | Easy to edit, readable, git-friendly | Less visually polished |

**Rule of thumb:** If the client needs to edit, translate, or white-label the report → DOCX. If it's a final read-only deliverable → PDF. If it's for internal reference → Markdown.

## Prerequisites

```bash
pip install python-docx
```

Verify installation:
```bash
python3 -c "import docx; print('python-docx ready')" 2>/dev/null || python -c "import docx; print('python-docx ready')"
```

## How to Execute

### Step 1: Collect All Available Data

Gather data from all previous skill runs. Check for these files in the current directory or client folder:

**Primary data sources:**
- `MARKETING-AUDIT.md` — from `/market audit`
- `LANDING-CRO.md` — from `/market landing`
- `SEO-AUDIT.md` — from `/market seo`
- `BRAND-VOICE.md` — from `/market brand`
- `COMPETITOR-ANALYSIS.md` — from `/market competitors`
- `FUNNEL-ANALYSIS.md` — from `/market funnel`
- `SOCIAL-AUDIT.md` — from `/market social`
- `EMAIL-AUDIT.md` — from `/market emails`
- `AD-AUDIT.md` — from `/market ads`

**If no previous data exists:**
1. Recommend running `/market audit <url>` first
2. If user insists, analyze the URL directly and build the report from scratch
3. Be transparent about data sources used

### Step 2: Generate the DOCX Using Python

Write a Python script that uses `python-docx` to create the report. The script should be saved alongside the output for reproducibility.

**Script location:** Save as `generate_docx.py` in the client folder.

#### Required Document Structure

The DOCX must include these sections in order:

---

#### Page 1: Cover Page

```python
# 6 blank paragraphs for vertical centering
# Title: "MARKETING AUDIT" — 36pt, bold, dark navy (#2C3E50)
# Subtitle: "{Brand Name}" — 24pt, blue (#3498DB)
# URL — 12pt, gray (#7F8C8D)
# Score: "Score Global: {X}/100" — 28pt, bold, color-coded
# Grade: "Grade: {letter}" — 18pt, color-coded
# Metadata: date, business type, generator credit — 10pt, gray
# Page break
```

**Score color coding:**
| Score Range | Color | Grade |
|---|---|---|
| 85-100 | Green (#27AE60) | A |
| 70-84 | Blue (#2980B9) | B |
| 55-69 | Orange (#F39C12) | C |
| 40-54 | Red (#E74C3C) | D |
| 0-39 | Dark Red (#C0392B) | F |

#### Page 2: Table of Contents

List all major sections with numbering. Use `doc.add_paragraph()` with consistent formatting.

#### Page 3: Executive Summary

- 2-3 paragraphs summarizing: overall score, biggest strength, biggest gap, top 3 actions, estimated revenue impact
- Use bold for key metrics and findings
- Include bullet list of priority actions with `style='List Bullet'`

#### Page 4: Score Breakdown Table

Use a formatted table with:
- Dark header row (#2C3E50 background, white text)
- Alternating row shading (#F8F9FA)
- Columns: Categorie | Score | Poids | Score Pondere | Constat Cle
- Bold total row

```python
def add_styled_table(doc, headers, rows):
    table = doc.add_table(rows=1 + len(rows), cols=len(headers))
    table.style = 'Table Grid'
    # Style header row: dark background, white bold text
    # Style data rows: alternating shading
    # Bold the total/summary row
```

#### Pages 5-6: Quick Wins + Strategic Recommendations

For each recommendation:
- Numbered bold title
- Indented description paragraph with details, impact estimate, and timeline
- Use `paragraph_format.left_indent = Cm(1)` for indentation

#### Pages 7-12: Detailed Analysis by Category

For each of the 6 categories:
- H1 heading with score: "Analyse Detaillee — {Category} ({score}/100)"
- H2 subheadings for each analysis dimension
- Body paragraphs with findings
- Bullet lists for strengths and weaknesses using `style='List Bullet'`

#### Page 13: Competitor Comparison

- Formatted comparison table (same styling as score breakdown)
- Include all competitors identified during audit
- Rows for key comparison dimensions

#### Page 14: Revenue Impact Summary

- Table with columns: Recommandation | Impact Mensuel Est. | Confiance | Timeline
- Green-shaded total row (#D5F5E3)
- Bold total potential

#### Final Page: Next Steps

- Three subsections: Cette Semaine, Ce Mois-ci, Ce Trimestre
- Bullet lists of prioritized action items
- Footer: "Generated by AI Marketing Suite"

---

### Step 3: Document Styling Specifications

#### Page Setup
```python
section.top_margin = Cm(2)
section.bottom_margin = Cm(2)
section.left_margin = Cm(2.5)
section.right_margin = Cm(2.5)
```

#### Font Defaults
```python
style = doc.styles['Normal']
style.font.name = 'Calibri'
style.font.size = Pt(11)
style.font.color.rgb = RGBColor(44, 62, 80)  # Dark navy
```

#### Heading Styles
```python
for level in range(1, 4):
    h = doc.styles[f'Heading {level}']
    h.font.color.rgb = RGBColor(44, 62, 80)
    h.font.name = 'Calibri'
```

#### Table Styling Helper
```python
from docx.oxml.ns import qn

def set_cell_shading(cell, color_hex):
    """Apply background color to a table cell."""
    shading = cell._element.get_or_add_tcPr()
    shading_elem = shading.makeelement(qn('w:shd'), {
        qn('w:fill'): color_hex,
        qn('w:val'): 'clear',
    })
    shading.append(shading_elem)
```

### Step 4: Run the Script

```bash
cd "<client-folder>"
python generate_docx.py
```

### Step 5: Verify Output

```bash
ls -la "MARKETING-AUDIT.docx"
```

Report the file path and size to the user.

## Output

- **File:** `MARKETING-AUDIT.docx` (or `MARKETING-REPORT-<domain>.docx`)
- **Location:** Client folder or project root
- **Size:** Typically 50KB-200KB
- **Pages:** 12-18 pages depending on content volume
- **Compatibility:** Microsoft Word, Google Docs, LibreOffice Writer

## Language Support

The report should be written in the **same language as the target website**:
- French websites → French report
- English websites → English report
- Spanish websites → Spanish report

Detect the language during the audit phase and maintain consistency throughout.

## Customization Points

The generated script (`generate_docx.py`) can be customized by the user or agency:

| Element | How to Customize |
|---|---|
| Brand colors | Change RGBColor values in the script |
| Logo | Add `doc.add_picture('logo.png', width=Inches(2))` to cover page |
| Font | Change `style.font.name` to any system font |
| Agency name | Add to cover page and footer |
| Sections | Add/remove sections by modifying the script |

## Integration with Other Skills

This skill works best when combined with other audit skills:

1. `/market audit <url>` → Generates comprehensive audit data
2. `/market competitors <url>` → Adds competitor comparison data
3. `/market seo <url>` → Adds detailed SEO findings
4. `/market brand <url>` → Adds brand voice analysis
5. `/market report-docx <url>` → Compiles everything into a Word document

The DOCX generator automatically looks for output files from these skills and incorporates their data.

## Workflow Example

```
# Full audit + DOCX report
/market audit https://example.com
/market report-docx https://example.com

# Or generate DOCX from scratch (will run audit internally)
/market report-docx https://example.com
```

## Key Principles

- The DOCX report is the most versatile client deliverable — editable, translatable, and white-label ready
- Always use `python-docx` (not pandoc) for maximum control over formatting and styling
- Generate a self-contained Python script alongside the DOCX so the report can be regenerated or customized
- Every table must have styled headers (dark background, white text) and alternating row colors
- Keep the executive summary tight — 2-4 paragraphs maximum
- All scores must be justified by specific findings in the detailed analysis
- Include page breaks between major sections for clean printing
- The report should tell a story: current state → opportunities → action plan → expected impact
