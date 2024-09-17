/-  aver
/+  default-agent, dbug, rudder, verb
/~  pages  (page:rudder fealty:aver action:aver)  /app/aver
|%
+$  card  card:agent:gall
+$  state-0
  [%0 =fealty:aver =sync:aver]
--
%-  agent:dbug
%+  verb  |
^-  agent:gall
=|  state-0
=*  state  -
=<
  |_  =bowl:gall
  +*  this  .
      def   ~(. (default-agent this %.n) bowl)
      run   ~(. +> [bowl ~])
  ++  on-init
    ^-  (quip card _this)
    =.  sync  ?:(is-source:run [%host 1] [%load ~])
    :_  this
    =/  bind=(list @t)  ?:(is-source:run ~ ~['aver'])
    :-  [%pass /eyre %arvo %e %connect [~ bind] dap.bowl]
    ?:  is-source:run  ~
    :~  do-watch-latest:run
    ==
  ++  on-save   !>(state)
  ++  on-load
    |=  vax=vase
    ^-  (quip card _this)
    =+  !<(old=state-0 vax)
    `this(state old)
  ++  on-poke
    |=  [=mark =vase]
    ^-  (quip card _this)
    =^  cards  state
      ?+  mark  ~|(mark/mark !!)
         %handle-http-request  abet:(on-http-request:run !<(order:rudder vase))
         %aver-diff  abet:(on-diff:run !<(diff:aver vase))
      ==
    [cards this]
  ++  on-watch  
    |=  =path
    ^-  (quip card _this)
    ?:  =(/latest path)
      ?>  ?=(%host -.sync)
      :_  this
      [%give %fact ~ atom/!>(case.sync)]^~
    ?.  ?=([%http-response *] path)
      (on-watch:def path)
    `this
  ++  on-leave  on-leave:def
  ++  on-peek   on-peek:def
  ++  on-agent  
    |=  [=wire =sign:agent:gall]
    ^-  (quip card _this)
    =^  cards  state
      ?+  wire  ~|(wire/wire !!)
        [%latest ~]  abet:(take-latest:run sign)
      ==
    [cards this]
  ::
  ++  on-arvo   
    |=  [=wire syn=sign-arvo]
    ?.  =(/eyre wire)
      (on-arvo:def wire syn)
    `this

  ++  on-fail   on-fail:def
  --
|_  [=bowl:gall cards=(list card)]
++  abet  [(flop cards) state]
++  abet-rud  [(flop cards) fealty]
++  run   .
++  emit  |=(c=card run(cards [c cards]))
++  emil  |=(cs=(list card) run(cards (welp (flop cs) cards)))
++  is-source  =(our.bowl source:aver)
++  do-watch-latest
  ^-  card
  ?<  =(our.bowl source:aver)
  [%pass /latest %agent [source:aver dap.bowl] %watch /latest]
++  do-fetch
  |=  cas=@ud
  ^-  card
  ?<  =(our.bowl source:aver)
  [%pass /fetch/(scot %ud cas) %keen %.n source:aver /g/x/(scot %ud cas)/[dap.bowl]//1/fealty]
++  do-grow
  |=  cas=@ud
  ^-  card
  [%pass /grow %grow /fealty aver-fealty/fealty]
++  do-latest-fact
  |=  cas=@ud
  ^-  card
  [%give %fact ~[/latest] atom/!>(cas)]
::
++  do-diff
  |=  =diff:aver
  [%pass /diff %agent [source:aver dap.bowl] %poke aver-diff/!>(diff)]
::
++  get-life
  |=  =ship
  .^(@ud %j /(scot %p our.bowl)/life/(scot %da now.bowl)/(scot %p ship))
::
++  get-our-keys
  =/  life  (get-life our.bowl)
  .^(ring %j /(scot %p our.bowl)/vein/(scot %da now.bowl)/(scot %ud life))
++  tell-update
  ^+  run
  ?>  ?=(%host -.sync)
  =.  case.sync  +(case.sync)
  (emit:(emit (do-grow case.sync)) (do-latest-fact case.sync))
::
++  on-http-request
  |=  =order:rudder
  ^+  run
  :: ?>  =(our.bowl src.bowl)
  =;  r=(each _run tang) 
    ?:  ?=(%& -.r)
      p.r
    %-  (slog leaf/"error on req" p.r)
    run
  %-  mule  |.
  =;  out=(quip card:agent:gall fealty:aver)
    =.  fealty  +.out
    (emil -.out)
  %.  [bowl order fealty]
  %:  (steer:rudder fealty:aver action:aver)
      pages
      ?.  is-source    
        (point:rudder ~['aver'] & ~(key by pages))
      |=  =trail:rudder
      ^-  (unit place:rudder)
      `[%page | %index]
    ::
      (fours:rudder fealty)
      |=  act=action:aver
      ^-  $@  brief:rudder
          [brief:rudder (list card) fealty:aver]
      ?-  -.act
        %sign  ['signed!' abet-rud:on-sign]
        %unsign  ['revoked' abet-rud:on-unsign]
      ==
  ==
