'use strict';

const { jsPDF } = require('jspdf');
const fs        = require('fs');
const path      = require('path');
require('jspdf-autotable');

const CONTACT = {
  company : 'Inovace Engineering',
ContactNo:'+919897678789',
  email   : 'info@inovaceengineering.com',
  website : 'www.inovaceengineering.com',
  address : 'Your Office Address, City, State - PIN',
};

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

// ─────────────────────────────────────────────────────────────────────────────
// MAIN GENERATOR
// ─────────────────────────────────────────────────────────────────────────────

const generateQuotationPdf = async (quotationData, customerDetails = {}) => {

  const doc        = new jsPDF({ unit: 'mm', format: 'a4' });
  const pageWidth  = doc.internal.pageSize.getWidth();
  const pageHeight = doc.internal.pageSize.getHeight();
  const D          = quotationData;

  // ── Helpers ───────────────────────────────────────────────────────────────
  const safeStr = (v) => (v == null ? '' : String(v)).trim();

  const fmt = (n) => {
    const num = parseFloat(n) || 0;
    return num.toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  };

  const formatDate = (val) => {
    if (!val) return '';
    const d = new Date(val);
    if (isNaN(d.getTime())) return safeStr(val);
    return d.toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
  };

  const formatDateDDMMYYYY = (val) => {
    if (!val) return '';
    const d = new Date(val);
    if (isNaN(d.getTime())) return safeStr(val);
    const dd   = String(d.getDate()).padStart(2, '0');
    const mm   = String(d.getMonth() + 1).padStart(2, '0');
    const yyyy = d.getFullYear();
    return `${dd}-${mm}-${yyyy}`;
  };

  const cleanText = (str) => safeStr(str)
    .replace(/\[\/?\w+[^\]]*\]/g, '')
    .replace(/[\u00f0][\u00b0-\u00bf]/g, '')
    .replace(/[^\x09\x0A\x0D\x20-\x7E\u00A0-\u024F]/g, '')
    .trim();

  const cleanItemName = (str) => cleanText(str).replace(/\n|\r/g, ' ').replace(/\s+/g, ' ');

  // ── Logo ──────────────────────────────────────────────────────────────────
  let logoB64  = null;
  let logoType = 'JPEG';

  try {
    logoB64 = fs.readFileSync(
      path.join(__dirname, '../assets/logos/innovace_logo.jpg')
    ).toString('base64');
    logoType = 'JPEG';
    console.log('[Logo] Loaded innovace_logo.jpg');
  } catch (e) {
    console.error('[Logo] Failed to load innovace_logo.jpg:', e.message);
  }

  console.log('[Logo Status] logoB64 present:', !!logoB64);

  // Page 1 — large logo top center
