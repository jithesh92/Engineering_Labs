(defun unio (a b)
	(cond
	((null b) a)
	((is_member (car b) a) (unio a(cdr b)))
	(t (cons (car b) (unio a (cdr b))))))
(defun is_member (a l)
	(cond
	((null l) nil)
	((= a (car l)) t)
	(t (is_member a (cdr l)))))
(defun inter (a b)
	(cond
	((null b) nil)
	((is_member (car b) a) (cons (car b) (inter a(cdr b))))))
(defun diff (a b)
	(cond 
	((null a) nil)
	((null b) a)
	((is_member (car a) b) (diff (cdr a) b))
	(t (cons (car a) (diff (cdr a) b)))))
(defun main()
	(princ "enter set A:")
	(setf a (read))
	(princ "enter set B:")
	(setf b (read))
	(loop
	(format t "~% MENU ~% 1. union ~% 2. intersection ~% 3. membership in A ~% 4. membership in B ~% 5. difference ~% 6. Exit ~%")
	(setf c (read))
	(cond
	((= c 1) (print (unio a b)))
	((= c 2) (print (inter a b)))
	((= c 3) (progn (format t "~%enter element") (setf l (read)) (print (is_member l a))))
	((= c 4) (progn (format t "~%enter element") (setf l (read)) (print (is_member l b))))
	((= c 5) (print (diff a b)))
	((= c 6) (return)))))
(main)
