import "bootstrap";
import { selectorTabShow , selectorTabCarousel } from 'plugins/init_tab';
import '../plugins/init_select2';
import "../plugins/init_flatpickr";
import $ from 'jquery';

import 'lightgallery.js';
import 'lightgallery.js/dist/css/lightgallery.css';
// import 'jquery-ui/themes/base/autocomplete.css';
// import "jquery-ui-dist/jquery-ui.css";
// import 'jquery-ui/ui/core';
// import 'jquery-ui/ui/widgets/autocomplete';

if (document.getElementById('lightgallery')){
  lightGallery(document.getElementById('lightgallery'));
}

// $('#play-selector').autocomplete({
// })

if (document.querySelector('.player-field-tag')) {
  // $('.player-field-tag').autocomplete({})
}

selectorTabShow();


if (document.getElementById('collaborations-selector')) {
  selectorTabCarousel();
  setInterval(selectorTabCarousel, 15000);
}




// $('#task_user_name').autocomplete
//     source: $('#task_user_name').data('autocomplete-source')
