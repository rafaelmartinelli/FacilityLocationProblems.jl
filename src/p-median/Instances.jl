@enum PMedianInstances begin
    pmedcap01
    pmedcap02
    pmedcap03
    pmedcap04
    pmedcap05
    pmedcap06
    pmedcap07
    pmedcap08
    pmedcap09
    pmedcap10
    pmedcap11
    pmedcap12
    pmedcap13
    pmedcap14
    pmedcap15
    pmedcap16
    pmedcap17
    pmedcap18
    pmedcap19
    pmedcap20
end

for inst in instances(PMedianInstances)
    @eval export $(Symbol(inst))
end

function getPMedianInstances()
    return [ Symbol(inst) for inst in instances(PMedianInstances) ]
end
