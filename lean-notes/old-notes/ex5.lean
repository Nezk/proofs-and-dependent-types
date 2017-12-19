constants m n : ℕ
constant b : bool

#print "Reducing pairs"

#reduce (m, n).1
#reduce (m, n).2

#print "Reducing boolean expressions"
#reduce tt && ff
#reduce ff && b
#reduce b && ff

#print "Reducing arithmetic expressions"
#reduce n + 0
#reduce n + 2
#reduce 2 + 3

#eval 12345 * 12345
