(defun textobject--interactive-args ()
  (list (read-string "Delimiters (\"\"): " nil nil "\"\"")))

(defun textobject--mark (s inner)
  (unless (= (length s) 2)
    (error "Delimiters string length must be equal to 2 (e.g. {})"))
  (push-mark-command nil)
  (let* ((p (point))
         (opening (subseq s 0 1))
         (closing (subseq s 1))
         (forward-count (if (and (not inner) (string= opening closing)) 2 1))
         (deactivate-mark t))
    (condition-case nil
        (progn
          (search-backward opening)
          (when inner
            (forward-char))
          (set-mark-command nil)
          (search-forward closing nil nil forward-count)
          (when inner
            (backward-char)))
      (error
       (pop-mark)
       (goto-char p)
       (message "Delimeter not found")))))

(defun textobject-mark-outer (s)
  (interactive (textobject--interactive-args))
  "Mark text object and it's delimiters"
  (textobject--mark s nil))

(defun textobject-mark-inner (s)
  (interactive (textobject--interactive-args))
  "Mark text object but not it's delimiter"
  (textobject--mark s t))

(provide 'emacs-textobjects)
