$(function(){
  FB.init({appId: "521700431175814", status: true, cookie: true});
  $('#fb-share').on('click', function(e){
    e.preventDefault();
    var obj = {
      method: 'feed',
      redirect_uri: $(this).attr('data-uri'),
      link: $(this).attr('data-link'),
      name: $(this).attr('data-name'),
      caption: $(this).attr('data-caption'),
      description: $(this).attr('data-description')
    };

    function callback(response) {
      document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
    }

    FB.ui(obj, callback);
  });
});