++  support-msg  [her=our.bowl wen=now.bowl txt='This star supports the groundwire proposal and is willing to route for groundwire comets']
++  get-her-keys
  |=  her=@p 
  ^-  (unit pass)
  =+  .^(lyf=(unit life) %j /(scot %p our.bowl)/lyfe/(scot %da now.bowl)/(scot %p her))
  ?~  lyf  ~
  =-  `pass
  .^([@ud =pass *] %j /(scot %p our.bowl)/deed/(scot %da now.bowl)/(scot %p her)/(scot %ud u.lyf))
++  check-oath
  |=  [=ship =oath:aver]
  ?~  pas=(get-her-keys ship)
    ~|  alien-swear/ship
    !!
  =/  =acru:ames  (com:nu:crub:crypto u.pas)
  =/  res=(unit @ux)  (sure:as:acru sig.oath)
  ?~  res
    ~|(failed-verify/ship !!)
  =+  ;;(f=[her=@p wen=@da msg=@t] (cue u.res))
  ?&  =(her.f ship)
      =(f +.oath)
  ==
++  on-diff
  |=   =diff:aver
  ^+  run
  ?>  =(our.bowl source:aver)
  ?+    -.diff  ~|(%on-diff !!)
      %swear
    ?>  (check-oath [ship oath]:diff)
    ?>  =(ship.diff src.bowl)
    =.  fealty  (~(put by fealty) ship.diff oath.diff)
    tell-update
  ::
  ==
++  on-sign
  ^+  run
  ~&  'attempt sign'
  =/  =faith:aver  support-msg
  =/  =acru:ames  (nol:nu:crub:crypto get-our-keys)
  =/  sign=@   (sign:as:acru (jam faith))
  ?~  ver=(sure:as:acru sign)
    ~&  %failed-sig
    run
  =+  ;;(f=faith:aver (cue u.ver))
  =.  fealty  (~(put by fealty) our.bowl [sign f])
  (emit (do-diff %swear our.bowl [sign faith]))
++  on-unsign
  ^+  run
  =.  fealty  (~(del by fealty) our.bowl)
  run
++  take-fetch
  |=  syn=sign-arvo
  ^+  run
  ?>  ?=([%ames %tune *] syn)
  ?>  ?=(%want -.sync)
  ?~  roar.syn
    (emit (do-fetch case.sync))
  ?~  q.dat.u.roar.syn
    ~&  weird-delete/case.sync
    run
  ?.  =(%aver-fealty p.u.q.dat.u.roar.syn)
    ~&  weird-mark/p.u.q.dat.u.roar.syn
    run
  =+  ;;(f=fealty:aver q.u.q.dat.u.roar.syn)
  run(fealty f)
::
++  take-latest
  |=  =sign:agent:gall
  ^+  run
  ?+    -.sign  ~|(take-latest/-.sign !!)
      %watch-ack
    %.  run
    ?~  p.sign  same
    (slog leaf/"failed to sync from source" u.p.sign)
  ::
      %kick
    (emit do-watch-latest)
  ::
      %fact
    ?.  =(p.cage.sign %atom)  ~&  weird-mark/p.cage.sign  run
    =+  !<(case=@ud q.cage.sign)
    =.  sync  [%want =(sync load/~) case]
    (emit (do-fetch case))
  ==
--
