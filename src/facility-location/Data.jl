struct FacilityLocationProblem
    name::String

    capacities::Vector{Int64}
    demands::Vector{Int64}
    fixed_costs::Vector{Float64}
    costs::Matrix{Float64}

    lb::Float64
    ub::Float64
end

nf(data::FacilityLocationProblem)::Int64 = length(data.capacities)
nc(data::FacilityLocationProblem)::Int64 = length(data.demands)

function Base.show(io::IO, data::FacilityLocationProblem)
    @printf(io, "CFLP Data %s", data.name)
    @printf(io, " (nf = %d,", nf(data))
    @printf(io, " nc = %d)", nc(data))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
