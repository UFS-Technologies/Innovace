'use strict';

/**
 * quotation_pdf_generator.js  –  Inovace Engineering
 *

 */

const { jsPDF } = require('jspdf');
require('jspdf-autotable');

// ─────────────────────────────────────────────────────────────────────────────
// UTILITIES
// ─────────────────────────────────────────────────────────────────────────────

function numberToWords(num) {
  const u = ['','ONE','TWO','THREE','FOUR','FIVE','SIX','SEVEN','EIGHT','NINE'];
  const t = ['TEN','ELEVEN','TWELVE','THIRTEEN','FOURTEEN','FIFTEEN',
             'SIXTEEN','SEVENTEEN','EIGHTEEN','NINETEEN'];
  const d = ['','','TWENTY','THIRTY','FORTY','FIFTY','SIXTY','SEVENTY','EIGHTY','NINETY'];
  if (!num || num === 0) return 'ZERO';
  function h(n) {
    let s = '';
    if (n > 99) { s += u[Math.floor(n/100)] + ' HUNDRED '; n %= 100; }
    if (n > 19) { s += d[Math.floor(n/10)] + ' '; n %= 10; }
    else if (n >= 10) return s + t[n - 10] + ' ';
    if (n > 0) s += u[n] + ' ';
    return s;
  }
  const cr = Math.floor(num / 10000000); num %= 10000000;
  const la = Math.floor(num / 100000);   num %= 100000;
  const th = Math.floor(num / 1000);     num %= 1000;
  let w = '';
  if (cr)  w += h(cr)  + 'CRORE ';
  if (la)  w += h(la)  + 'LAKH ';
  if (th)  w += h(th)  + 'THOUSAND ';
  if (num) w += h(num);
  return w.trim();
}

