// Splits text into masked characters so headlines can rise into place one letter at a time.
// Each glyph is .c (mask) > .c__i (moves). A screen-reader copy is kept in .sr and the
// visual spans are hidden from assistive tech.
export function split(el, start = 0) {
  if (el.dataset.splitDone) return start;
  const text = el.textContent.replace(/\s+/g, ' ').trim();

  const sr = document.createElement('span');
  sr.className = 'sr';
  sr.textContent = text;
  el.textContent = '';
  el.append(sr);

  let i = start;
  text.split(' ').forEach((word, wi, words) => {
    const w = document.createElement('span');
    w.className = 'w';
    w.setAttribute('aria-hidden', 'true');
    for (const ch of word) {
      const mask = document.createElement('span');
      mask.className = 'c';
      const inner = document.createElement('span');
      inner.className = 'c__i';
      inner.dataset.c = ch;
      inner.textContent = ch;
      inner.style.setProperty('--i', i++);
      mask.append(inner);
      w.append(mask);
    }
    el.append(w);
    if (wi < words.length - 1) el.append(' ');
  });
  el.dataset.splitDone = '1';
  return i;
}

// Splits into words for the scroll-scrubbed paragraph.
export function splitWords(el) {
  const text = el.textContent.replace(/\s+/g, ' ').trim();
  const sr = document.createElement('span');
  sr.className = 'sr';
  sr.textContent = text;
  el.textContent = '';
  el.append(sr);
  const words = text.split(' ').map((word, i, all) => {
    const s = document.createElement('span');
    s.className = 'sw';
    s.setAttribute('aria-hidden', 'true');
    s.textContent = word + (i < all.length - 1 ? ' ' : '');
    el.append(s);
    return s;
  });
  return words;
}
