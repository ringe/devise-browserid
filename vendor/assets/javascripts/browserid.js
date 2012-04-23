/*
* BrowserID API function: https://developer.mozilla.org/en/BrowserID/Quick_Setup
*/
function gotAssertion(assertion) {
  // got an assertion, now send it up to the server for verification
  if (assertion !== null) {
    $.ajax({
      type: 'POST',
      url: '/d/users/sign_in',
      data: { assertion: assertion },
      success: function(res, status, xhr) {
        if (res === null) {}//loggedOut();
        else alert(res);
      },
      error: function(res, status, xhr) {
        console.log("login failure" + res);
      }
    });
  } else {
    //loggedOut();
  }
}

/*
* Our BrowserID login call. If the assertion was found, send this to Devise
* with warden-browserid enabled for verification and login.
*/
function browserIdLogin() {
  navigator.id.get(function(assertion) {
    if (assertion) {
      // This code will be invoked once the user has successfully
      // selected an email address they control to sign in with.
      $.ajax({
        url:"/d/users/sign_in/",
        type: "POST",
        data: {"assertion": assertion},
        cache:false,
        success:function(data,status){
          console.log(data);
//        setTimeout(function(){}, 4000);
//          window.location.href = '/';
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
