#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Hotstring *

::aadress::Ehrensvärdsgatan 10 lgh 1101

::ccell::0703635667

::ffar::farligmidsommar

::iaf::i alla fall
::icell::{+}46703635667
::isf::i så fall

::bbr::
(
Best regards,

)

::mmvh::
(
Med vänliga hälsningar,
Anton Tetov
)

::nname::Anton Tetov Johansson
::nnvm::nevermind

::oort::212 13 Malmö

::ppnr::199107064314

::rrev::reversibel

::lmail::anton.johansson@arkitektur.lth.se
::mmail::anton@tetov.xyz
::smail::a@tetov.se
::sso::sonya.mamurin@gmail.com

::....::…

::uurl::https://tetov.xyz/

::]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, yyyy-MM-dd HH:mm
SendInput %CurrentDateTime%
return
