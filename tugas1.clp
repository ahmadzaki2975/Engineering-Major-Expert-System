; ? Engineering Major Expert System
; ? Made by Ahmad Zaki Akmal 
; ? 21/480179/TK/52981

(
  deftemplate data
      ;? other utils
      (slot done-greeting)
      (multislot recommendations)
)

; ? clusters
; (slot likes-power)
; (slot likes-manufacture)
; (slot likes-infrastructure)

; ? subclusters
  ; ? power
  ; (slot likes-physics)
  ; (slot likes-chemicals)
  ; (slot likes-electronics)
  ; (slot likes-geology)

  ; ? manufacture
  ; (slot likes-industry)
  ; (slot likes-programming)
  ; (slot likes-biology)
  ; (slot likes-mechanics)

  ; ? infrastructure
  ; (slot likes-buildings)
  ; (slot likes-enviroment)
  ; (slot likes-design)
  ; (slot likes-geography)

; ? Greeting
(
  defrule greet
  =>
  (printout t "Hello, I'm the Engineering Major Expert System. Made by Ahmad Zaki Akmal." crlf)
  (printout t "I will ask you a few questions and then give you recommendations on engineering majors based on your answers." crlf crlf)
  (assert (data (done-greeting yes)))
)

; ? Questions
(
  defrule ask-cluster
  (data (done-greeting yes))
  => 
  ; give users 3 options, 1= power, 2= manufacture, 3= infrastructure
  (printout t "What do you like most?" crlf)
  (printout t "1. Power & Energy" crlf)
  (printout t "2. Manufacture" crlf)
  (printout t "3. Infrastructure" crlf)
  (bind ?input (read))
  ; if 1, then assert likes-power to yes, others no and vice versa
  (if (eq ?input 1)
    then
    (assert (likes-power yes) (likes-manufacture no) (likes-infrastructure no))
    else
      (if (eq ?input 2)
        then
        (assert (likes-power no) (likes-manufacture yes) (likes-infrastructure no))
        else
        (assert (likes-power no) (likes-manufacture no) (likes-infrastructure yes))))
)

; ! Power
(
  defrule ask-physics
  (likes-power yes)
  =>
  (printout t "Do you like physics? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-physics yes))
    else
    (assert (likes-physics no)))
)

(
  defrule ask-chemicals
  (likes-power yes) (likes-physics no)
  =>
  (printout t "Do you like chemistry? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-chemicals yes))
    else
    (assert (likes-chemicals no)))
)

(
  defrule ask-electronics
  (likes-physics yes)
  =>
  (printout t "Do you like electronics? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-electronics yes))
    else
    (assert (likes-electronics no)))
)

(
  defrule ask-geology
  (likes-chemicals yes)
  =>
  (printout t "Do you like geology? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-geology yes))
    else
    (assert (likes-geology no)))
)

; ! Manufacture
(
  defrule ask-industry
  (likes-manufacture yes)
  => 
  (printout t "Do you like industry? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-industry yes))
    else
    (assert (likes-industry no)))
)

(
  defrule ask-programming
  (likes-industry no)
  =>
  (printout t "Do you like programming? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-programming yes))
    else
    (assert (likes-programming no)))
)

(
  defrule ask-biology
  (likes-programming yes)
  =>
  (printout t "Do you like biology? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-biology yes))
    else
    (assert (likes-biology no)))
)

(
  defrule ask-mechanics
  (likes-industry yes)
  =>
  (printout t "Do you like mechanics? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-mechanics yes))
    else
    (assert (likes-mechanics no)))
)

; ! Infrastructure
(
  defrule ask-buildings
  (likes-infrastructure yes)
  =>
  (printout t "Do you like buildings? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-buildings yes))
    else
    (assert (likes-buildings no)))
)

(
  defrule ask-enviroment
  (likes-buildings no)
  =>
  (printout t "Do you like enviroment? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-enviroment yes))
    else
    (assert (likes-enviroment no)))
)

(
  defrule ask-design
  (likes-buildings yes)
  =>
  (printout t "Do you like designing? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-design yes))
    else
    (assert (likes-design no)))
)

(
  defrule ask-geography
  (likes-enviroment yes)
  =>
  (printout t "Do you like geography? (yes/no)" crlf)
  (bind ?input (read))
  (if (eq ?input yes)
    then
    (assert (likes-geography yes))
    else
    (assert (likes-geography no)))
)

; ? Recommendations
(
  defrule electrical
  (likes-electronics yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Electrical Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule !electrical
  (likes-electronics no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Physics or Nuclear Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule geology
  (likes-geology yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Geology Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule chemistry
  (likes-geology no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Chemistry Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule mechanical
  (likes-mechanics yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Mechanical Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule !mechanical
  (likes-mechanics no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Industry Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule biomedical
  (likes-biology yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Biomedical Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule !biomedical
  (likes-biology no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Information Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule architecture
  (likes-design yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Architecture Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule !architecture
  (likes-design no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Civil Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule geography
  (likes-geography yes)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Geodetic Engineering." crlf)
  (printout t "=============================================" crlf)
)

(
  defrule !geography
  (likes-geography no)
  =>
  (printout t "=============================================" crlf)
  (printout t "You should consider Enviroment Engineering." crlf)
  (printout t "=============================================" crlf)
)




