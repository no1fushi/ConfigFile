(tool-bar-mode 0)
(menu-bar-mode -1)
(setq c-auto-newline t) 
(setq c-tab-always-indent t)
(setq inhibit-startup-message t)

(global-set-key "\C-h" 'delete-backward-char)
(setq auto-save-default nil)
(setq make-backup-files nil)
(show-paren-mode t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)


;;gauche
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "/usr/bin/gosh -i")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run Gauche on other window"
	  (interactive)
		  (split-window-horizontally (/ (frame-width) 2))
			  (let ((buf-name (buffer-name (current-buffer))))
				    (scheme-mode)
						    (switch-to-buffer-other-window
								     (get-buffer-create "*scheme*"))
								    (run-scheme scheme-program-name)
										    (switch-to-buffer-other-window
												     (get-buffer-create buf-name))))

(define-key global-map
  "\C-cG" 'scheme-other-window)

