import "bootstrap";
import { selectorTabShow , selectorTabCarousel } from 'plugins/init_tab';

selectorTabShow();

if (document.getElementById('collaborations-selector')) {
  selectorTabCarousel();
  setInterval(selectorTabCarousel, 15000);
}

