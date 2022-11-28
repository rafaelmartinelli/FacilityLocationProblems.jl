@enum PMedianInstances begin
    pmedcap01
end

for inst in instances(PMedianInstances)
    @eval export $(Symbol(inst))
end

function getPMedianInstances()
    return [ Symbol(inst) for inst in instances(PMedianInstances) ]
end