function fmt(n) {
  return (parseFloat(n) || 0).toLocaleString('en-IN',
    { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

function safeStr(v) { return v != null ? String(v) : ''; }

function formatDate(val) {
  if (!val) return '';
  const d = new Date(val);
  if (isNaN(d.getTime())) return String(val);
  return [
    String(d.getDate()).padStart(2, '0'),
    String(d.getMonth() + 1).padStart(2, '0'),
    d.getFullYear(),
  ].join('-');
}

function groupBy(arr, keyFn) {
  const map = new Map();
  for (const item of arr) {
    const k = keyFn(item);
    if (!map.has(k)) map.set(k, []);
    map.get(k).push(item);
  }
  return map;
}

// ─────────────────────────────────────────────────────────────────────────────
// MAIN GENERATOR
// ─────────────────────────────────────────────────────────────────────────────

const generateQuotationPdf = async (quotationData, customerDetails = {}) => {

  const doc = new jsPDF({ unit: 'mm', format: 'a4' });
  const pageWidth  = doc.internal.pageSize.getWidth();   // 210 mm
  const pageHeight = doc.internal.pageSize.getHeight();  // 297 mm

  const D = quotationData;

  const rawQuotNo = safeStr(D.Quotation_No);
  let dynamicPart = '';
  if (rawQuotNo.includes('/')) {
    const parts = rawQuotNo.split('/');
    dynamicPart = parts[2] || '';
  } else {
    dynamicPart = rawQuotNo;
  }
  const quotNo = `IE/FR/${dynamicPart}/26`;

  const entryDt = formatDate(D.EntryDate);

  const formatDateDDMMYYYY = (val) => {
    if (!val) return '';
    const d = new Date(val);
    if (isNaN(d.getTime())) return safeStr(val);
    const dd   = String(d.getDate()).padStart(2, '0');
    const mm   = String(d.getMonth() + 1).padStart(2, '0');
    const yyyy = d.getFullYear();
    return `${dd}-${mm}-${yyyy}`;
  };
  const validUpto = formatDateDDMMYYYY(D.ValidUpto);

  const clientName   = safeStr(customerDetails.Customer_Name  || '');
  const clientAddr   = safeStr(customerDetails.address        || '');
  const clientAddr3  = safeStr(customerDetails.Address3       || '');
  const clientPhone  = safeStr(customerDetails.Contact_Number || '');

  const projName  = safeStr(D.Product_Name || '');
  const location  = safeStr(D.WorkPlace    || '');

const category = safeStr(D.Category || '');
  const kindAttn  = safeStr(D.KindAttn     || '');
  const subject   = safeStr(D.Subject      || '');

  // Dynamic description from custom field 135
  let dynamicDescription = '';
  if (Array.isArray(D.custom_fields)) {
    const cf135 = D.custom_fields.find(f => f.id === 135 || f.id === '135');
    dynamicDescription = safeStr(cf135?.value || '');
  } else {
    dynamicDescription = safeStr(D.custom_field_135 || D.description_135 || '');
  }

  // ── Terms & Conditions from D.Terms_And_Conditions ────────────────────────
  const rawTerms = safeStr(D.Terms_And_Conditions || '');
  // Split by newline or semicolon, filter empty lines
  const termsLines = rawTerms
    .split(/\n|;/)
    .map(l => l.trim())
    .filter(Boolean);

  const taxable     = parseFloat(D.TaxableAmount)   || 0;
  const totalAmt    = parseFloat(D.TotalAmount)      || 0;
  const gstAmt      = parseFloat(D.TotalGSTAmount)   || 0;
  const netTotal    = parseFloat(D.NetTotal)         || 0;
  const discountAmt = Math.max(0, totalAmt - taxable - gstAmt);
  const preparedBy  = safeStr(D.Created_By_Name      || '');

  // Read GST % — use TotalGSTPercent from master, fallback to item level
  const gstPercent = parseFloat(D.TotalGSTPercent || D.GSTPercent || D.gst_percentage || 0);
  const showGstCol = gstPercent > 0;

  let rawDetails = D.quotation_details;
  if (typeof rawDetails === 'string') {
    try { rawDetails = JSON.parse(rawDetails); } catch { rawDetails = []; }
  }
  if (!Array.isArray(rawDetails)) rawDetails = [];

  const grouped = groupBy(rawDetails, item => item.CategoryId);

  const tableRows = [];
  let catCounter = 0;

  grouped.forEach((items, catId) => {
    catCounter++;
    const catName = items[0].CategoryName || `Category ${catId}`;
    tableRows.push({ type: 'group', sr: String(catCounter), label: catName });
    items.forEach((item, itemIndex) => {
      const unitPrice  = parseFloat(item.UnitPrice)  || 0;
      const qty        = parseFloat(item.Quantity)   || 0;
      // Use item-level GSTPercent for per-row GST calculation
      const itemGstPct = parseFloat(item.GSTPercent || D.TotalGSTPercent || 0);
      const subtotal   = unitPrice * qty;
      const itemGst    = showGstCol ? (subtotal * itemGstPct / 100) : 0;
      tableRows.push({
        type:     'item',
        sr:       `${catCounter}.${itemIndex + 1}`,
        desc:     safeStr(item.ItemName),
        qty:      safeStr(item.Quantity),
        units:    safeStr(item.Unit || ''),
        unitRate: unitPrice,
        gstPct:   itemGstPct,
        gstAmt:   itemGst,
        total:    subtotal,
      });
    });
  });

  const costSummaryRows = [];
  grouped.forEach((items, catId) => {
    const catName  = items[0].CategoryName || `Category ${catId}`;
    const catTotal = items.reduce(
      (s, it) => s + (parseFloat(it.UnitPrice) || 0) * (parseFloat(it.Quantity) || 0), 0
    );
    costSummaryRows.push({ label: catName, amount: catTotal });
  });

  // ═══════════════════════════════════════════════════════════════════════════
  // PAGE 1
  // ═══════════════════════════════════════════════════════════════════════════

  const P1_LEFT  = 18;
  const P1_RIGHT = pageWidth - 18;
  const P1_W     = P1_RIGHT - P1_LEFT;

  function drawPage1Footer(pageLabel) {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(7);
    doc.setTextColor(100, 100, 100);
    doc.text(pageLabel, pageWidth - 10, pageHeight - 5, { align: 'right' });
    doc.setTextColor(0, 0, 0);
  }

  // QUOTATION title
  doc.setFont(undefined, 'normal');
  doc.setFontSize(13);
  doc.text('QUOTATION', pageWidth / 2, 20, { align: 'center' });
  const qtW1 = doc.getTextWidth('QUOTATION');
  doc.setLineWidth(0.5);
  doc.setDrawColor(0, 0, 0);
  doc.line(pageWidth / 2 - qtW1 / 2, 21.5, pageWidth / 2 + qtW1 / 2, 21.5);
  doc.setLineWidth(0.6);
  doc.setDrawColor(222, 220, 215);
  doc.line(P1_LEFT, 25, P1_RIGHT, 25);
  doc.setDrawColor(0, 0, 0);

  // TO label
  doc.setFont(undefined, 'bold');
  doc.setFontSize(8.5);
  doc.text('TO :', P1_LEFT, 31);

  let toY = 37;
  const TO_LINE_H = 5;
  const TO_ADDR_W = 90;

  doc.setFont(undefined, 'bold');
  doc.setFontSize(9);
  doc.text(clientName, P1_LEFT, toY);
  toY += TO_LINE_H;

  if (clientAddr.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    const addrLines = doc.splitTextToSize(clientAddr, TO_ADDR_W);
    addrLines.forEach((line) => { doc.text(line, P1_LEFT, toY); toY += TO_LINE_H; });
  }

  if (clientAddr3.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    const addr3Lines = doc.splitTextToSize(clientAddr3, TO_ADDR_W);
    addr3Lines.forEach((line) => { doc.text(line, P1_LEFT, toY); toY += TO_LINE_H; });
  }

  if (clientPhone.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text('Phone : ' + clientPhone, P1_LEFT, toY);
    toY += TO_LINE_H;
  }

  const IB_RIGHT = P1_RIGHT;
  doc.setFont(undefined, 'bold');
  doc.setFontSize(9);
  doc.text('QTN NO : '      + quotNo,    IB_RIGHT, 36, { align: 'right' });
  doc.text('DATE : '        + entryDt,   IB_RIGHT, 42, { align: 'right' });
  doc.text('VALID UPTO : '  + validUpto, IB_RIGHT, 48, { align: 'right' });

  const infoBoxBottom = 52;
  const PI_Y      = Math.max(toY + 3, infoBoxBottom);
  const PI_LINE_H = 6.5;

  const piRows = [
    { label: 'PROJECT NAME', value: projName },
    { label: 'LOCATION',     value: location },
    { label: 'CATEGORY',     value: category },
    { label: 'KIND ATTN',    value: kindAttn },
    { label: 'SUBJECT',      value: subject  },
  ];

  piRows.forEach((row, i) => {
    const y = PI_Y + i * PI_LINE_H;
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text(row.label, P1_LEFT, y);
    const labelW = doc.getTextWidth(row.label);
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    const colon = ' : ';
    doc.text(colon, P1_LEFT + labelW, y);
    const colonW = doc.getTextWidth(colon);
    doc.setFont(undefined, row.label === 'PROJECT NAME' ? 'bold' : 'normal');
    doc.setFontSize(8.5);
    doc.text(doc.splitTextToSize(row.value, 130)[0] || '', P1_LEFT + labelW + colonW, y);
  });

  // ── Parse Description field (paragraph + bold points) ─────────────────────
const rawDescription = safeStr(D.Description || '');

// Split into lines, classify each
const descBlocks = rawDescription
  .split(/\n/)
  .map(l => l.trim())
  .filter(Boolean)
  .map(line => {
    // Detect numbered point: starts with digit+dot or digit+) or bullet (-, •, *)
    const isPoint = /^(\d+[\.\)]\s+|[-•*]\s+)/.test(line);
    // Strip existing numbering/bullet prefix — we'll re-number
    const clean = line.replace(/^(\d+[\.\)]\s+|[-•*]\s+)/, '').trim();
    return { isPoint, text: clean };
  });

// Separate paragraphs from points
const paragraphs = descBlocks.filter(b => !b.isPoint);
const points     = descBlocks.filter(b =>  b.isPoint);

const introY   = PI_Y + piRows.length * PI_LINE_H + 5;
const INTRO_LH = 4.2;
let   curY     = introY;

// Render paragraph lines — normal weight, wrapped
if (paragraphs.length) {
  doc.setFont(undefined, 'normal');
  doc.setFontSize(8);
  doc.setTextColor(0, 0, 0);
  paragraphs.forEach(block => {
    const lines = doc.splitTextToSize(block.text, P1_W);
    lines.forEach(l => { doc.text(l, P1_LEFT, curY); curY += INTRO_LH; });
  });
  curY += 2; // small gap before points
}

// Render numbered bold points
if (points.length) {
  doc.setFontSize(8);
  points.forEach((block, i) => {
    const prefix  = `${i + 1}. `;
    const prefixW = doc.getTextWidth(prefix);
    const wrapW   = P1_W - prefixW;
    const lines   = doc.splitTextToSize(block.text, wrapW);

    doc.setFont(undefined, 'bold');
    doc.text(prefix, P1_LEFT, curY);
    lines.forEach((l, li) => {
      doc.setFont(undefined, 'bold');
      doc.text(l, P1_LEFT + prefixW, curY + li * INTRO_LH);
    });
    curY += lines.length * INTRO_LH + 1;
  });
  curY += 2;
}

const scopeStartY = curY;
  // ── ITEMS TABLE ───────────────────────────────────────────────────────────
  const TBL_LEFT     = P1_LEFT;
  const TBL_RIGHT    = P1_RIGHT;
  const TBL_W        = TBL_RIGHT - TBL_LEFT;
  const TBL_HEADER_H = 8;

  // GST column only when gst% > 0
  const COL_SR    = 12;
  const COL_QTY   = 8;
  const COL_UNIT  = 12;
  const COL_RATE  = 23;
  const COL_GST   = 0;
  const COL_TOTAL = 24;
  const COL_DESC  = TBL_W - COL_SR - COL_QTY - COL_UNIT - COL_RATE - COL_GST - COL_TOTAL;

  const X_SR    = TBL_LEFT;
  const X_DESC  = X_SR   + COL_SR;
  const X_QTY   = X_DESC + COL_DESC;
  const X_UNIT  = X_QTY  + COL_QTY;
  const X_RATE  = X_UNIT + COL_UNIT;
  const X_GST   = X_RATE + COL_RATE;
 const X_TOTAL = X_RATE + COL_RATE;

  const tableHeaderY = scopeStartY + 5;

  // Build column divider list once — reused for header, rows, and new pages
const colDividers = [X_DESC, X_QTY, X_UNIT, X_RATE, X_TOTAL];

  function drawTableHeader(y) {
    doc.setFillColor(30, 30, 30);
    doc.rect(TBL_LEFT, y, TBL_W, TBL_HEADER_H, 'F');
    doc.setTextColor(255, 255, 255);
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    const hMidY = y + TBL_HEADER_H / 2 + 1.5;
    doc.text('Sr. No.',      X_SR    + COL_SR   / 2, hMidY, { align: 'center' });
    doc.text('Description',  X_DESC  + 2,             hMidY);
    doc.text('Qty',          X_QTY   + COL_QTY  / 2, hMidY, { align: 'center' });
    doc.text('Units',        X_UNIT  + COL_UNIT / 2,  hMidY, { align: 'center' });
    doc.text('Unit Rate',    X_RATE  + COL_RATE  - 2, hMidY, { align: 'right'  });
   
    doc.text('Total Amount', X_TOTAL + COL_TOTAL - 2, hMidY, { align: 'right'  });
    doc.setDrawColor(26, 25, 24);
    doc.setLineWidth(0.3);
    colDividers.forEach(x => doc.line(x, y, x, y + TBL_HEADER_H));
    doc.setDrawColor(0, 0, 0);
    doc.setLineWidth(0.5);
    doc.rect(TBL_LEFT, y, TBL_W, TBL_HEADER_H);
    doc.setTextColor(0, 0, 0);
  }

  drawTableHeader(tableHeaderY);

  const ROW_H_GROUP = 8;
  const ROW_H_ITEM  = 8;
  const DESC_LINE_H = 4;
  const DESC_MAX_W  = COL_DESC - 4;

  let tblY   = tableHeaderY + TBL_HEADER_H;
  let rowIdx = 0;
  let p1PageCount = 1;

  function drawTableRow(y, h, isGroup) {
    if (!isGroup) {
      doc.setFillColor(rowIdx % 2 === 0 ? 255 : 248,
                       rowIdx % 2 === 0 ? 255 : 248,
                       rowIdx % 2 === 0 ? 255 : 248);
      doc.rect(TBL_LEFT, y, TBL_W, h, 'F');
      doc.setDrawColor(190, 190, 190);
      doc.setLineWidth(0.3);
      doc.rect(TBL_LEFT, y, TBL_W, h);
      colDividers.forEach(x => doc.line(x, y, x, y + h));
    } else {
      doc.setFillColor(230, 230, 230);
      doc.rect(TBL_LEFT, y, TBL_W, h, 'F');
      doc.setDrawColor(190, 190, 190);
      doc.setLineWidth(0.3);
      doc.rect(TBL_LEFT, y, TBL_W, h);
    }
    doc.setDrawColor(0, 0, 0);
  }

  const checkP1Break = (need) => {
    if (tblY + need > pageHeight - 15) {
      drawPage1Footer(`Page: ${doc.internal.getCurrentPageInfo().pageNumber} of ...`);
      p1PageCount++;
      doc.addPage();
      doc.setTextColor(0, 0, 0);
      drawTableHeader(14);
      tblY   = 14 + TBL_HEADER_H;
      rowIdx = 0;
    }
  };

  tableRows.forEach((row) => {
    if (row.type === 'group') {
      checkP1Break(ROW_H_GROUP);
      drawTableRow(tblY, ROW_H_GROUP, true);
      doc.setFont(undefined, 'bold');
      doc.setFontSize(8.5);
      doc.setTextColor(0, 0, 0);
      doc.text(row.sr,    X_SR   + COL_SR / 2, tblY + ROW_H_GROUP / 2 + 1.5, { align: 'center' });
      doc.text(row.label, X_DESC + 2,           tblY + ROW_H_GROUP / 2 + 1.5);
      tblY += ROW_H_GROUP;
    } else {
      const descLines = doc.splitTextToSize(row.desc, DESC_MAX_W);
      const rowH      = Math.max(ROW_H_ITEM, descLines.length * DESC_LINE_H + 4);
      checkP1Break(rowH);
      drawTableRow(tblY, rowH, false);
      const midY = tblY + rowH / 2 + 1.5;
      doc.setFont(undefined, 'normal');
      doc.setFontSize(8);
      doc.setTextColor(0, 0, 0);
      doc.text(row.sr, X_SR + COL_SR / 2, midY, { align: 'center' });
      descLines.forEach((line, li) => {
        doc.text(line, X_DESC + 2, tblY + 5 + li * DESC_LINE_H);
      });
      if (row.qty)      doc.text(safeStr(row.qty),  X_QTY  + COL_QTY  / 2, midY, { align: 'center' });
      if (row.units)    doc.text(safeStr(row.units), X_UNIT + COL_UNIT / 2, midY, { align: 'center' });
      if (row.unitRate) doc.text(fmt(row.unitRate),  X_RATE + COL_RATE  - 2, midY, { align: 'right'  });
      // GST amount column — only rendered when showGstCol is true
      
      if (row.total)    doc.text(fmt(row.total),     X_TOTAL + COL_TOTAL - 2, midY, { align: 'right' });
      rowIdx++;
      tblY += rowH;
    }
  });

  // Fix page footers on page-1 pages now that totalPages is known
  const totalPages = p1PageCount + 1;

  for (let pg = 1; pg <= p1PageCount; pg++) {
    doc.setPage(pg);
    doc.setFillColor(255, 255, 255);
    doc.rect(0, pageHeight - 10, pageWidth, 10, 'F');
    drawPage1Footer(`Page: ${pg} of ${totalPages}`);
  }
  doc.setPage(p1PageCount);
  doc.addPage();

  // ═══════════════════════════════════════════════════════════════════════════
  // PAGE 2 (Summary)
  // ═══════════════════════════════════════════════════════════════════════════

  doc.setTextColor(0, 0, 0);

  const CS_LEFT         = 18;
  const CS_RIGHT        = pageWidth - 18;
  const CS_TABLE_W      = CS_RIGHT - CS_LEFT;
  const CS_SR_W         = 14;
  const CS_AMT_W        = 55;
  const CS_HEADER_H     = 9;
  const CS_ROW_H        = 9;
  const CS_START_Y      = 14;
  const CS_BOTTOM_LIMIT = pageHeight - 55;

  function drawPage2Chrome() {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(7);
    doc.setTextColor(100, 100, 100);
    doc.text(
      `Page: ${doc.internal.getCurrentPageInfo().pageNumber} of ${totalPages}`,
      pageWidth - 15, pageHeight - 5, { align: 'right' }
    );
    doc.setTextColor(0, 0, 0);
  }

  function drawCSHeader(y) {
    doc.setFillColor(30, 30, 30);
    doc.rect(CS_LEFT, y, CS_TABLE_W, CS_HEADER_H, 'F');
    doc.setTextColor(255, 255, 255);
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text('Sr.',          CS_LEFT + CS_SR_W / 2, y + 3.2, { align: 'center' });
    doc.text('No.',          CS_LEFT + CS_SR_W / 2, y + 6.8, { align: 'center' });
    doc.text('Cost Summary', CS_LEFT + CS_SR_W + 4, y + CS_HEADER_H / 2 + 1.5);
    doc.text('Sub Total',    CS_RIGHT - 3,           y + CS_HEADER_H / 2 + 1.5, { align: 'right' });
    doc.setTextColor(0, 0, 0);
    return y + CS_HEADER_H;
  }

  function drawCSRow(y, srLabel, label, amountStr) {
    doc.setFillColor(230, 230, 230);
    doc.rect(CS_LEFT, y, CS_TABLE_W, CS_ROW_H, 'F');
    const midY = y + CS_ROW_H / 2 + 1.5;
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.setTextColor(0, 0, 0);
    doc.text(srLabel,   CS_LEFT + CS_SR_W / 2, midY, { align: 'center' });
    doc.text(label,     CS_LEFT + CS_SR_W + 4,  midY);
    doc.text(amountStr, CS_RIGHT - 3,            midY, { align: 'right' });
  }

  function drawTotals(startY) {
    const TOT_LINE_H = 7;
    const TOT_LEFT   = CS_LEFT;
    const TOT_RIGHT  = CS_RIGHT;
    const TOT_W      = TOT_RIGHT - TOT_LEFT;
    const DIVX       = TOT_RIGHT - CS_AMT_W;

    // Only include DISCOUNT row if discount > 0, GST row only if gst > 0
    const rows = [
  { label: 'SUB TOTAL :', value: fmt(taxable) },
  { label: 'DISCOUNT :', value: fmt(discountAmt) },  // ✅ ALWAYS SHOWN
  ...(gstPercent > 0 ? [{ label: `${gstPercent}% GST AMOUNT :`, value: fmt(gstAmt) }] : []),
  { label: 'NET QUOTATION AMOUNT :', value: fmt(netTotal) },
];

    rows.forEach((r, i) => {
      const ry = startY + i * TOT_LINE_H;
      doc.setFillColor(250, 250, 250);
      doc.rect(TOT_LEFT, ry, TOT_W, TOT_LINE_H, 'F');
      doc.setTextColor(0, 0, 0);
      doc.setDrawColor(180, 180, 180);
      doc.setLineWidth(0.3);
      doc.rect(TOT_LEFT, ry, TOT_W, TOT_LINE_H);
      doc.line(DIVX, ry, DIVX, ry + TOT_LINE_H);
      doc.setFont(undefined, 'bold');
      doc.setFontSize(8.5);
      const midY = ry + TOT_LINE_H / 2 + 1.5;
      doc.text(r.label, TOT_LEFT + 3, midY);
      doc.text(r.value, TOT_RIGHT - 3, midY, { align: 'right' });
      doc.setDrawColor(0, 0, 0);
    });

    return startY + rows.length * TOT_LINE_H;
  }

  function drawInWords(startY) {
    const iwText   = `INDIAN RUPEES ${numberToWords(Math.round(netTotal))} ONLY`;
    const IW_LABEL = 'IN WORDS : ';
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8);
    const iwLabelW = doc.getTextWidth(IW_LABEL);
    const iwAvailW = CS_TABLE_W - iwLabelW - 6;
    const iwLines  = doc.splitTextToSize(iwText, iwAvailW);
    const iwH      = Math.max(9, iwLines.length * 5 + 4);

    doc.setFillColor(255, 255, 255);
    doc.rect(CS_LEFT, startY, CS_TABLE_W, iwH, 'F');
    doc.setDrawColor(180, 180, 180);
    doc.setLineWidth(0.3);
    doc.rect(CS_LEFT, startY, CS_TABLE_W, iwH);
    doc.setDrawColor(0, 0, 0);

    doc.setFont(undefined, 'bold');
    doc.setFontSize(8);
    doc.text(IW_LABEL, CS_LEFT + 3, startY + 5.5);
    doc.text(iwLines,  CS_LEFT + 3 + iwLabelW, startY + 5.5);

    return startY + iwH;
  }

  // ── Dynamic Terms & Conditions ────────────────────────────────────────────
function drawTermsAndConditions(startY) {
  if (!termsLines.length) return startY;

  const TC_LINE_H = 5;
  const TC_WRAP_W = CS_TABLE_W - 8; // available width with left padding

  // Heading — bold + underline, no box/background
  doc.setFont(undefined, 'bold');
  doc.setFontSize(9);
  doc.setTextColor(0, 0, 0);
  doc.text('TERMS & CONDITIONS', CS_LEFT, startY);
  const headingW = doc.getTextWidth('TERMS & CONDITIONS');
  doc.setLineWidth(0.4);
  doc.line(CS_LEFT, startY + 1, CS_LEFT + headingW, startY + 1);

  let lineY = startY + 7;

  if (termsLines.length === 1) {
    // Single sentence — plain wrapped text, no number
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    const wrapped = doc.splitTextToSize(termsLines[0], TC_WRAP_W);
    wrapped.forEach((l) => {
      doc.text(l, CS_LEFT, lineY);
      lineY += TC_LINE_H;
    });
  } else {
    // Multiple lines — numbered point-wise
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    termsLines.forEach((line, i) => {
      const prefix  = `${i + 1}.  `;
      const prefixW = doc.getTextWidth(prefix);
      const wrapped = doc.splitTextToSize(line, TC_WRAP_W - prefixW);
      doc.text(prefix, CS_LEFT, lineY);
      wrapped.forEach((wl, wi) => {
        doc.text(wl, CS_LEFT + prefixW, lineY + wi * TC_LINE_H);
      });
      lineY += wrapped.length * TC_LINE_H + 1.5;
    });
  }

  return lineY + 2;
}

  function drawSignature(startY) {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8);
    doc.text('Prepared By', CS_LEFT + 2, startY);
    doc.setFont(undefined, 'normal');
    doc.setFontSize(9);
    doc.text(preparedBy || 'admin', CS_LEFT + 2, startY + 6);

    doc.setFont(undefined, 'normal');
    doc.setFontSize(8);
    doc.text('Thanking You', CS_RIGHT - 3, startY, { align: 'right' });
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    doc.text('For : Inovace Engineering', CS_RIGHT - 3, startY + 6, { align: 'right' });

    return startY + 14;
  }

  // ── Render page 2 ─────────────────────────────────────────────────────────

  drawPage2Chrome();

  let csY = drawCSHeader(CS_START_Y);

  costSummaryRows.forEach((row, i) => {
    if (csY + CS_ROW_H > CS_BOTTOM_LIMIT) {
      drawPage2Chrome();
      doc.addPage();
      drawPage2Chrome();
      csY = drawCSHeader(CS_START_Y);
    }
    drawCSRow(csY, String(i + 1), row.label, fmt(row.amount));
    csY += CS_ROW_H + 0.3;
  });

  let afterTotY = drawTotals(csY);
  afterTotY     = drawInWords(afterTotY);
  afterTotY     = drawTermsAndConditions(afterTotY + 6);
  drawSignature(afterTotY + 6);

  return Buffer.from(doc.output('arraybuffer'));
};

module.exports = { generateQuotationPdf };