(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
	  (lambda ()
	    (scala-electric-mode)))



(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
