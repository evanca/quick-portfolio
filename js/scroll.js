// Everything that reacts to scrolling: progress line, header hide and theme, chapter rail,
// parallax, the word-by-word paragraph, velocity-driven tickers and count-up numbers.
import { $, $$, clamp, lerp, onFrame, reduced, revealOnView } from './utils.js';
import { splitWords } from './split.js';

export const scrollState = { y: 0, v: 0 };

export function initScroll() {
  const root = document.documentElement;
  const bar = $('#bar');
  const sections = $$('[data-theme]').filter(s => s.tagName !== 'HEADER');
  const chapters = $$('[data-chapter]');
  const railLinks = new Map($$('.rail a').map(a => [a.dataset.ch, a]));

  // Chapter rail: the section that covers the middle of the viewport is current.
  const chIO = new IntersectionObserver(entries => {
    for (const e of entries) {
      if (!e.isIntersecting) continue;
      railLinks.forEach(a => a.classList.remove('is-on'));
      railLinks.get(e.target.dataset.chapter)?.classList.add('is-on');
    }
  }, { rootMargin: '-45% 0px -45% 0px' });
  chapters.forEach(c => chIO.observe(c));

  // Count-up numbers.
  $$('[data-count]').forEach(el => {
    const to = Number(el.dataset.count);
    if (reduced) { el.textContent = to; return; }
    const io = new IntersectionObserver(([e]) => {
      if (!e.isIntersecting) return;
      io.disconnect();
      const t0 = performance.now();
      const stop = onFrame((_, t) => {
        const k = clamp((t - t0) / 1400, 0, 1);
        el.textContent = Math.round(to * (1 - Math.pow(1 - k, 4)));
        if (k >= 1) stop();
      });
    }, { threshold: .6 });
    io.observe(el);
  });

  // Paragraph that lights up word by word as it crosses the screen.
  const scrubs = $$('[data-scrub]').map(el => ({ el, words: splitWords(el) }));

  const parallax = $$('[data-parallax]').map(el => ({ el, speed: Number(el.dataset.parallax) || .1 }));

  // Tickers: two copies of the line scroll sideways; scroll speed pushes them faster and skews them.
  const marquees = $$('[data-marquee]').map(el => {
    [...el.children].forEach(n => {
      const c = n.cloneNode(true);
      c.setAttribute('aria-hidden', 'true');
      el.append(c);
    });
    return { el, dir: Number(el.dataset.marquee) || -1, x: 0, w: 0 };
  });
  // Every ticker is a single flex row holding its items twice, so half its width is one loop.
  const measure = () => marquees.forEach(m => { m.w = m.el.scrollWidth / 2; });
  document.fonts?.ready.then(measure);
  addEventListener('resize', measure);
  measure();

  let lastY = scrollY;
  let hidden = false;

  onFrame(dt => {
    const y = scrollY;
    const dy = y - scrollState.y;
    scrollState.y = y;
    scrollState.v = lerp(scrollState.v, dy, .14);

    const max = root.scrollHeight - innerHeight;
    root.style.setProperty('--p', max > 0 ? (y / max).toFixed(4) : 0);

    // Header: tucks away while reading downwards, returns on the way up.
    if (!document.documentElement.classList.contains('is-locked')) {
      if (y > 260 && y - lastY > 6) hidden = true;
      else if (y < 260 || lastY - y > 6) hidden = false;
      lastY = y;
      bar.classList.toggle('is-hidden', hidden);
    }
    // Header colour follows whatever section sits under it.
    for (const s of sections) {
      const r = s.getBoundingClientRect();
      if (r.top <= 34 && r.bottom > 34) {
        const t = s.dataset.theme === 'dark' ? 'dark' : 'light';
        if (bar.dataset.theme !== t) bar.dataset.theme = t;
        break;
      }
    }

    if (reduced) return;

    for (const p of parallax) {
      const r = p.el.getBoundingClientRect();
      if (r.bottom < -200 || r.top > innerHeight + 200) continue;
      const off = r.top + r.height / 2 - innerHeight / 2;
      p.el.style.translate = `0 ${(-off * p.speed).toFixed(1)}px`;
    }

    for (const s of scrubs) {
      const r = s.el.getBoundingClientRect();
      if (r.bottom < 0 || r.top > innerHeight) continue;
      const prog = clamp((innerHeight * .92 - r.top) / (innerHeight * .55 + r.height * .6), 0, 1);
      const n = s.words.length;
      s.words.forEach((w, i) => {
        const k = clamp(prog * (n + 8) - i, 0, 8) / 8;
        w.style.opacity = (.16 + .84 * k).toFixed(3);
      });
    }

    const v = scrollState.v;
    for (const m of marquees) {
      m.x += (m.dir * (1.1 + Math.abs(v) * .9)) * (dt / 16);
      if (m.w) { if (m.x <= -m.w) m.x += m.w; if (m.x > 0) m.x -= m.w; }
      m.el.style.translate = `${m.x.toFixed(1)}px 0`;
      m.el.style.transform = `skewX(${clamp(-v * .35, -9, 9).toFixed(2)}deg)`;
    }
  });
}

export function initReveals(root = document) {
  return revealOnView($$('[data-reveal]:not([data-hero])', root));
}
