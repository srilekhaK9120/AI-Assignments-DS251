(define (problem question_2)
   (:domain second_question)
   (:objects room1 room2 - room
    ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 - ball
    arm1 arm2 - arm
    )
   (:init (is_room room1) (is_room room2)  
            (is_ball ball1) (is_ball ball2) (is_ball ball3) (is_ball ball4) (is_ball ball5) (is_ball ball6) (is_ball ball7) (is_ball ball8) 
            (free_arm arm1) (free_arm arm2)
          (ball_in_room ball1 room1) (ball_in_room ball2 room1) (ball_in_room ball3 room1) (ball_in_room ball4 room1)
          (ball_in_room ball5 room1) (ball_in_room ball6 room1) (ball_in_room ball7 room1) (ball_in_room ball8 room1)
          (robo_in_room room1)
          )
   (:goal (and (ball_in_room ball1 room2) (ball_in_room ball2 room2) (ball_in_room ball3 room2) (ball_in_room ball4 room2)
          (ball_in_room ball5 room2) (ball_in_room ball6 room2) (ball_in_room ball7 room2) (ball_in_room ball8 room2))))
