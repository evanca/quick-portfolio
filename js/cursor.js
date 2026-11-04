// Custom cursor (dot + lagging ring), shared pointer state and magnetic elements.
// Only active with a real mouse and when motion is allowed; touch keeps the native pointer.
import { $, $$, clamp, lerp, onFrame, fine, reduced } from './utils.js';

export const pointer = { x: innerWidth / 2, y: innerHeight / 2, nx: 0, ny: 0, moved: false };

export function initCursor() {
  addEventListener('pointermove', e => {
    if (e.pointerType === 'touch') return;
    pointer.x = e.clientX;
    pointer.y = e.clientY;
    pointer.nx = e.clientX / innerWidth * 2 - 1;
    pointer.ny = e.clientY / innerHeight * 2 - 1;
    pointer.moved = true;
  }, { passive: true });

  if (!fine || reduced) return;

  const root = $('#cursor');
  const dot = $('.cursor__dot', root);
  const ring = $('.cursor__ring', root);
  const label = $('.cursor__label', root);
  document.documentElement.classList.add('has-cursor');

  let rx = pointer.x, ry = pointer.y;
  onFrame(() => {
    rx = lerp(rx, pointer.x, .2);
    ry = lerp(ry, pointer.y, .2);
    dot.style.translate = `${pointer.x}px ${pointer.y}px`;
    ring.style.translate = `${rx}px ${ry}px`;
  });

  // Mode comes from the nearest [data-cursor] ancestor: link, label, view or drag.
  document.addEventListener('pointerover', e => {
    const t = e.target.closest?.('[data-cursor]');
    root.dataset.mode = t ? t.dataset.cursor : '';
    label.textContent = t?.dataset.cursorLabel || '';
  });
  document.addEventListener('pointerleave', () => { root.style.opacity = 0; });
  document.addEventListener('pointerenter', () => { root.style.opacity = 1; });
  addEventListener('pointerdown', () => root.classList.add('is-down'));
  addEventListener('pointerup', () => root.classList.remove('is-down'));

  // Magnetic elements lean towards the pointer when it comes close.
  const mags = $$('[data-magnetic]').map(el => ({ el, x: 0, y: 0 }));
  onFrame(() => {
    for (const m of mags) {
      const r = m.el.getBoundingClientRect();
      if (r.bottom < -80 || r.top > innerHeight + 80) continue;
      const cx = r.left + r.width / 2, cy = r.top + r.height / 2;
      const dx = pointer.x - cx, dy = pointer.y - cy;
      const reach = Math.max(r.width, r.height) * .85;
      const near = Math.hypot(dx, dy) < reach;
      const tx = near ? clamp(dx * .28, -26, 26) : 0;
      const ty = near ? clamp(dy * .28, -26, 26) : 0;
      m.x = lerp(m.x, tx, .16);
      m.y = lerp(m.y, ty, .16);
      m.el.style.translate = Math.abs(m.x) + Math.abs(m.y) < .05 ? '' : `${m.x.toFixed(2)}px ${m.y.toFixed(2)}px`;
    }
  });
}
