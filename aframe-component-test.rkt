#lang vr-lang

#;(
(register-component "random-color"
                    init:
                    (var (randomHue (Math.floor (* (Math.random) 360))))
                    (this.el.setAttribute "color" (+ "hsl(" randomHue ",100%,50%)")))

(register-component "random-position"
                    schema:
                    (object [min (object
                                  [default
                                    (object
                                     [x -10]
                                     [y 1]
                                     [z -10])]
                                  [type "vec3"])]
                            [max (object
                                  [default
                                    (object
                                     [x 10]
                                     [y 1]
                                     [z 10])]
                                  [type "vec3"])])
                    init:
                    (var
                     (data this.data)
                     (max  data.max)
                     (min  data.min)
                     (rx   (Math.random))
                     (ry   (Math.random))
                     (rz   (Math.random))
                     (xdiff (- max.x min.x))
                     (ydiff (- max.y min.y))
                     (zdiff (- max.z min.z))
                     (xnew (+ (* rx xdiff) min.x))
                     (ynew (+ (* ry ydiff) min.y))
                     (znew (+ (* rz zdiff) min.z)))
                    (this.el.setAttribute "position"
                                          (object [x xnew]
                                                  [y ynew]
                                                  [z znew])))
)