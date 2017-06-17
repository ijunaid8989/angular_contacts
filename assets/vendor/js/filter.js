console.log("here");
// $('#seach-camera').on( "keyup", function(e) {
//     e.preventDefault();
//     var id = $(this).val();
//     console.log(id);
//     $("div.card").each(function(){
//         $(this).hide();
//         if($(this).attr('id') == id) {
//             $(this).show();
//         }
//     });
// });

var filterImages, onImageSearch;

filterImages = function(tageValue) {
  var regex;
  regex = new RegExp('\\b\\w*' + tageValue + '\\w*\\b');
  console.log(regex);
  $('div.card').hide().filter(function() {
    return regex.test($(this).attr('id'));
  }).show();
};

$('#seach-camera').keyup(function() {
  var selectTag;
  selectTag = $(this).val();
  filterImages(selectTag);
});