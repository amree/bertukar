$(document).ready(function() {
  window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
      appId      : '331360483631162',                        // App ID from the app dashboard
      channelUrl : '//bertukar.com/channel.html', // Channel file for x-domain comms
      status     : false,                                 // Check Facebook Login status
      xfbml      : true                                  // Look for social plugins on the page
    });

    // Additional initialization code such as adding Event Listeners goes her
    FB.Event.subscribe('comment.create',
      function(response) {
        console.log("Commented " + response);
      }
    );
  };

  // Load the SDK asynchronously
  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
});
