(define (problem question_3)
   (:domain third_question)
   (:objects
        airplane - airplanes
        truck - trucks
        london_airport paris_airport - airports
        north south - locations
        london paris - cities
        pack1 pack2 - packages
    )
   (:init 
        (obj_at airplane london_airport)
        (obj_at pack1 london_airport)
        (obj_at pack2 london_airport)
        (obj_at truck paris_airport)
        (location_in_city london_airport london)
        (location_in_city paris_airport paris)
        (location_in_city north paris)
        (location_in_city south paris)
          )

   (:goal (and (obj_at pack1 north) (obj_at pack2 south)))

)
