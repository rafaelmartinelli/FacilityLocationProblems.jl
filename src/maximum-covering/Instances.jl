@enum MaximumCoveringInstances begin
    nada
end

for inst in instances(MaximumCoveringInstances)
    @eval export $(Symbol(inst))
end

function getMaximumCoveringInstances()
    return [ Symbol(inst) for inst in instances(MaximumCoveringInstances) ]
end
