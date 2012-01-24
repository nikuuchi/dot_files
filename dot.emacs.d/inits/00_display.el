;;;others

;;color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

;;Color(透過)
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 80)
   ))

;;linum
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")
;;gtkの時、スクロールバーを右にする
(custom-set-variables
 '(scroll-bar-mode (quote right)))

; *.~ というバックアップファイルを作らない
(setq make-backup-files nil)

; タブの代わりにスペースを使う
(setq indent-tabs-mode nil)

; 起動時の画面はいらない
(setq inhibit-startup-message t)

; 時刻表示
(display-time)

;括弧
(show-paren-mode 1)


;;GUI関連
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; I delete :backgroud "black"
 '(default ((t (:stipple nil  :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Ricty"))))
 '(border ((t (:width condensed))))
 '(vertical-border ((nil (:weight bold :width condensed)))))

;; fullscreen in GUI
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen) 
