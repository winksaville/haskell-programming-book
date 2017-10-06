-- exercises-3.4

-- 3) No d is not defined at the top level so r = d / 2 causes an error
--area d = pi * (r * r)
--r = d / 2

-- 4) Yes
area d = pi * (r * r)
    where r = d / 2

area' d =
    let r = d / 2
    in pi * (r * r)
