/-  aver
/+  rudder
::
::  we start by defining some types that the app uses. normally, you
::  would just import these instead.
::
=>  |%
    +$  fealty  fealty:aver
    +$  action  action:aver
    --
::  we cast our door to the desired page type. to construct that type,
::  we give it the type of data that the app passes in, and the type of user
::  actions on that data.
::
::  (note that, due to implementation details, rudder assumes the action type
::   to be a cell type.)
::
::  (this cast can be omitted, but beware that it may result in nest fails
::   at import-time (rather than compile-time), which may not be as legible.)
::
^-  (page:rudder fealty action)
::
|_  $:  ::  the bowl, obviously
        ::
        =bowl:gall
        ::  $order is just a shorthand for [@ta inbound-request:eyre],
        ::  which describes the full http request we're handling.
        ::  in this example, and in most real-world cases, you don't need
        ::  access to this, since most relevant details from the request
        ::  are passed into the gates that this door implements.
        ::  writing * in place of =order:rudder would be fine, and makes it
        ::  obvious that it's not getting used.
        ::  rudder provides it here simply as an escape hatch for edge cases.
        ::
        =order:rudder
        ::  whatever data the app passes in
        ::
        =fealty:aver
    ==
::  (in practice, it tends to be more stylistically sensible to put the
::   +argue and +final arms above the +build one, simply because rendering
::   logic, possibly with css and js code, can get rather large. for the
::   sake of pedagogy though, we write them in the order in which they get
::   called during normal use.)
::
::  +build gets called for every GET request for which routing resolves
::  to this page. it must produce a $reply containing the response.
::
++  build
  |=  $:  ::  these are the url query parameters from the request,
          ::  ie /page?key=value&etc
          ::
          args=(list [k=@t v=@t])
          ::  an optional status message, usually indicating the result
          ::  of processing a POST request.
          ::
          ::  rudder itself only fills this in if there was an "rmsg" key
          ::  among the url query parameters, as results from a %next $reply.
          ::  (if that is the case, it will not be included in :args above.)
          ::  however, it's also common to call +build from within +final,
          ::  especially in the failure case.
          ::
          msg=(unit [gud=? txt=@t])
      ==
  ::  +build must produce a $reply. most commonly, this will be a %page, but
  ::  you might also want %xtra headers, or specify a %full custom payload.
  ::
  ^-  reply:rudder
  ::  when testing +build (or +argue, for that matter), you might consider
  ::  stubbing in some data if the app doesn't yet provide any.
  ::  =.  enemies  ['little timmy' 'chaos' enemies]
  ::
  ::  the code that follows renders a bare-bones html document.
  ::  most of this isn't too important, but take care to notice the various
  ::  ;form elements we create. these will trigger +argue calls for this page.
  ::
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title: %aver
        ;style:"form \{ display: inline-block; } summary \{ cursor: pointer; margin-bottom: 12px; }"

        ;script(src "https://cdn.tailwindcss.com");
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;meta(http-equiv "Content-Type", content "text/html; charset=utf-8");
        ;link(href "https://www.archetype.computer/style.css", rel "stylesheet", type "text/css");
        ;link(type "font", href "https://fonts.googleapis.com/css?family=Space+Grotesk", rel "stylesheet");
        ;link(rel "preconnect", href "https://fonts.googleapis.com");

        ;link(rel "preconnect", href "https://fonts.gstatic.com", crossorigin "");
        ;link(href "https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;500&display=swap", rel "stylesheet");

      ==
      ;body.flex.align-center.py-6(style "animation: none !important")
        ;main.p-4.max-w-3xl.mx-auto.space-y-6
          ;h1.text-2xl: %aver
          ;p
            ; This is a place to post attestations that your star is willing to route for groundwire comets. 
          ==
          ;h3: FAQ
          ;div.flex.flex-col.space-y-2
            ;details(name "faq")
              ;summary: What happens if i post an attestation?

              ; If you post an attestation, the groundwire binary will allow comets mined under your star to be emancipated on groundwire. 
              ; This does not put any meaningful load on your star.
            ==
            ;details(name "faq")
              ;summary: Will posting an attestation break compatibility?

              ; No, this is well within the bounds of how comets work already. Stars already do route for comets, however the default binary
              ; hardcodes five stars (~litzod, ~wanzod, ~marzod, ~dopzod, ~samzod) as the only stars available for routing, as these stars
              ; have historically been high uptime as they are operated by Tlon.
            ==
          ==

          ::  we take care to render the status message, if there is any
          ::
          ;+  ?~  msg  :/""
              ?:  gud.u.msg
                ;div#status.p-2.bg-green-300:"{(trip txt.u.msg)}"
              ;div#status.p-2.bg-red-300:"{(trip txt.u.msg)}"
          ;hr.border(style "border-color: #8c5d5d5c;"): 
          ;h3: Attesting Stars
          ::  render a list of enemies, using the data the door was given
          ::
          ;ul
            ;*  %-  head
                %^  spin  ~(tap in ~(key by fealty))  0
                |=  [=ship i=@ud]
                [(render-ship i ship) +(i)]
          ==
          ;hr.border(style "border-color: #8c5d5d5c;"): 
          ::  and an input field for adding a new enemy
          ::
          ;*
          ?:  &(| =(our.bowl source:aver))
            ;=  ;h3: To attest, please
                ;code.p-2.font-mono.bg-gray-300.flex(style "background: linear-gradient(270deg, rgb(166 142 142 / 20%) 37%, rgb(158 170 184 / 20%) 81%)")
                  ; |install ~dister-dister-hastuc-dibtux %aver
                ==
            ==
