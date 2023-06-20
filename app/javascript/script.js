// ヘッダーの時計
setInterval(function() {
    let date = new Date();
    let hours = date.getHours();
    let ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    let minutes = date.getMinutes();
    minutes = minutes < 10 ? '0'+minutes : minutes;
    let clock = document.getElementById("t1").innerHTML = ampm + " " + hours + ':' + minutes;
}, 1000);

$(function() {
  $('.genre-botton').on('click', function(event) {
    event.preventDefault();
    $('.genre-links').slideToggle(500);
  });
});

