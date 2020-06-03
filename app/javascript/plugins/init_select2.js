import 'select2';
import "select2/dist/css/select2.css";

   var projects = [
      {
        value: "jquery",
        label: "jQuery",
        desc: "the write less, do more, JavaScript library",
        icon: "jquery_32x32.png"
      },
      {
        value: "jquery-ui",
        label: "jQuery UI",
        desc: "the official user interface library for jQuery",
        icon: "jqueryui_32x32.png"
      },
      {
        value: "sizzlejs",
        label: "Sizzle JS",
        desc: "a pure-JavaScript CSS selector engine",
        icon: "sizzlejs_32x32.png"
      }
    ];

const initSelect2 = () => {
  $('.select2').select2( {
  placeholder: "Selectionner un utilisateur de EGM",
  width: '100%'}); // (~ document.querySelectorAll)
};

if (document.querySelector('.select2')) {

  initSelect2();

  $('.select2').on('select2:select', function (e) {

      if (document.querySelector('.game-id')) {
        var gameId = document.querySelector('.game-id');
        var data = e.params.data;
        // console.log(data.id.slice(5));
        // gameId.value = parseInt(data.id.slice(5), 10);
        // console.log(gameId);
      }
      if (document.querySelector('.player-field-tag')) {
        var player = document.querySelector('.player-field-tag');
        var data = e.params.data;
        console.log(data.id);
        player.value = data.id.slice(5);
        console.log(data);
      }
  });
  // const game = document.getElementById('select2-game-input-container');
  // game.addEventListener('change', (data) => {
  //     console.log(data);
  // })

  // const gameSelects = document.querySelectorAll('.select2-results__option');

  // gameSelects.forEach( (gameSelect) => {
  //   gameSelect.addEventListener('mouseup', (data) => {
  //     console.log(data);
  //   })
  // })


  // gameId.addEventListener('change', (data) => {
  //   console.log(data);
  // })
}
