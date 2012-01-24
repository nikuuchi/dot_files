;; pymacs
;(when emacs23-p
 ; (defun python-partial-symbol ()
 ;   "Return the partial symbol before point (for completion)."
 ;   (let ((end (point))
 ;         (start (save-excursion
;                   (and (re-search-backward
;;                         (rx (or buffer-start (regexp "[^[:alnum:]._]"))
;                             (group (1+ (regexp "[[:alnum:]._]"))) point)
;                         nil t)
;                        (match-beginning 1)))))
;      (if start (buffer-substring-no-properties start end))))
;  )
;
;(;defun ac-python-candidates ()
;  (python-find-imports)
;  (car (read-from-string
;        (python-send-receive
;         (format "emacs.complete(%S,%s)"
;                 (python-partial-symbol)
;                 python-imports)))))
;
;(ac-define-source python
;  '((candidates . ac-python-candidates)
;    (prefix . (unless
;                  (save-excursion
;                    (re-search-backward "^import"
;                                        (save-excursion
;                                          (re-search-backward "^")) t))
;                (let ((symbol
;                       (python-partial-symbol)
;                       ))
;                  (if symbol
;                      (save-excursion (search-backward symbol))))))
;    (symbol . "py-f")))
;
;(add-hook
; 'python-mode-hook
; '(lambda ()
;    (add-to-list 'ac-sources 'ac-source-python)
;    ))
