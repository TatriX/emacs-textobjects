(defun my-text-object-mark (s)
  (interactive (list (read-string "MDelimiters (\"\"): " nil nil "\"\"")))
  "Mark text object by char"
  (unless (= (length s) 2)
    (error "Delimiters string length must be equal to 2"))
  (push-mark-command nil)
  (let ((p (point))
        (opening (subseq s 0 1))
        (closing (subseq s 1))
        (deactivate-mark t))
    (condition-case nil
        (progn
          (search-backward opening)
          (set-mark-command nil)
          (search-forward closing nil nil 1))
      (error
       (pop-mark)
       (goto-char p)
       (message "Delimeter not found")))))
