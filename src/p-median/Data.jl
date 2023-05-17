struct PMedianProblem
    name::String

    medians::Int64
    capacity::Int64

    demands::Vector{Int64}
    costs::Matrix{Float64}

    x::Vector{Int64}
    y::Vector{Int64}

    lb::Float64
    ub::Float64
end

nc(data::PMedianProblem)::Int64 = length(data.demands)

function Base.show(io::IO, data::PMedianProblem)
    @printf(io, "P-Median Data %s", data.name)
    @printf(io, " (p = %d,", data.medians)
    @printf(io, " %d customers)", nc(data))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
