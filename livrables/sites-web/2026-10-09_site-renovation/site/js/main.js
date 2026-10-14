/* =========================================================
   Atelier Facette : interactions du site
   Le même fichier sert à toutes les pages : chaque bloc vérifie
   d'abord que l'élément concerné existe sur la page.
   ========================================================= */

// L'utilisateur a-t-il demandé à réduire les animations ?
const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

/* ---------- Menu sur téléphone (bouton "burger") ---------- */
const burger = document.querySelector('.burger');
const menu = document.getElementById('menu');
if (burger && menu) {
  burger.addEventListener('click', () => {
    const open = menu.classList.toggle('open');
    burger.setAttribute('aria-expanded', open);
    burger.setAttribute('aria-label', open ? 'Fermer le menu' : 'Ouvrir le menu');
  });
}

/* ---------- Diaporama de l'accueil ---------- */
const show = document.getElementById('diaporama');
if (show) {
  const tabs = document.querySelectorAll('.tab');
  const slides = show.querySelectorAll('.slide');
  const dots = show.querySelectorAll('.dots i');
  const caption = show.querySelector('.cap-t');
  const pauseBtn = show.querySelector('.pause');
  let current = 0;
  let timer = null;
  let paused = reduceMotion;

  const showSlide = (i) => {
    current = i;
    slides.forEach((s, n) => s.classList.toggle('on', n === i));
    dots.forEach((d, n) => d.classList.toggle('on', n === i));
    tabs.forEach((t, n) => t.setAttribute('aria-selected', n === i));
    caption.textContent = slides[i].dataset.caption;
  };
  const startTimer = () => {
    clearInterval(timer);
    if (!paused) timer = setInterval(() => showSlide((current + 1) % slides.length), 6500);
  };
  tabs.forEach((t) => t.addEventListener('click', () => {
    showSlide(Number(t.dataset.slide));
    startTimer();
  }));
  pauseBtn.addEventListener('click', () => {
    paused = !paused;
    pauseBtn.setAttribute('aria-label', paused ? 'Relancer le diaporama' : 'Mettre le diaporama en pause');
    pauseBtn.innerHTML = paused
      ? '<svg viewBox="0 0 24 24" class="ic" style="stroke-width:2.2"><path d="M8 5l11 7-11 7z"/></svg>'
      : '<svg viewBox="0 0 24 24" class="ic" style="stroke-width:2.2"><path d="M9 6v12M15 6v12"/></svg>';
    startTimer();
  });
  if (reduceMotion) pauseBtn.hidden = true;
  startTimer();
}

/* ---------- Nuancier (page Béton ciré et résine) ---------- */
const swatches = document.querySelectorAll('.sw');
if (swatches.length) {
  const textures = document.querySelectorAll('.nuan-pv .tx');
  const swatchName = document.querySelector('.nuan-pv .cap-t');
  swatches.forEach((sw, i) => sw.addEventListener('click', () => {
    const name = sw.querySelector('span').textContent;
    swatches.forEach((s, n) => s.setAttribute('aria-pressed', n === i));
    textures.forEach((t, n) => {
      t.classList.toggle('on', n === i);
      t.alt = n === i ? 'Texture de béton ciré, teinte ' + name : '';
    });
    swatchName.textContent = name;
  }));
}

/* ---------- Curseurs avant / après (page Réalisations) ---------- */
document.querySelectorAll('.ba').forEach((ba) => {
  const range = ba.querySelector('input');
  range.addEventListener('input', () => ba.style.setProperty('--pos', range.value + '%'));
});

/* ---------- Apparition des blocs au défilement (Firefox, Safari) ---------- */
// Chrome et Edge le font en CSS pur. Les autres navigateurs passent par ici.
if (!reduceMotion && !CSS.supports('animation-timeline: view()') && 'IntersectionObserver' in window) {
  document.documentElement.classList.add('io');
  const io = new IntersectionObserver((entries) => {
    entries.forEach((e) => {
      if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); }
    });
  }, { threshold: 0.12 });
  document.querySelectorAll('.rv').forEach((el) => io.observe(el));
}

/* ---------- Chiffres clés qui comptent jusqu'à leur valeur (page À propos) ---------- */
const counters = document.querySelectorAll('.cnt');
const stats = document.querySelector('.stats');
if (!reduceMotion && counters.length && stats && 'IntersectionObserver' in window) {
  counters.forEach((c) => { c.textContent = '0'; });
  const io2 = new IntersectionObserver((entries) => {
    if (!entries.some((e) => e.isIntersecting)) return;
    io2.disconnect();
    const t0 = performance.now();
    const step = (now) => {
      const p = Math.min(1, (now - t0) / 1400);
      const eased = 1 - Math.pow(1 - p, 3);
      counters.forEach((c) => { c.textContent = Math.round(Number(c.dataset.count) * eased); });
      if (p < 1) requestAnimationFrame(step);
    };
    requestAnimationFrame(step);
  }, { threshold: 0.35 });
  io2.observe(stats);
}

