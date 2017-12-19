window.fbAsyncInit = function() {
  FB.init({
    appId: '510412632666893',
    cookie: true,
    xfbml: true,
    version: 'v2.11'
  });

  FB.AppEvents.logPageView();
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = 'https://connect.facebook.net/en_US/sdk.js';
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

function login() {
  FB.login(function(response) {
    if (response.status === 'connected') {
      FB.api('/me?fields=name',
        function(response) {
          $.ajax({
            url: "/login",
            type: "POST",
            data: {"user_id": response.id, "name": response.name},
            dataType: "script",
            success: function(data) {
              if (data === 'success') {
                // window.location.replace('http://localhost:3000');
                window.location.reload();
              } else if (data === 'error') {
                document.getElementById('status').innerHTML = data;
              }
            }
          });
        }
      );
    }
  });
}

$('#myLogout').click(function(e) {
  console.log('aaa');
  FB.getLoginStatus(function(response) {
    console.log(response);
    if (response && response.status === 'connected') {
      FB.logout(function(response) {
          document.location.reload();
      });
    }
  });
});