const stampLogoPage1 = () => {
  if (logoB64) {
    try {
      const logoW = 50;
      const logoH = 18;
      const logoX = P1_LEFT; // ← moved to left margin
      doc.addImage(logoB64, logoType, logoX, 3, logoW, logoH);
      console.log('[Logo] Stamped on Page 1');
    } catch (e) {
      console.error('[Logo] Page1 addImage FAILED:', e.message);
    }
  }
};


  // Other pages — small logo top left
  const stampLogo = () => {
    if (logoB64) {
      try {
        doc.addImage(logoB64, logoType, P1_LEFT, 3, 30, 10);
      } catch (e) {
        console.error('[Logo] stampLogo addImage FAILED:', e.message);
      }
    }
  };

  // ── Quotation fields ──────────────────────────────────────────────────────
  const rawQuotNo = safeStr(D.Quotation_No);
  let dynamicPart = '';
  if (rawQuotNo.includes('/')) {
    const parts = rawQuotNo.split('/');
    dynamicPart = parts[2] || '';
  } else {
    dynamicPart = rawQuotNo;
  }
  const quotNo = `IE/FR/${dynamicPart}/26`;

  const entryDt   = formatDate(D.EntryDate);
  const validUpto = formatDateDDMMYYYY(D.ValidUpto);

  const clientName   = safeStr(customerDetails.Customer_Name  || '');
  const clientAddr   = safeStr(customerDetails.address        || '');
  const clientAddr3  = safeStr(customerDetails.Address3       || '');
  const clientPhone  = safeStr(customerDetails.Contact_Number || '');

  const projName    = safeStr(D.Product_Name || '');
  const location    = safeStr(D.WorkPlace    || '');
  const category    = safeStr(D.Category     || '');
  const kindAttn    = safeStr(D.KindAttn     || '');
  const subject     = safeStr(D.Subject      || '');
  const reference   = safeStr(D.Reference   || D.ReferenceNo || '');
  const salesPerson = safeStr(D.Sales_Person || '');

  const rawTerms   = cleanText(safeStr(D.Terms_And_Conditions || ''));
  const termsLines = rawTerms.split(/\n/).map(l => l.trim()).filter(Boolean);

  const taxable     = parseFloat(D.TaxableAmount)  || 0;
  const gstAmt      = parseFloat(D.TotalGSTAmount) || 0;
  const netTotal    = parseFloat(D.NetTotal)        || 0;
  const discountAmt = parseFloat(D.Discount_Amount) || 0;
  const preparedBy  = safeStr(D.Created_By_Name     || '');
  const ContactNo = safeStr(CONTACT.ContactNo  || '');

  const gstPercent = parseFloat(D.TotalGSTPercent || D.GST_Percent || 0);
  const showGstCol = gstPercent > 0;

  let rawDetails = D.quotation_details;
  if (typeof rawDetails === 'string') {
    try { rawDetails = JSON.parse(rawDetails); } catch { rawDetails = []; }
  }
  if (!Array.isArray(rawDetails)) rawDetails = [];

const grouped = new Map();
rawDetails.forEach(item => {
  const catId = item.CategoryId ?? '__none__';
  if (!grouped.has(catId)) grouped.set(catId, []);
  grouped.get(catId).push(item);
});

const tableRows = [];
const costSummaryRows = [];
let catCounter = 0;