/* ---------- Formulaire de devis (page Contact) ---------- */
// En ligne, le formulaire est envoyé à Netlify Forms (voir contact.html).
// Ouvert directement depuis le PC (adresse en file://), aucun envoi n'est possible : on affiche un message de test.
const form = document.getElementById('devis');
if (form) {
  const MAX_TOTAL = 8 * 1024 * 1024; // limite de Netlify : 8 Mo par envoi
  const fileInputs = form.querySelectorAll('input[type="file"]');
  const message = form.querySelector('.sent');
  const say = (text, isError) => {
    message.textContent = text;
    message.classList.toggle('err', isError);
    message.hidden = false;
  };

  // Exemple de message adapté au type de travaux choisi (texte grisé, jamais envoyé)
  // Pour modifier un exemple : changer le texte entre guillemets ci-dessous.
  const exemples = {
    'Sol en résine': 'Ex. : garage de 25 m², sol actuel en chape béton brute avec des fissures (ou carrelage, ancien PVC…). Usage : voiture, atelier, pièce de vie ? Délai souhaité ?',
    'Béton ciré': 'Ex. : salon et cuisine ouverte de 30 m², sol actuel en carrelage (ou chape béton, parquet…). Sol, murs ou plan de travail ? Teinte envisagée ? Délai souhaité ?',
    'Cuisine': 'Ex. : cuisine de 12 m² à refaire, dépose de l’ancienne, plan de travail et crédence. Murs en placo ou en béton ? Arrivées d’eau ou prises à déplacer ?',
    'Salle de bain': 'Ex. : salle de bain de 6 m², baignoire à remplacer par une douche à l’italienne, carrelage au sol et aux murs. Murs en placo ou en béton ? Plomberie à déplacer ?',
    'Murs (enduits, peinture)': 'Ex. : salon de 25 m², murs en placo (ou béton, plâtre ancien). Fissures, trous, papier peint à retirer ? Finition souhaitée : peinture, enduit, béton ciré ?',
    'Sols (PVC, parquet, carrelage)': 'Ex. : chambre de 14 m², sol actuel en moquette sur chape béton (ou plancher bois, ancien carrelage). Revêtement souhaité : parquet, PVC, carrelage ? Plinthes à changer ?',
    'Rénovation complète': 'Ex. : appartement de 60 m², sols, murs, cuisine et salle de bain. Logement habité pendant les travaux ? Date de début souhaitée ?',
    'Autre': 'Décrivez votre projet : la pièce, la surface, le matériau actuel (chape béton, carrelage, placo, béton…) et le résultat souhaité.'
  };
  const typeSelect = form.querySelector('#f-type');
  const projet = form.querySelector('#f-msg');
  const majExemple = () => { projet.placeholder = exemples[typeSelect.value] || exemples['Autre']; };
  typeSelect.addEventListener('change', majExemple);
  majExemple();

  // Champ « Support actuel » : affiché seulement pour les types de travaux listés ici.
  // Caché, il est aussi désactivé (disabled) pour ne pas être envoyé avec la demande.
  const typesAvecSupport = ['Sol en résine', 'Béton ciré', 'Sols (PVC, parquet, carrelage)'];
  const blocSupport = form.querySelector('#bloc-support');
  const support = form.querySelector('#f-support');
  const majSupport = () => {
    const afficher = typesAvecSupport.includes(typeSelect.value);
    blocSupport.hidden = !afficher;
    support.disabled = !afficher;
  };
  typeSelect.addEventListener('change', majSupport);
  majSupport();

  // Affiche le nom de la photo choisie sous chaque champ
  fileInputs.forEach((input) => input.addEventListener('change', () => {
    const note = input.closest('.drop').querySelector('.drop-n');
    note.textContent = input.files.length ? input.files[0].name : 'Choisir une photo';
  }));

  form.addEventListener('submit', (e) => {
    const total = [...fileInputs].reduce((sum, i) => sum + (i.files[0] ? i.files[0].size : 0), 0);
    if (total > MAX_TOTAL) {
      e.preventDefault();
      say('Les photos dépassent 8 Mo au total (' + (total / 1048576).toFixed(1) + ' Mo). Retirez une photo ou envoyez des photos plus légères.', true);
      return;
    }
    if (location.protocol === 'file:') {
      e.preventDefault();
      say('Version de test sur l’ordinateur : le formulaire sera réellement envoyé une fois le site en ligne.', false);
    }
  });
}

/* ---------- Année du pied de page ---------- */
const year = document.querySelector('.year');
if (year) year.textContent = new Date().getFullYear();