::        ?:  (~(has by fealty) our.bowl)
::          ~
          :_  ~
          ;form(method "post")
            ;button.p-2.bg-blue-300.rounded(type "submit", name "sign")
              Sign attestation as {(scow %p ~hastuc)}
            ==
          ==
        ==
      ==
    ==
  ::
  ++  render-ship
    |=  [i=@ud =ship]
    =/  =oath:aver  (~(got by fealty) ship)
    ;li.flex-col
      ;details
        ;summary.flex.space-x-2
          ;p: {(scow %p ship)}
          ;p: {(scow %da wen.oath)}
        ==
        ;code.break-words.text-wrap
           ; {(scow %ux sig.oath)}
        ==
      ==
    ==
  --
::  +argue gets called for every POST request made to this page.
::  it must attempt to derive a user action from the request.
::
++  argue
  ::  it gets passed the full header-list and body. some use cases, such as
  ::  file uploading, might require both for retrieving the submitted data.
  ::  in our example case, we only need the simple form data from the body.
  ::
  |=  [headers=header-list:http body=(unit octs)]
  ::  +argue may not always succeed in deducing a valid user action from
  ::  the request. the input could be bogus, or the user might provide
  ::  illegal values of some kind. in that case, instead of producing
  ::  the user action, +argue may produce a $brief, which is simply
  ::  a ?(~ @t), containing an optional error message.
  ::
  ^-  $@(brief:rudder action)
  ::  retrieving arguments from the body, in the simple form data case,
  ::  is made trivial by +frisk.
  ::
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ::  for valid requests, we produce the appropriate action.
  ::
  ?:  (~(has by args) 'sign')
    ?:  (~(has by fealty) our.bowl)
      'already signed'
    [%sign ~]
  ?:  (~(has by args) 'unsign')
    ?.  (~(has by fealty) our.bowl)
      'never signed'
    [%unsign ~]
  ~
::  +final gets called after a POST request has been processed.
::  it must produce a $reply containing the response.
::
::  (note that the below implementation of +final is equivalent to:
::
::     ++  final  (alert:rudder 'page-example' build)
::
::   if you want the same behavior, you are encouraged to use that helper
::   function. the expanded implementation is provided purely for
::   pedagogical reasons.)
::
++  final
  ::  a success flag and a brief get passed in. if +argue failed to produce
  ::  a user action, or +solve failed to process the action, the :success
  ::  flag will be set to %.n, and the :brief will always contain a cord.
  ::
  ::  (in case +argue or +solve did not produce a message, rudder will add
  ::   a generic one.)
  ::
  ::  if both +argue and +solve calls succeeded, the :success flag will be
  ::  set to %.y. the :brief may or may not contain a status message.
  ::
  |=  [success=? =brief:rudder]
  ::  +final must produce a $reply. most commonly, this will be the same
  ::  $reply produced by +build, but with a success or error message included.
  ::
  ^-  reply:rudder
  ::  indeed, in the error case here, we simply re-render the page using
  ::  +build.
  ::
  ?.  success  (build ~ `[| `@t`brief])
  ::  in the success case, it is often good ux to issue a 308 redirect,
  ::  telling the browser to re-navigate using a GET request. this prevents
  ::  a page reload from triggering the same POST request again.
  ::  a %next $reply does this for us, putting the specified cord into the
  ::  location header, and including the :brief (if any) in the url query
  ::  parameters.
  ::
  [%next '' brief]
--
