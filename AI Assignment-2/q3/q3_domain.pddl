(define (domain third_question)

    (:requirements
        :strips
        :equality
    )

    (:types 
        places cities physical_objects - objects
        packages vehicles - physical_objects
        trucks airplanes - vehicles
        airports locations - places
    )

    (:predicates
        (location_in_city ?p - places ?c - cities)
        (obj_at ?o - physical_objects ?p - places)
        (contains ?p - packages ?v - vehicles)
    )

    (:action truck_load
        :parameters (?p - packages ?t - trucks ?l - places)
        :precondition (and (obj_at ?t ?l) (obj_at ?p ?l))
        :effect (and (not (obj_at ?p ?l)) (contains ?p ?t))
    )

    (:action truck_unload
        :parameters (?p - packages ?t - trucks ?l - places)
        :precondition (and (obj_at ?t ?l) (contains ?p ?t))
        :effect (and (not (contains ?p ?t)) (obj_at ?p ?l))
    )
    
    (:action airplane_load
        :parameters (?p - packages ?a - airplanes ?l - places)
        :precondition (and (obj_at ?a ?l) (obj_at ?p ?l))
        :effect (and (not (obj_at ?p ?l)) (contains ?p ?a))
    )
    
    (:action airplane_unload
        :parameters (?p - packages ?a - airplanes ?l - places)
        :precondition (and (obj_at ?a ?l) (contains ?p ?a))
        :effect (and (not (contains ?p ?a)) (obj_at ?p ?l))
    )
    
    (:action move_truck
        :parameters (?t - trucks ?source - places ?dest - places ?c - cities)
        :precondition (and (obj_at ?t ?source) (location_in_city ?source ?c) (location_in_city ?dest ?c))
        :effect (and (not (obj_at ?t ?source)) (obj_at ?t ?dest))
    )
    
    (:action move_airplane
        :parameters (?a - airplanes ?source - airports ?dest - airports)
        :precondition (and (obj_at ?a ?source))
        :effect (and (not (obj_at ?a ?source)) (obj_at ?a ?dest))
    )
    
)