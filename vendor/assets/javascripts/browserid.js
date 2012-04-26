/*
* Our BrowserID login call. If the assertion was found, send this to Devise
* with warden-browserid enabled for verification and login.
*/
function browserIdLogin(sign_in_path) {
  navigator.id.get(function(assertion) {
    if (assertion) {
      // This code will be invoked once the user has successfully
      // selected an email address they control to sign in with.
      $.ajax({
        url: sign_in_path,
        type: "POST",
        data: {"assertion": assertion},
        dataTYpe: "json",
        cache:false,
        success:function(data,status){
          console.log(data);
          window.location.href = '/';
        },
        error:function(data,status){
          alert(data.statusText + ": " + data.responseText);
        }
      })
    } else {
      // something went wrong!  the user isn't logged in.
      alert("Could not log you in!");
    }
  });
}
