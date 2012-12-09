import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.FixedColumn
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import qualified Data.Map as M
import XMonad.Layout.IndependentScreens
import XMonad.Hooks.ManageDocks

myLayoutHook = Tall 1 0.1 0.5 ||| noBorders Full

myLogHook = dynamicLogWithPP $ defaultPP { ppHiddenNoWindows = (\wsId -> "fo")
                                         , ppSep = "abc"
                                         }

myStatusCmd = "xmobar"

wsName wsId
        | wsId == "1"   = "web"
        | wsId == "2"   = "gvim+term"
        | wsId == "3"   = "status"
        | wsId == "4"   = "music"
        | wsId == "5"   = "torrents"
        | otherwise     = wsId

displayWs wsId
        | wsName wsId == wsId   = wsId
        | otherwise             = concat [wsId, ":", wsName wsId]

myPP h s = xmobarPP
        { ppTitle       = xmobarColor "#f88" "" . id
        , ppCurrent     = xmobarColor "#ffa" "" . wrap "[" "]" . wsName
        , ppVisible     = xmobarColor "#dd8" "" . wrap "(" ")" . wsName
        , ppHidden      = displayWs
        , ppOutput      = hPutStrLn h
        }

myStatusBarKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myKeys conf@(XConfig { XMonad.modMask = modm }) = M.fromList $
        [ ((modm, xK_b), sendMessage ToggleStruts)
        ]

main = do
        nScreens <- countScreens
        hs       <- mapM (spawnPipe . xmobarCommand) [0 .. nScreens-1]
        xmonad $ defaultConfig
                { logHook = mapM_ dynamicLogWithPP $
                        zipWith myPP hs [0..nScreens]
                , modMask = mod4Mask
                , keys = myKeys <+> keys defaultConfig
                , manageHook = manageHook defaultConfig <+> manageDocks
                , layoutHook = avoidStruts myLayoutHook
                }

xmobarCommand (S s) = unwords ["xmobar", "-x", show s]
pp h s = defaultPP { ppOutput = hPutStrLn h }

-- vim:ts=8:sw=8:et
