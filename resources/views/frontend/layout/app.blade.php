<!DOCTYPE html>
<html dir="ltr" lang="en-US">
    {{-- head link --}}
    @include('frontend.layout.head')
    <body class="boxed">

            <!-- Messenger Chat plugin Code -->
    <div id="fb-root"></div>

    <!-- Your Chat plugin code -->
    <div id="fb-customer-chat" class="fb-customerchat">
    </div>

    <script>
      var chatbox = document.getElementById('fb-customer-chat');
      chatbox.setAttribute("page_id", "102262639020777");
      chatbox.setAttribute("attribution", "biz_inbox");
    </script>

    <!-- Your SDK code -->
    <script>
      window.fbAsyncInit = function() {
        FB.init({
          xfbml            : true,
          version          : 'v12.0'
        });
      };

      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>

        {{-- menu section --}}
        @include('frontend.layout.header')
        {{-- body section --}}
        <div id="app">
            <main class="py-4">
                @section('body')
                @show
            </main>
        </div>
        {{-- footer section --}}
        @include('frontend.layout.footer')
        <!-- Go To Top
        ============================================= -->
        <div id="gotoTop"><i class="fa fa-angle-up"></i></div>

        {{-- script link --}}
        @include('frontend.layout.script')


        {{-- <script>
            var chatbox = document.getElementById('fb-customer-chat');
            chatbox.setAttribute("page_id", "209750637729273");
            chatbox.setAttribute("attribution", "biz_inbox");

            window.fbAsyncInit = function() {
                FB.init({
                xfbml            : true,
                version          : 'v11.0'
                });
            };

            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
    </script> --}}



            {{-- <div class="fb-customerchat"
                page_id="<ENTER-YOUR-FACEBOOK-ID-HERE>"
                theme_color="#459645"
                logged_in_greeting="Hi! How can we help you?"
                logged_out_greeting="GoodBye!... Hope to see you soon."
                minimized="false">
            </div> --}}

    </body>
</html>

