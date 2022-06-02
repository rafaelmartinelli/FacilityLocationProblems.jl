struct CFLPFacility
    id::Int64
    capacity::Int64
    fixed_cost::Float64
    costs::Vector{Float64}
end

function Base.show(io::IO, facility::CFLPFacility)
    @printf(io, "F(%d)", facility.id)
end

struct CFLPCustomer
    id::Int64
    demand::Int64
    costs::Vector{Float64}
end

function Base.show(io::IO, customer::CFLPCustomer)
    @printf(io, "C(%d)", customer.id)
end

struct CFLPData
    name::String
    facilities::Vector{CFLPFacility}
    customers::Vector{CFLPCustomer}

    lb::Float64
    ub::Float64
end

function Base.show(io::IO, data::CFLPData)
    @printf(io, "CFLP Data %s", data.name)
    @printf(io, " (%d facilities,", length(data.facilities))
    @printf(io, " %d customers)", length(data.customers))
    @printf(io, " [%.3f, %.3f]", data.lb, data.ub)
end
