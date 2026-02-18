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

  const quotNo    = safeStr(D.Quotation_No);
  const entryDt   = formatDate(D.EntryDate);
  const refNo     = safeStr(D.ReferenceNo);
  const validUpto = safeStr(D.ValidUpto);

  const clientName   = safeStr(customerDetails.Customer_Name  || '');
  const clientAddr   = safeStr(customerDetails.address        || '');
  const clientAddr3  = safeStr(customerDetails.Address3       || '');
  const clientPhone  = safeStr(customerDetails.Contact_Number || '');

  const projName  = safeStr(D.Product_Name || '');
  const workPlace = safeStr(D.WorkPlace    || '');
  const kindAttn  = safeStr(D.KindAttn     || '');
  const subject   = safeStr(D.Subject      || '');

  const taxable     = parseFloat(D.TaxableAmount)   || 0;
  const totalAmt    = parseFloat(D.TotalAmount)     || 0;
  const gstAmt      = parseFloat(D.TotalGSTAmount)  || 0;
  const netTotal    = parseFloat(D.NetTotal)        || 0;
  const discountAmt = Math.max(0, totalAmt - taxable - gstAmt);
  const preparedBy  = safeStr(D.Created_By_Name     || '');

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
      tableRows.push({
        type:     'item',
        sr:       `${catCounter}.${itemIndex + 1}`,
        desc:     safeStr(item.ItemName),
        qty:      safeStr(item.Quantity),
        units:    safeStr(item.Unit || ''),
        unitRate: item.UnitPrice || 0,
        total:    (parseFloat(item.UnitPrice) || 0) * (parseFloat(item.Quantity) || 0),
      });
    });
  });

  const costSummaryRows = [];
  grouped.forEach((items, catId) => {
    const catName  = items[0].CategoryName || `Category ${catId}`;
    const catTotal = items.reduce((s, it) => s + (parseFloat(it.UnitPrice) || 0) * (parseFloat(it.Quantity) || 0), 0);
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
  // Underline directly under QUOTATION text — solid black
  doc.setLineWidth(0.5);
  doc.setDrawColor(0, 0, 0);
  doc.line(pageWidth / 2 - qtW1 / 2, 21.5, pageWidth / 2 + qtW1 / 2, 21.5);
  // Full-width horizontal separator — dark hash/grey
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
    addrLines.forEach((line) => {
      doc.text(line, P1_LEFT, toY);
      toY += TO_LINE_H;
    });
  }

  if (clientAddr3.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    const addr3Lines = doc.splitTextToSize(clientAddr3, TO_ADDR_W);
    addr3Lines.forEach((line) => {
      doc.text(line, P1_LEFT, toY);
      toY += TO_LINE_H;
    });
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
  doc.text('QUOTATION NO :' + quotNo,    IB_RIGHT, 36, { align: 'right' });
  doc.text('DATE :'         + entryDt,   IB_RIGHT, 42, { align: 'right' });
  doc.text('REFERENCE NO :' + refNo,     IB_RIGHT, 48, { align: 'right' });
  doc.text('VALID UPTO :'   + validUpto, IB_RIGHT, 54, { align: 'right' });

  const infoBoxBottom = 58;
  const PI_Y      = Math.max(toY + 3, infoBoxBottom);
  const PI_LINE_H = 6.5;

  const piRows = [
    { label: 'PROJECT NAME', value: projName  },
    { label: 'WORK PLACE',   value: workPlace },
    { label: 'KIND ATTN',    value: kindAttn  },
    { label: 'SUBJECT',      value: subject   },
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
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text(doc.splitTextToSize(row.value, 130)[0] || '', P1_LEFT + labelW + colonW, y);
  });

  const introY = PI_Y + piRows.length * PI_LINE_H + 5;
  const introText =
    'Sir, With reference to the above, we are pleased to furnish herewith our lowest quotation for Supply, ' +
    'Installation, Testing and Commissioning of fire protection system for your building. We trust, this quote ' +
    'meets your requirement and to your satisfaction & approval. Look forward for your business. If you require any ' +
    'further information, we shall be pleased to provide the same (Mob: 9747608932,';
  doc.setFont(undefined, 'normal');
  doc.setFontSize(7.5);
  doc.setTextColor(0, 0, 0);
  const introLines = doc.splitTextToSize(introText, P1_W);
  const INTRO_LH = 3.8;
  introLines.forEach((line, i) => {
    doc.text(line, P1_LEFT, introY + i * INTRO_LH);
  });

  const scopeStartY = introY + introLines.length * INTRO_LH + 3;
  const scopeItems  = [
    'Fire protection system supply and installation using GI"Class B" Pipes & High quality Fittings. 55555555',
    'Fire protection system supply and installation using GI"Class B" Pipes & High quality Fittings. 655555',
    'Fire protection system supply and installation using GI"Class B" Pipes & High quality Fittings. 555555',
    'Fire protection system supply and installation using GI"Class B" Pipes & High quality Fittings. 55555',
  ];
  const SCOPE_LH = 4.0;
  doc.setFont(undefined, 'bold');
  doc.setFontSize(7.5);
  scopeItems.forEach((item, i) => {
    doc.text((i + 1) + '. ' + item, P1_LEFT + 4, scopeStartY + i * SCOPE_LH);
  });

  // ── ITEMS TABLE ───────────────────────────────────────────────────────────
  const TBL_LEFT     = P1_LEFT;
  const TBL_RIGHT    = P1_RIGHT;
  const TBL_W        = TBL_RIGHT - TBL_LEFT;
  const TBL_HEADER_H = 8;

  const COL_SR    = 12;
  const COL_QTY   = 14;
  const COL_UNIT  = 16;
  const COL_RATE  = 28;
  const COL_TOTAL = 28;
  const COL_DESC  = TBL_W - COL_SR - COL_QTY - COL_UNIT - COL_RATE - COL_TOTAL;

  const X_SR    = TBL_LEFT;
  const X_DESC  = X_SR   + COL_SR;
  const X_QTY   = X_DESC + COL_DESC;
  const X_UNIT  = X_QTY  + COL_QTY;
  const X_RATE  = X_UNIT + COL_UNIT;
  const X_TOTAL = X_RATE + COL_RATE;

  const tableHeaderY = scopeStartY + scopeItems.length * SCOPE_LH + 5;

  doc.setFillColor(30, 30, 30);
  doc.rect(TBL_LEFT, tableHeaderY, TBL_W, TBL_HEADER_H, 'F');

  doc.setTextColor(255, 255, 255);
  doc.setFont(undefined, 'bold');
  doc.setFontSize(8.5);
  const hMidY = tableHeaderY + TBL_HEADER_H / 2 + 1.5;
  doc.text('Sr. No.',      X_SR    + COL_SR   / 2,   hMidY, { align: 'center' });
  doc.text('Description',  X_DESC  + 2,               hMidY);
  doc.text('Qty',          X_QTY   + COL_QTY  / 2,   hMidY, { align: 'center' });
  doc.text('Units',        X_UNIT  + COL_UNIT / 2,    hMidY, { align: 'center' });
  doc.text('Unit Rate',    X_RATE  + COL_RATE  - 2,   hMidY, { align: 'right'  });
  doc.text('Total Amount', X_TOTAL + COL_TOTAL - 2,   hMidY, { align: 'right'  });

  doc.setDrawColor(26, 25, 24);
  doc.setLineWidth(0.3);
  [X_DESC, X_QTY, X_UNIT, X_RATE, X_TOTAL].forEach(x => {
    doc.line(x, tableHeaderY, x, tableHeaderY + TBL_HEADER_H);
  });

  doc.setDrawColor(0, 0, 0);
  doc.setLineWidth(0.5);
  doc.rect(TBL_LEFT, tableHeaderY, TBL_W, TBL_HEADER_H);
  doc.setTextColor(0, 0, 0);

  const ROW_H_GROUP = 8;
  const ROW_H_ITEM  = 8;
  const DESC_LINE_H = 4;
  const DESC_MAX_W  = COL_DESC - 4;

  let tblY   = tableHeaderY + TBL_HEADER_H;
  let rowIdx = 0;

  function drawTableRow(y, h, isGroup) {
    if (!isGroup) {
      doc.setFillColor(rowIdx % 2 === 0 ? 255 : 248,
                       rowIdx % 2 === 0 ? 255 : 248,
                       rowIdx % 2 === 0 ? 255 : 248);
      doc.rect(TBL_LEFT, y, TBL_W, h, 'F');
      doc.setDrawColor(190, 190, 190);
      doc.setLineWidth(0.3);
      doc.rect(TBL_LEFT, y, TBL_W, h);
      [X_DESC, X_QTY, X_UNIT, X_RATE, X_TOTAL].forEach(x => {
        doc.line(x, y, x, y + h);
      });
    } else {
      doc.setFillColor(230, 230, 230);
      doc.rect(TBL_LEFT, y, TBL_W, h, 'F');
      doc.setDrawColor(190, 190, 190);
      doc.setLineWidth(0.3);
      doc.rect(TBL_LEFT, y, TBL_W, h);
    }
    doc.setDrawColor(0, 0, 0);
  }

  let p1PageCount = 1;

  const checkP1Break = (need) => {
    if (tblY + need > pageHeight - 15) {
      drawPage1Footer(`Page: ${doc.internal.getCurrentPageInfo().pageNumber} of ...`);
      p1PageCount++;
      doc.addPage();
      doc.setTextColor(0, 0, 0);

      doc.setFillColor(30, 30, 30);
      doc.rect(TBL_LEFT, 14, TBL_W, TBL_HEADER_H, 'F');
      doc.setTextColor(255, 255, 255);
      doc.setFont(undefined, 'bold');
      doc.setFontSize(8.5);
      const hMidY2 = 14 + TBL_HEADER_H / 2 + 1.5;
      doc.text('Sr. No.',      X_SR    + COL_SR   / 2, hMidY2, { align: 'center' });
      doc.text('Description',  X_DESC  + 2,             hMidY2);
      doc.text('Qty',          X_QTY   + COL_QTY  / 2, hMidY2, { align: 'center' });
      doc.text('Units',        X_UNIT  + COL_UNIT / 2,  hMidY2, { align: 'center' });
      doc.text('Unit Rate',    X_RATE  + COL_RATE - 2,  hMidY2, { align: 'right'  });
      doc.text('Total Amount', X_TOTAL + COL_TOTAL - 2, hMidY2, { align: 'right'  });
      doc.setDrawColor(255, 255, 255); doc.setLineWidth(0.3);
      [X_DESC, X_QTY, X_UNIT, X_RATE, X_TOTAL].forEach(x => {
        doc.line(x, 14, x, 14 + TBL_HEADER_H);
      });
      doc.setDrawColor(0, 0, 0); doc.setLineWidth(0.5);
      doc.rect(TBL_LEFT, 14, TBL_W, TBL_HEADER_H);
      doc.setTextColor(0, 0, 0);
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
      if (row.qty)      doc.text(safeStr(row.qty),   X_QTY  + COL_QTY  / 2, midY, { align: 'center' });
      if (row.units)    doc.text(safeStr(row.units),  X_UNIT + COL_UNIT / 2, midY, { align: 'center' });
      if (row.unitRate) doc.text(fmt(row.unitRate),   X_RATE + COL_RATE - 2, midY, { align: 'right'  });
      if (row.total)    doc.text(fmt(row.total),      X_TOTAL + COL_TOTAL - 2, midY, { align: 'right' });
      rowIdx++;
      tblY += rowH;
    }
  });

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

  // ── FIX 1: Header — NO vertical dividers, NO outer border ────────────────
  function drawCSHeader(y) {
    doc.setFillColor(30, 30, 30);
    doc.rect(CS_LEFT, y, CS_TABLE_W, CS_HEADER_H, 'F');

    // Vertical dividers and outer border REMOVED — clean header matching screenshot

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

  // ── FIX 2: Data rows — grey fill only, NO border lines ───────────────────
  // White gap between rows is achieved by the fill not covering the gap space
  function drawCSRow(y, srLabel, label, amountStr) {
    doc.setFillColor(230, 230, 230);
    doc.rect(CS_LEFT, y, CS_TABLE_W, CS_ROW_H, 'F');

    // Border lines REMOVED — rows appear as separate grey blocks with white space between them

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

    const rows = [
      { label: 'SUB TOTAL :',            value: fmt(taxable)     },
      { label: 'DISCOUNT :',             value: fmt(discountAmt) },
      { label: '18% GST AMOUNT :',       value: fmt(gstAmt)      },
      { label: 'NET QUOTATION AMOUNT :', value: fmt(netTotal)    },
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
      doc.setTextColor(0, 0, 0);
      doc.setDrawColor(0, 0, 0);
    });

    return startY + rows.length * TOT_LINE_H;
  }

  function drawInWords(startY) {
    const iwText  = `INDIAN RUPEES ${numberToWords(Math.round(netTotal))} ONLY`;
    const IW_LABEL = 'IN WORDS : ';
    const iwLabelW = (() => { doc.setFont(undefined, 'bold'); doc.setFontSize(8); return doc.getTextWidth(IW_LABEL); })();
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

    doc.setFont(undefined, 'bold');
    doc.setFontSize(8);
    doc.text(iwLines, CS_LEFT + 3 + iwLabelW, startY + 5.5);

    return startY + iwH;
  }

  function drawNotes(startY) {
    const notes = [
      'Fire protection system supply and installation using',
      'GI"Class B" Pipes & High quality Fittings. -45555',
      'Fire protection system supply and installation using',
      'GI"Class B" Pipes & High quality Fittings. 56666',
    ];
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8);
    doc.setTextColor(0, 0, 0);
    notes.forEach((line, i) => {
      doc.text(line, CS_LEFT + 2, startY + i * 5);
    });
    return startY + notes.length * 5;
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

  function drawPaymentTerms(startY) {
    const PT_ROW_H   = 7;
    const PT_STAGE_W = 22;
    const PT_PAY_W   = 80;
    const PT_AMT_W   = 35;

    // Calculate total height of payment terms section for outer border box
    const PT_TOTAL_ROWS = 4; // 1 header + 3 data rows
    const PT_LABEL_H    = 6; // "Payment Terms" label above box
    const PT_BOX_H      = PT_ROW_H * PT_TOTAL_ROWS;
    const PT_PADDING    = 4; // inner padding inside the box

    // Outer border box around entire payment terms (label + table)
    doc.setDrawColor(242, 241, 237);
    doc.setLineWidth(0.5);
    doc.rect(CS_LEFT - 5, startY - PT_LABEL_H - 2, CS_TABLE_W + 10, PT_LABEL_H + PT_BOX_H + PT_PADDING + 4);
    doc.setDrawColor(0, 0, 0);

    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    doc.setTextColor(80, 80, 80);
    doc.text('Payment Terms', CS_LEFT + 2, startY - 2);
    doc.setTextColor(0, 0, 0);

    doc.setFillColor(210, 210, 210);
    doc.rect(CS_LEFT, startY, CS_TABLE_W, PT_ROW_H, 'F');
    doc.setDrawColor(150, 150, 150);
    doc.setLineWidth(0.3);
    doc.rect(CS_LEFT, startY, CS_TABLE_W, PT_ROW_H);

    const hMid = startY + PT_ROW_H / 2 + 1.5;
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8);

    let px = CS_LEFT;
    doc.text('Stage',   px + PT_STAGE_W / 2, hMid, { align: 'center' });
    px += PT_STAGE_W; doc.line(px, startY, px, startY + PT_ROW_H);
    doc.text('Payment', px + 3, hMid);
    px += PT_PAY_W;   doc.line(px, startY, px, startY + PT_ROW_H);
    doc.text('Amount',  px + 3, hMid);
    px += PT_AMT_W;   doc.line(px, startY, px, startY + PT_ROW_H);
    doc.text('Remarks', px + 3, hMid);

    const ptRows = [
      {
        stage:   `${D.advance_percentage || 0}% -`,
        payment: 'Against delivery.',
        amount:  fmt(parseFloat(D.advance_amount) || 0),
        remarks: safeStr(D.advance_remark),
      },
      {
        stage:   `${D.onmaterialdelivery_percentage || 0}%`,
        payment: 'On work progress.',
        amount:  fmt(parseFloat(D.onmaterialdelivery_amount) || 0),
        remarks: safeStr(D.onmaterialdelivery_remark),
      },
      {
        stage:   `${D.onWork_completetion_percentage || 0}%`,
        payment: 'Against Testing and Commissioning..',
        amount:  fmt(parseFloat(D.onWork_completetion_amount) || 0),
        remarks: safeStr(D.onWork_completetion_remark),
      },
    ];

    ptRows.forEach((pr, idx) => {
      const ry   = startY + PT_ROW_H * (idx + 1);
      const rMid = ry + PT_ROW_H / 2 + 1.5;
      doc.setFillColor(idx % 2 === 0 ? 255 : 248, idx % 2 === 0 ? 255 : 248, idx % 2 === 0 ? 255 : 248);
      doc.rect(CS_LEFT, ry, CS_TABLE_W, PT_ROW_H, 'F');
      doc.setDrawColor(200, 200, 200);
      doc.setLineWidth(0.3);
      doc.rect(CS_LEFT, ry, CS_TABLE_W, PT_ROW_H);

      doc.setFont(undefined, 'normal');
      doc.setFontSize(8);
      let rx = CS_LEFT;
      doc.text(pr.stage,   rx + PT_STAGE_W / 2, rMid, { align: 'center' });
      rx += PT_STAGE_W; doc.line(rx, ry, rx, ry + PT_ROW_H);
      doc.text(pr.payment, rx + 3, rMid);
      rx += PT_PAY_W;   doc.line(rx, ry, rx, ry + PT_ROW_H);
      doc.text(pr.amount,  rx + PT_AMT_W - 3, rMid, { align: 'right' });
      rx += PT_AMT_W;   doc.line(rx, ry, rx, ry + PT_ROW_H);
      doc.text(pr.remarks, rx + 3, rMid);
    });
  }

  // ── Render page 2 ─────────────────────────────────────────────────────────

  drawPage2Chrome();

  let csY = drawCSHeader(CS_START_Y);

  // NO gap after header — first row starts immediately after header

  costSummaryRows.forEach((row, i) => {
    if (csY + CS_ROW_H > CS_BOTTOM_LIMIT) {
      drawPage2Chrome();
      doc.addPage();
      drawPage2Chrome();
      csY = drawCSHeader(CS_START_Y);
    }
    drawCSRow(csY, String(i + 1), row.label, fmt(row.amount));
    // 2mm white space gap between content rows only
    csY += CS_ROW_H + 0.3;
  });

  let afterTotY = drawTotals(csY);
  afterTotY = drawInWords(afterTotY);
  afterTotY = drawNotes(afterTotY + 6) + 4;
  afterTotY = drawSignature(afterTotY + 6);
  drawPaymentTerms(afterTotY + 4);

  return Buffer.from(doc.output('arraybuffer'));
};

module.exports = { generateQuotationPdf };