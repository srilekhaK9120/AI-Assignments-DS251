(define (domain second_question)

    (:requirements
        :strips
        :equality
    )

    (:types room ball arm)

    (:constants room1 room2 - room)

    (:predicates
        (is_room ?r - room)
        (is_ball ?b - ball)
        (ball_in_room ?b - ball ?r - room)
        (free_arm ?a - arm)
        (robo_in_room ?r - room)
        (carrying_one ?b1 - ball)
        (carrying_two ?b1 ?b2 - ball)
    )

    (:action move_to_room
        :parameters (?r1 ?r2 - room)
        :precondition (robo_in_room ?r1)
        :effect (and (not (robo_in_room ?r1)) (robo_in_room ?r2))
    )

    ; ----- IF ROBOT CAN USE BOTH ARMS AT A TIME -----

    (:action pick_first
        :parameters (?b - ball ?a - arm ?r - room)
        :precondition (and (is_ball ?b) (is_room ?r) (robo_in_room ?r) (free_arm ?a) (ball_in_room ?b ?r) (= ?r room1))
        :effect (and (not (free_arm ?a)) (carrying_one ?b) )
    )

    (:action pick_second
        :parameters (?b1 ?b2 - ball ?a -arm ?r - room)
        :precondition (and 
            (is_ball ?b1) (is_room ?r) (robo_in_room ?r) (free_arm ?a) (ball_in_room ?b1 ?r) (carrying_one ?b2) (= ?r room1)
        )
        :effect (and 
            (not (free_arm ?a)) (not (carrying_one ?b2)) (carrying_two ?b1 ?b2) 
        )
    )

    (:action drop
        :parameters (?b1 ?b2 - ball ?a1 ?a2 -arm ?r1 ?r2 - room)
        :precondition (and 
            (is_ball ?b1) (is_ball ?b2) (is_room ?r2) (carrying_two ?b1 ?b2)
            (ball_in_room ?b1 ?r1) (ball_in_room ?b1 ?r1) (robo_in_room ?r2)
            (= ?r2 room2)
        )
        :effect (and 
            (free_arm ?a1) (free_arm ?a2) (not (carrying_two ?b1 ?b2)) (ball_in_room ?b1 ?r2) (ball_in_room ?b2 ?r2)
            (not (ball_in_room ?b1 ?r1)) (not (ball_in_room ?b2 ?r1))
        )
    )
    
    ; ----- IF ROBOT CAN USE ONLY 1 ARM AT A TIME -----
    ; (:action pick
    ;     :parameters (?b1 - ball ?a1  - arm ?r - room)
    ;     :precondition (and (is_ball ?b1) (robo_in_room ?r) (free_arm ?a1)  (is_room ?r) (ball_in_room ?b1 ?r) (= ?r room1))
    ;     :effect (and (not (free_arm ?a1)) (carrying_one ?b1))
    ; )

    ; (:action drop
    ;     :parameters (?b - ball ?a - arm ?r - room)
    ;     :precondition (and (is_ball ?b) (is_room ?r) (= ?r room2) (not (free_arm ?a)) (carrying_one ?b) (robo_in_room ?r))
    ;     :effect (and (free_arm ?a) (not (carrying_one ?b)) (ball_in_room ?b ?r) (not (ball_in_room ?b room1)))
    ; )   

)