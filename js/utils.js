// Small shared helpers: DOM shortcuts, math, media queries and one shared rAF loop.
export const $ = (sel, root = document) => root.querySelector(sel);
export const $$ = (sel, root = document) => [...root.querySelectorAll(sel)];
export const clamp = (v, a, b) => Math.min(b, Math.max(a, v));
export const lerp = (a, b, t) => a + (b - a) * t;

export const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
export const fine = matchMedia('(hover: hover) and (pointer: fine)').matches;

// One requestAnimationFrame loop for every effect. The browser already pauses it
// in background tabs, and it only runs once something subscribes.
const subs = new Set();
let running = false;
let last = 0;
function loop(t) {
  const dt = Math.min(50, t - last || 16);
  last = t;
  subs.forEach(fn => fn(dt, t));
  requestAnimationFrame(loop);
}
export function onFrame(fn) {
  subs.add(fn);
  if (!running) { running = true; requestAnimationFrame(loop); }
  return () => subs.delete(fn);
}

// Adds .is-in the first time an element is meaningfully on screen.
export function revealOnView(els, { threshold = 0.18, margin = '0px 0px -8% 0px', root = null } = {}) {
  const io = new IntersectionObserver(entries => {
    for (const e of entries) {
      if (!e.isIntersecting) continue;
      e.target.classList.add('is-in');
      io.unobserve(e.target);
    }
  }, { threshold, rootMargin: margin, root });
  els.forEach(el => io.observe(el));
  return io;
}

export function toast(msg) {
  const el = $('#toast');
  if (!el) return;
  el.textContent = msg;
  el.classList.add('is-on');
  clearTimeout(toast.t);
  toast.t = setTimeout(() => el.classList.remove('is-on'), 2200);
}
