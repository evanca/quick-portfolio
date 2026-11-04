import { $, $$, onFrame, lerp, reduced, toast } from './utils.js';
import { split } from './split.js';
import { initCursor, pointer } from './cursor.js';
import { initScroll, initReveals } from './scroll.js';
import { runLoader } from './loader.js';
import { initWorks } from './works.js';
import { initCase } from './case.js';

const EMAIL = 'pedro.coelho.web@gmail.com';

// Local time in Portugal, shown in the header and footer.
function initClock() {
  const fmt = new Intl.DateTimeFormat('en-GB', { hour: '2-digit', minute: '2-digit', timeZone: 'Europe/Lisbon' });
  const tick = () => { const t = fmt.format(new Date()); $('#clock').textContent = t; $('#clock2').textContent = t; };
  tick();
  setInterval(tick, 20000);
}

// "I make ___" word roller. Appends a copy of the first word so the loop is seamless.
function initRoller() {
  const list = $('#roller');
  if (!list || reduced) return;
  const n = list.children.length;
  list.append(list.firstElementChild.cloneNode(true));
  let i = 0;
  setInterval(() => {
    if (document.hidden) return;
    list.classList.remove('is-snap');
    list.style.setProperty('--i', ++i);
    if (i === n) {
      setTimeout(() => {
        list.classList.add('is-snap');
        i = 0;
        list.style.setProperty('--i', 0);
      }, 850);
    }
  }, 2300);
}

// A soft orange glow follows the pointer in the hero and the portrait leans with it.
function initHeroMotion() {
  const hero = $('.hero');
  if (reduced) return;
  let gx = innerWidth * .6, gy = innerHeight * .3, tx = 0;
  onFrame(() => {
    const r = hero.getBoundingClientRect();
    if (r.bottom < 0) return;
    gx = lerp(gx, pointer.moved ? pointer.x : innerWidth * .6, .06);
    gy = lerp(gy, pointer.moved ? pointer.y - r.top : innerHeight * .3, .06);
    tx = lerp(tx, pointer.nx, .08);
    hero.style.setProperty('--gx', `${gx.toFixed(1)}px`);
    hero.style.setProperty('--gy', `${gy.toFixed(1)}px`);
    hero.style.setProperty('--tx', tx.toFixed(3));
  });
}

function initContact() {
  $('#copy').addEventListener('click', async () => {
    try {
      await navigator.clipboard.writeText(EMAIL);
      toast('Email copied');
    } catch {
      toast(EMAIL);
    }
  });
}

async function boot() {
  initCursor();
  initClock();

  // Prepare split text before anything is revealed.
  let n = 0;
  $$('.hero [data-split]').forEach(el => { n = split(el, n) - 4; });
  $$('[data-split]:not(.hero [data-split]):not(.row__t)').forEach(el => split(el));

  initScroll();
  initReveals();
  initRoller();
  initHeroMotion();
  initContact();

  const cs = initCase();
  initWorks(cs.open);

  await Promise.race([document.fonts?.ready, new Promise(r => setTimeout(r, 1200))]);
  await runLoader();

  // Hero entrance.
  $$('[data-hero]').forEach(el => el.classList.add('is-in'));
  document.documentElement.classList.add('is-ready');

  // Deep link such as #project-spy.
  if (/^#project-/.test(location.hash)) cs.fromHash();
}

boot();
