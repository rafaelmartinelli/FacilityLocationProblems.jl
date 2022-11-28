struct MaximumCoveringProblem
    name::String

    medians::Int64
    distance::Int64

    demands::Vector{Int64}
    coverage::Vector{Vector{Int64}}

    lb::Float64
    ub::Float64
end

nc(data::MaximumCoveringProblem)::Int64 = length(data.demands)

function Base.show(io::IO, data::MaximumCoveringProblem)
    @printf(io, "Max Cover Data %s", data.name)
    @printf(io, " (p = %d,", data.medians)
    @printf(io, " dist = %d,", data.distance)
    @printf(io, " %d customers)", nc(data))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
