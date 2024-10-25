(rx-define kw-name (kw)
  (seq
  bol (zero-or-more space)
       "("
       (group kw)
       (one-or-more space)
       (group (one-or-more (or word (syntax symbol))))))

(rx-define symbol
  (seq (or bol (one-or-more space))
       (group ":" (one-or-more (or word (syntax symbol))))))

(defconst lithp:kw-0
  (eval-when-compile
    `(
      (,(rx (kw-name "def")) (1 font-lock-keyword-face) (2 font-lock-function-name-face))
      (,(rx (kw-name "set")) (1 font-lock-keyword-face) (2 font-lock-variable-name-face))
      (,(rx symbol) 1 font-lock-string-face))))

(defun lithp-mode-variables ()
  (setq font-lock-defaults '((lithp:kw-0))))

(define-derived-mode lithp-mode lisp-data-mode "Lithp"
  "Major mode for editing Lithp code."
  (lithp-mode-variables))
