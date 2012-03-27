import qualified Data.Map as M

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Actions.WindowGo
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
--import XMonad.Util.Run
import System.IO

tall = ResizableTall 1 (3/100) (1/2) []
layout = smartBorders $ mkToggle1 FULL $ gaps [(U,18)] $ tall ||| Mirror tall
works = map show [1..9]
modm = mod3Mask

myLogHook dest = dynamicLogWithPP defaultPP { ppOutput = hPutStrLn dest
                                              , ppVisible = wrap "(" ")"
                                            }

main = do
  spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --width 10 --transparent true --tint 0x000000 --height 12"
  xmproc <- spawnPipe "xmobar $HOME/.xmobarrc"
  xmonad $ defaultConfig
             { borderWidth = 2
             , terminal = "gnome-terminal"
             , normalBorderColor = "#99ccff"
             , focusedBorderColor = "#0033dd"
             , layoutHook = layout
             , manageHook = manageDocks <+> composeAll
                            [ className =? "MPlayer" --> doFloat,
                              className =? "Gimp"    --> doFloat,
                              className =? "stalonetray" --> doIgnore,	
                              className =? "Skype" --> doFloat,
                              title     =? "Speedbar" --> doFloat,
                              title     =? "Adobe Reader" --> doFloat]
             , logHook = myLogHook xmproc
             , workspaces = works
             , modMask = modm }
       `additionalKeys`
       [ ((modm, xK_f), sendMessage (Toggle FULL))
       , ((modm, xK_g), sendMessage ToggleGaps)
       , ((modm, xK_j), sendMessage MirrorShrink)
       , ((modm, xK_k), sendMessage MirrorExpand)
       , ((modm, xK_period), windows W.focusDown)
       , ((modm, xK_comma), windows W.focusUp)
       , ((modm .|. shiftMask, xK_period), windows W.swapDown)
       , ((modm .|. shiftMask, xK_comma), windows W.swapUp)
       , ((modm, xK_w), nextScreen) ]
       `additionalKeys`
       [ ((modm .|. m, k), windows $ f i)
         | (i, k) <- zip works
                     [ xK_exclam, xK_at, xK_numbersign
                     , xK_dollar, xK_percent, xK_asciicircum
                     , xK_ampersand, xK_asterisk, xK_parenleft
                     , xK_parenright
                     ]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]
       `additionalKeys`
       [ ((modm, xK_a), runOrRaise "emacs" (className =? "Emacs"))
       , ((modm, xK_s), runOrRaise "gnome-terminal" (className =? "Gnome-terminal"))
       , ((modm, xK_d), runOrRaise "google-chrome" (className =? "Google-Chrome"))
       ]
