// Click-to-enter loader. Counts to 100, then waits for a click (or Enter) before wiping away.
// Skipped on repeat visits within the session and when the visitor prefers reduced motion.
import { $, onFrame } from './utils.js';

export function runLoader() {
  const html = document.documentElement;
  if (!html.classList.contains('has-loader')) return Promise.resolve();

  const count = $('#count');
  const btn = $('#enter');
  const label = $('#enter-label');
  const hint = $('#hint');

  return new Promise(resolve => {
    const t0 = performance.now();
    // Waits for the portrait only (lazy images below the fold would never settle), with a safety timeout.
    const hero = $('.hero__photo img');
    const imgsReady = Promise.race([
      hero?.decode ? hero.decode().catch(() => {}) : Promise.resolve(),
      new Promise(r => setTimeout(r, 4000))
    ]);
    let done = false;
    imgsReady.then(() => (done = true));

    const stop = onFrame((_, t) => {
      const k = Math.min(1, (t - t0) / 1500);
      // Never reaches 100 before the images are decoded.
      const shown = Math.round((k * (done ? 100 : 92)));
      count.textContent = String(shown).padStart(3, '0');
      if (k >= 1 && done) {
        stop();
        count.textContent = '100';
        btn.disabled = false;
        label.textContent = 'Enter';
        hint.textContent = 'Ready. Click to enter';
        btn.focus({ preventScroll: true });
      }
    });

    const enter = () => {
      if (btn.disabled) return;
      try { sessionStorage.setItem('pc-entered', '1'); } catch (e) {}
      html.classList.add('is-entered');
      btn.removeEventListener('click', enter);
      setTimeout(resolve, 650);
    };
    btn.addEventListener('click', enter);
  });
}
