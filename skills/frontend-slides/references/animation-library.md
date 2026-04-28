# CSS Animation Library

Used by `/frontend-slides`. Ready-to-use CSS animation blocks for slide transitions and content reveals.

---

## Slide Transitions

### Fade (default — works for all contexts)

```css
.slide {
  opacity: 0;
  transition: opacity 300ms ease;
  pointer-events: none;
  position: absolute;
  width: 100%;
  height: 100%;
}
.slide.active {
  opacity: 1;
  pointer-events: auto;
}
```

### Slide-left (sequential content, step-by-step reveals)

```css
.slide {
  transform: translateX(100%);
  transition: transform 250ms ease-in-out;
  position: absolute;
  width: 100%;
  height: 100%;
}
.slide.active {
  transform: translateX(0);
}
.slide.prev {
  transform: translateX(-100%);
}
```

### Slide-up (data reveals, stat slides)

```css
.slide {
  transform: translateY(40px);
  opacity: 0;
  transition: transform 300ms ease, opacity 300ms ease;
  position: absolute;
  width: 100%;
  height: 100%;
}
.slide.active {
  transform: translateY(0);
  opacity: 1;
}
```

### Cut (bold-impact preset — instant, no transition)

```css
.slide {
  display: none;
  position: absolute;
  width: 100%;
  height: 100%;
}
.slide.active {
  display: flex;
}
```

---

## Content Reveal Animations

### Staggered bullet reveal

Apply to bullet items to reveal them one-by-one on each click:

```css
.bullet-item {
  opacity: 0;
  transform: translateY(12px);
  transition: opacity 250ms ease, transform 250ms ease;
}
.bullet-item.visible {
  opacity: 1;
  transform: translateY(0);
}
```

```javascript
// Add class on click
let revealed = 0;
const bullets = document.querySelectorAll('.slide.active .bullet-item');
document.addEventListener('click', () => {
  if (revealed < bullets.length) {
    bullets[revealed].classList.add('visible');
    revealed++;
  } else {
    nextSlide();
    revealed = 0;
  }
});
```

### Animated counter (for stat slides)

```javascript
function animateCounter(element, target, duration = 1500) {
  const start = 0;
  const increment = target / (duration / 16);
  let current = start;

  const timer = setInterval(() => {
    current += increment;
    if (current >= target) {
      current = target;
      clearInterval(timer);
    }
    element.textContent = Math.floor(current).toLocaleString();
  }, 16);
}

// Trigger when slide becomes active
document.addEventListener('slidechange', () => {
  const counter = document.querySelector('.slide.active [data-count]');
  if (counter) animateCounter(counter, parseInt(counter.dataset.count));
});
```

### Fade-in on entry (for images, quotes, logos)

```css
.fade-in-entry {
  animation: fadeInEntry 400ms ease forwards;
  animation-delay: 200ms;
  opacity: 0;
}

@keyframes fadeInEntry {
  from {
    opacity: 0;
    transform: translateY(16px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

---

## Neon Glow Effect (neon-cyber preset)

```css
.glow-text {
  color: var(--accent);
  text-shadow:
    0 0 10px rgba(0, 255, 179, 0.8),
    0 0 20px rgba(0, 255, 179, 0.4),
    0 0 40px rgba(0, 255, 179, 0.2);
}

.glow-border {
  border: 1px solid var(--accent);
  box-shadow:
    0 0 10px rgba(0, 255, 179, 0.3),
    inset 0 0 10px rgba(0, 255, 179, 0.05);
}
```

---

## Progress Bar

Top-of-screen progress indicator:

```css
.progress-bar {
  position: fixed;
  top: 0;
  left: 0;
  height: 3px;
  background: var(--accent);
  transition: width 250ms ease;
  z-index: 100;
}
```

```javascript
function updateProgress() {
  const progress = ((currentSlide + 1) / totalSlides) * 100;
  document.querySelector('.progress-bar').style.width = `${progress}%`;
}
```

---

## Fullscreen Toggle

```javascript
function toggleFullscreen() {
  if (!document.fullscreenElement) {
    document.documentElement.requestFullscreen();
  } else {
    document.exitFullscreen();
  }
}
```

---

## Speaker Notes Toggle

```css
.speaker-notes {
  display: none;
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.85);
  color: #fff;
  padding: 16px 32px;
  font-size: 16px;
  line-height: 1.5;
  max-height: 30vh;
  overflow-y: auto;
  z-index: 200;
}
.speaker-notes.visible {
  display: block;
}
```

```javascript
function toggleSpeakerNotes() {
  const notes = document.querySelector('.speaker-notes');
  notes.classList.toggle('visible');
  const activeNotes = document.querySelector('.slide.active .notes-content');
  if (activeNotes) notes.textContent = activeNotes.textContent;
}
```
