;;;-------------------------------------------------------------------------
;キー割り当て
(define-key global-map "\C-x\C-f" 'anything-find-files)
(define-key global-map "\C-x\C-d" 'anything-for-files)
(define-key global-map "\M-s"     'anything-buffers+)

;; C-k で改行を含め削除
(setq kill-whole-line t)

; "M-k" でカレントバッファを閉じる。初期値は kill-sentence
(define-key global-map (kbd "M-k") 'kill-this-buffer)

; "C-t" でウィンドウを切り替える。初期値は transpose-chars
(define-key global-map (kbd "C-t") 'other-window)

; "C-q"で行番号を指定
(define-key global-map "\C-q" 'goto-line)

