struct MaximumCoverageProblem
    name::String

    medians::Int64
    distance::Int64

    demands::Vector{Int64}
    coverage::Vector{Vector{Int64}}

    x::Vector{Int64}
    y::Vector{Int64}

    lb::Float64
    ub::Float64
end

nc(data::MaximumCoverageProblem)::Int64 = length(data.demands)

function Base.show(io::IO, data::MaximumCoverageProblem)
    @printf(io, "Max Cover Data %s", data.name)
    @printf(io, " (p = %d,", data.medians)
    @printf(io, " dist = %d,", data.distance)
    @printf(io, " %d customers)", nc(data))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