grouped.forEach((items, catId) => {
  catCounter++;
  const catName = items[0].CategoryName || `Category ${catCounter}`;

  // Group header row
  tableRows.push({ type: 'group', sr: String(catCounter), label: catName });

  // Item rows under this category
  items.forEach((item, itemIndex) => {
    const unitPrice  = parseFloat(item.UnitPrice)  || 0;
    const qty        = parseFloat(item.Quantity)    || 0;
    const itemGstPct = parseFloat(item.GSTPercent || D.TotalGSTPercent || D.GST_Percent || 0);
    const subtotal   = unitPrice * qty;
    const itemGst    = showGstCol ? (subtotal * itemGstPct / 100) : 0;

    tableRows.push({
      type:     'item',
      sr:       `${catCounter}.${itemIndex + 1}`,
      desc:     cleanItemName(item.ItemName || ''),
      qty:      safeStr(item.Quantity),
      units:    safeStr(item.Unit || ''),
      unitRate: unitPrice,
      gstPct:   itemGstPct,
      gstAmt:   itemGst,
      total:    subtotal,
    });
  });

  // Cost summary row per category
  const catTotal = items.reduce(
    (s, it) => s + (parseFloat(it.UnitPrice) || 0) * (parseFloat(it.Quantity) || 0), 0
  );
  costSummaryRows.push({ label: catName, amount: catTotal });
});

  // ── Page layout constants ─────────────────────────────────────────────────
  const P1_LEFT  = 18;
  const P1_RIGHT = pageWidth - 18;
  const P1_W     = P1_RIGHT - P1_LEFT;

  // ── Footer helper ─────────────────────────────────────────────────────────
  function drawPage1Footer(pageLabel) {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(7);
    doc.setTextColor(100, 100, 100);
    doc.text(pageLabel, pageWidth - 10, pageHeight - 5, { align: 'right' });
    doc.setTextColor(0, 0, 0);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PAGE 1 — Header
  // ══════════════════════════════════════════════════════════════════════════
 stampLogoPage1();

// ── Company details block (right side, two-zone design) ──────────────────
const HD_LEFT  = P1_LEFT + 56;   // right of logo
const HD_TOP   = 2;
const HD_RIGHT = P1_RIGHT;
const HD_W     = HD_RIGHT - HD_LEFT;

// ── TOP ZONE: white background, dark text ────────────────────────────────
doc.setFillColor(255, 255, 255);
doc.rect(HD_LEFT, HD_TOP, HD_W, 13, 'F');

// Company name — dark navy bold
doc.setFont(undefined, 'bold');
doc.setFontSize(8.5);
doc.setTextColor(28, 42, 95);
doc.text('Inovace Engineering Consultancy', HD_LEFT + 2, HD_TOP + 4.5);

// Address line
doc.setFont(undefined, 'normal');
doc.setFontSize(7);
doc.setTextColor(30, 30, 30);
doc.text(
  'First Floor, Femina Complex, Chembra Road, Payyanangadi, Tirur, Malappuram, Kerala, Pin: 676101',
  HD_LEFT + 2, HD_TOP + 8.5,
  { maxWidth: HD_W - 4 }
);

// Branches line
doc.text('Branches: Sangamam Bazar, Calicut', HD_LEFT + 2, HD_TOP + 12.5);

// ── BOTTOM ZONE: two rows with text symbols ───────────────────────────────
const NAV_TOP = HD_TOP + 13.5;
const ROW_H   = 5.5;
const ICON_W  = 7;

// ═══ Row 1 — Phone ═══════════════════════════════════════════════════════
// Red icon background
doc.setFillColor(200, 30, 30);
doc.rect(HD_LEFT, NAV_TOP, ICON_W, ROW_H, 'F');

// Phone symbol — simple bold P in white
doc.setFont(undefined, 'bold');
doc.setFontSize(8);
doc.setTextColor(255, 255, 255);
doc.text('P', HD_LEFT + ICON_W / 2, NAV_TOP + 3.8, { align: 'center' });

// Navy text area
doc.setFillColor(28, 42, 95);
doc.rect(HD_LEFT + ICON_W, NAV_TOP, HD_W - ICON_W, ROW_H, 'F');
doc.setFont(undefined, 'normal');
doc.setFontSize(7);
doc.setTextColor(255, 255, 255);
doc.text(
  '9746089321,  9567367828,  9567376828     OFFICE: 9072440007',
  HD_LEFT + ICON_W + 2, NAV_TOP + 3.6
);

// ═══ Row 2 — Email ═══════════════════════════════════════════════════════
// Red icon background
doc.setFillColor(200, 30, 30);
doc.rect(HD_LEFT, NAV_TOP + ROW_H, ICON_W, ROW_H, 'F');

// Email symbol — simple @ in white
doc.setFont(undefined, 'bold');
doc.setFontSize(8);
doc.setTextColor(255, 255, 255);
doc.text('@', HD_LEFT + ICON_W / 2, NAV_TOP + ROW_H + 3.8, { align: 'center' });

// Navy text area
doc.setFillColor(28, 42, 95);
doc.rect(HD_LEFT + ICON_W, NAV_TOP + ROW_H, HD_W - ICON_W, ROW_H, 'F');
doc.setFont(undefined, 'normal');
doc.setFontSize(7);
doc.setTextColor(255, 255, 255);
doc.text(
  'inovaceeng@gmail.com          sales.inovaceeng@gmail.com',
  HD_LEFT + ICON_W + 2, NAV_TOP + ROW_H + 3.6
);

doc.setTextColor(0, 0, 0);
doc.setDrawColor(0, 0, 0);
doc.setLineWidth(0.3);

// ── total NAV_H for divider/title calc ───────────────────────────────────
const NAV_H = ROW_H * 2;

// ── Divider line below entire header ─────────────────────────────────────
doc.setDrawColor(28, 42, 95);
doc.setLineWidth(0.8);
doc.line(P1_LEFT, HD_TOP + 13.5 + NAV_H + 1, P1_RIGHT, HD_TOP + 13.5 + NAV_H + 1);
doc.setDrawColor(0, 0, 0);

// ── QUOTATION title ───────────────────────────────────────────────────────
const TITLE_Y = HD_TOP + 13.5 + NAV_H + 8;
doc.setFont(undefined, 'bold');
doc.setFontSize(12);
doc.text('QUOTATION', pageWidth / 2, TITLE_Y, { align: 'center' });
const qtW1 = doc.getTextWidth('QUOTATION');
doc.setLineWidth(0.5);
doc.setDrawColor(0, 0, 0);
doc.line(pageWidth / 2 - qtW1 / 2, TITLE_Y + 1.5,
         pageWidth / 2 + qtW1 / 2, TITLE_Y + 1.5);
doc.setLineWidth(0.4);
doc.setDrawColor(222, 220, 215);
doc.line(P1_LEFT, TITLE_Y + 5, P1_RIGHT, TITLE_Y + 5);
doc.setDrawColor(0, 0, 0);

  // TO block
  doc.setFont(undefined, 'bold');
  doc.setFontSize(8.5);
  doc.text('TO :', P1_LEFT, 46);
let toY = 52;
  const TO_LINE_H = 5;
  const TO_ADDR_W = 90;

  doc.setFont(undefined, 'bold');
  doc.setFontSize(9);
  doc.text(clientName, P1_LEFT, toY);
  toY += TO_LINE_H;

  if (clientAddr.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.splitTextToSize(clientAddr, TO_ADDR_W).forEach(line => {
      doc.text(line, P1_LEFT, toY); toY += TO_LINE_H;
    });
  }
  if (clientAddr3.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.splitTextToSize(clientAddr3, TO_ADDR_W).forEach(line => {
      doc.text(line, P1_LEFT, toY); toY += TO_LINE_H;
    });
  }
  if (clientPhone.trim()) {
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text('Phone : ' + clientPhone, P1_LEFT, toY);
    toY += TO_LINE_H;
  }

  // Right side info block
  const IB_RIGHT = P1_RIGHT;
  doc.setFont(undefined, 'bold');
  doc.setFontSize(9);
  doc.text('QTN NO : '       + quotNo,    IB_RIGHT, 44, { align: 'right' });
  doc.text('DATE : '         + entryDt,   IB_RIGHT, 50, { align: 'right' });
  doc.text('VALID UPTO : '   + validUpto, IB_RIGHT, 56, { align: 'right' });
  doc.text('PROJECT NAME : ' + projName,  IB_RIGHT, 62, { align: 'right' });
  doc.text('LOCATION : '     + location,  IB_RIGHT, 68, { align: 'right' });

  let infoRightY = 81;
  if (reference) {
    doc.text('REFERENCE : '    + reference,   IB_RIGHT, infoRightY, { align: 'right' });
    infoRightY += 6;
  }
  if (salesPerson) {
    doc.text('SALES PERSON : ' + salesPerson, IB_RIGHT, infoRightY, { align: 'right' });
    infoRightY += 6;
  }

  const PI_Y      = 75;
  const PI_LINE_H = 6.5;

  const piRows = [
    { label: 'CATEGORY',  value: category },
    { label: 'KIND ATTN', value: kindAttn },
    { label: 'SUBJECT',   value: subject  },
  ].filter(r => r.value.trim());

  piRows.forEach((row, i) => {
    const y = PI_Y + i * PI_LINE_H;
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8.5);
    doc.text(row.label, P1_LEFT, y);
    const labelW = doc.getTextWidth(row.label);
    doc.setFont(undefined, 'normal');
    const colon  = ' : ';
    doc.text(colon, P1_LEFT + labelW, y);
    const colonW = doc.getTextWidth(colon);
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);
    doc.text(
      doc.splitTextToSize(row.value, 100)[0] || '',
      P1_LEFT + labelW + colonW, y
    );
  });

  // ── Description block ─────────────────────────────────────────────────────
  const rawDescription = cleanText(safeStr(D.Description || ''));
  const descBlocks = rawDescription
    .split(/\n/)
    .map(l => l.trim())
    .filter(Boolean)
    .map(line => {
      const isPoint = /^(\d+[\.\)]\s+|[-•*]\s+)/.test(line);
      const clean   = line.replace(/^(\d+[\.\)]\s+|[-•*]\s+)/, '').trim();
      return { isPoint, text: clean };
    });

  const paragraphs = descBlocks.filter(b => !b.isPoint);
  const points     = descBlocks.filter(b =>  b.isPoint);

  const introY   = Math.max(PI_Y + piRows.length * PI_LINE_H + 5, infoRightY + 5);
  const INTRO_LH = 4.2;
  let   curY     = introY;

  if (paragraphs.length) {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8);
    doc.setTextColor(0, 0, 0);
    paragraphs.forEach(block => {
      doc.splitTextToSize(block.text, P1_W).forEach(l => {
        doc.text(l, P1_LEFT, curY); curY += INTRO_LH;
      });
    });
    curY += 2;
  }

  if (points.length) {
    doc.setFontSize(8);
    points.forEach((block, i) => {
      const prefix  = `${i + 1}. `;
      const prefixW = doc.getTextWidth(prefix);
      const lines   = doc.splitTextToSize(block.text, P1_W - prefixW);
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

  // ══════════════════════════════════════════════════════════════════════════
  // ITEMS TABLE
  // ══════════════════════════════════════════════════════════════════════════
  const TBL_LEFT     = P1_LEFT;
  const TBL_RIGHT    = P1_RIGHT;
  const TBL_W        = TBL_RIGHT - TBL_LEFT;
  const TBL_HEADER_H = 8;

  const COL_SR    = 12;
  const COL_QTY   = 14;
  const COL_UNIT  = 14;
  const COL_RATE  = 25;
  const COL_TOTAL = 28;
  const COL_DESC  = TBL_W - COL_SR - COL_QTY - COL_UNIT - COL_RATE - COL_TOTAL;

  const X_SR    = TBL_LEFT;
  const X_DESC  = X_SR   + COL_SR;
  const X_QTY   = X_DESC + COL_DESC;
  const X_UNIT  = X_QTY  + COL_QTY;
  const X_RATE  = X_UNIT + COL_UNIT;
  const X_TOTAL = X_RATE + COL_RATE;

  const colDividers  = [X_DESC, X_QTY, X_UNIT, X_RATE, X_TOTAL];
  const tableHeaderY = scopeStartY + 5;

  function drawTableHeader(y) {
    doc.setFillColor(30, 30, 30);
    doc.rect(TBL_LEFT, y, TBL_W, TBL_HEADER_H, 'F');
    doc.setTextColor(255, 255, 255);
    doc.setFont(undefined, 'bold');
    doc.setFontSize(8);
    const hMidY = y + TBL_HEADER_H / 2 + 1.5;
    doc.text('Sr. No.',      X_SR    + COL_SR    / 2, hMidY, { align: 'center' });
    doc.text('Description',  X_DESC  + 2,              hMidY);
    doc.text('Qty',          X_QTY   + COL_QTY   / 2, hMidY, { align: 'center' });
    doc.text('Units',        X_UNIT  + COL_UNIT  / 2, hMidY, { align: 'center' });
    doc.text('Unit Rate',    X_RATE  + COL_RATE   - 2, hMidY, { align: 'right'  });
    doc.text('Total Amount', X_TOTAL + COL_TOTAL  - 2, hMidY, { align: 'right'  });
    doc.setDrawColor(80, 80, 80);
    doc.setLineWidth(0.3);
    colDividers.forEach(x => doc.line(x, y, x, y + TBL_HEADER_H));
    doc.setDrawColor(0, 0, 0);
    doc.setLineWidth(0.5);
    doc.rect(TBL_LEFT, y, TBL_W, TBL_HEADER_H);
    doc.setTextColor(0, 0, 0);
  }

  drawTableHeader(tableHeaderY);

  const ROW_H_ITEM  = 8;
  const DESC_LINE_H = 4;
  const DESC_MAX_W  = COL_DESC - 4;

  let tblY        = tableHeaderY + TBL_HEADER_H;
  let rowIdx      = 0;
  let p1PageCount = 1;

  function drawTableRow(y, h, isGroup) {
    if (!isGroup) {
      const shade = rowIdx % 2 === 0 ? 255 : 248;
      doc.setFillColor(shade, shade, shade);
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
      stampLogo();         // ← small logo on continuation pages
      drawTableHeader(18);
      tblY   = 18 + TBL_HEADER_H;
      rowIdx = 0;
    }
  };

  tableRows.forEach((row) => {
    if (row.type === 'group') {
      checkP1Break(8);
      drawTableRow(tblY, 8, true);
      doc.setFont(undefined, 'bold');
      doc.setFontSize(8.5);
      doc.setTextColor(0, 0, 0);
      doc.text(row.sr,    X_SR   + COL_SR / 2, tblY + 5, { align: 'center' });
      doc.text(row.label, X_DESC + 2,           tblY + 5);
      tblY += 8;
    } else {
      const descLines  = doc.splitTextToSize(row.desc, DESC_MAX_W);
      const rowH       = Math.max(ROW_H_ITEM, descLines.length * DESC_LINE_H + 6);
      checkP1Break(rowH);
      drawTableRow(tblY, rowH, false);

      const midY       = tblY + rowH / 2 + 1.5;
      const firstLineY = tblY + 5;

      doc.setFont(undefined, 'normal');
      doc.setFontSize(8);
      doc.setTextColor(0, 0, 0);

      doc.text(row.sr, X_SR + COL_SR / 2, midY, { align: 'center' });
      descLines.forEach((line, li) => {
        doc.text(line, X_DESC + 2, firstLineY + li * DESC_LINE_H);
      });
      if (row.qty)      doc.text(safeStr(row.qty),  X_QTY   + COL_QTY  / 2, midY, { align: 'center' });
      if (row.units)    doc.text(safeStr(row.units), X_UNIT  + COL_UNIT / 2, midY, { align: 'center' });
      if (row.unitRate) doc.text(fmt(row.unitRate),  X_RATE  + COL_RATE  - 2, midY, { align: 'right'  });
      if (row.total)    doc.text(fmt(row.total),     X_TOTAL + COL_TOTAL - 2, midY, { align: 'right'  });

      rowIdx++;
      tblY += rowH;
    }
  });

  // Fix page footers
  const totalPages = p1PageCount + 1;
  for (let pg = 1; pg <= p1PageCount; pg++) {
    doc.setPage(pg);
    doc.setFillColor(255, 255, 255);
    doc.rect(0, pageHeight - 10, pageWidth, 10, 'F');
    drawPage1Footer(`Page: ${pg} of ${totalPages}`);
  }
  doc.setPage(p1PageCount);
  doc.addPage();

  // ══════════════════════════════════════════════════════════════════════════
  // PAGE 2 — Summary
  // ══════════════════════════════════════════════════════════════════════════
  doc.setTextColor(0, 0, 0);

  const CS_LEFT         = 18;
  const CS_RIGHT        = pageWidth - 18;
  const CS_TABLE_W      = CS_RIGHT - CS_LEFT;
  const CS_SR_W         = 14;
  const CS_AMT_W        = 55;
  const CS_HEADER_H     = 9;
  const CS_ROW_H        = 9;
  const CS_START_Y      = 18;
  const CS_BOTTOM_LIMIT = pageHeight - 60;

  function drawPage2Chrome() {
    stampLogo();   // ← small logo top-left on every summary page
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
    const DIVX       = CS_RIGHT - CS_AMT_W;

    const rows = [
      { label: 'SUB TOTAL :',            value: fmt(taxable)  },
      ...(discountAmt > 0 ? [{ label: 'DISCOUNT :',                   value: fmt(discountAmt) }] : []),
      ...(gstPercent  > 0 ? [{ label: `${gstPercent}% GST AMOUNT :`,  value: fmt(gstAmt)      }] : []),
      { label: 'NET QUOTATION AMOUNT :', value: fmt(netTotal) },
    ];

    rows.forEach((r, i) => {
      const ry = startY + i * TOT_LINE_H;
      doc.setFillColor(250, 250, 250);
      doc.rect(CS_LEFT, ry, CS_TABLE_W, TOT_LINE_H, 'F');
      doc.setTextColor(0, 0, 0);
      doc.setDrawColor(180, 180, 180);
      doc.setLineWidth(0.3);
      doc.rect(CS_LEFT, ry, CS_TABLE_W, TOT_LINE_H);
      doc.line(DIVX, ry, DIVX, ry + TOT_LINE_H);
      doc.setFont(undefined, 'bold');
      doc.setFontSize(8.5);
      const midY = ry + TOT_LINE_H / 2 + 1.5;
      doc.text(r.label, CS_LEFT + 3, midY);
      doc.text(r.value, CS_RIGHT - 3, midY, { align: 'right' });
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
    doc.text(IW_LABEL, CS_LEFT + 3,            startY + 5.5);
    doc.text(iwLines,  CS_LEFT + 3 + iwLabelW, startY + 5.5);

    return startY + iwH;
  }

  function drawTermsAndConditions(startY) {
    if (!termsLines.length) return startY;

    const TC_LINE_H = 4.5;
    const TC_WRAP_W = CS_TABLE_W - 8;

    doc.setFont(undefined, 'bold');
    doc.setFontSize(9);
    doc.setTextColor(0, 0, 0);
    doc.text('TERMS & CONDITIONS', CS_LEFT, startY);
    const headingW = doc.getTextWidth('TERMS & CONDITIONS');
    doc.setLineWidth(0.4);
    doc.line(CS_LEFT, startY + 1, CS_LEFT + headingW, startY + 1);

    let lineY = startY + 7;
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8.5);

    termsLines.forEach((line) => {
      const prefixMatch = line.match(/^(\d+[\.\)][a-z]?\.?\s+)/i);
      if (prefixMatch) {
        const prefix  = prefixMatch[0];
        const rest    = line.slice(prefix.length);
        const prefixW = doc.getTextWidth(prefix);
        const wrapped = doc.splitTextToSize(rest, TC_WRAP_W - prefixW);
        doc.text(prefix, CS_LEFT, lineY);
        wrapped.forEach((wl, wi) => {
          doc.text(wl, CS_LEFT + prefixW, lineY + wi * TC_LINE_H);
        });
        lineY += wrapped.length * TC_LINE_H + 1;
      } else {
        const wrapped = doc.splitTextToSize(line, TC_WRAP_W - 6);
        wrapped.forEach((wl, wi) => {
          doc.text(wl, CS_LEFT + 6, lineY + wi * TC_LINE_H);
        });
        lineY += wrapped.length * TC_LINE_H + 1;
      }
    });

    return lineY + 2;
  }

  function drawSignature(startY) {
    doc.setFont(undefined, 'normal');
    doc.setFontSize(8);
    doc.text('Prepared By',              CS_LEFT + 2,  startY);
    doc.setFontSize(9);
    doc.text(preparedBy || '',       CS_LEFT + 2,  startY + 6);
 doc.text('Contact No:',              CS_LEFT + 2,  startY+12);
    doc.setFontSize(9);
    doc.text(ContactNo || '',       CS_LEFT + 2,  startY + 17);
    
    doc.setFontSize(8);
    doc.text('Thanking You',              CS_RIGHT - 3, startY,     { align: 'right' });
    doc.setFontSize(8.5);
    doc.text('For : ' + CONTACT.company, CS_RIGHT - 3, startY + 6, { align: 'right' });

    // Divider
    const divY = startY + 18;
    doc.setDrawColor(222, 220, 215);
    doc.setLineWidth(0.5);
    doc.line(CS_LEFT, divY, CS_RIGHT, divY);
    doc.setDrawColor(0, 0, 0);


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