struct CFLPFacility
    id::Int64
    capacity::Int64
    fixed_cost::Float64
    costs::Vector{Float64}
end

function Base.show(io::IO, facility::CFLPFacility)
    print(io, "F($(facility.id))")
end

struct CFLPCustomer
    id::Int64
    demand::Int64
    costs::Vector{Float64}
end

function Base.show(io::IO, customer::CFLPCustomer)
    print(io, "C($(customer.id))")
end

struct CFLPData
    name::String
    facilities::Vector{CFLPFacility}
    customers::Vector{CFLPCustomer}

    lb::Float64
    ub::Float64
end

function Base.show(io::IO, data::CFLPData)
    print(io, "CFLP Data $(data.name)")
    print(io, " ($(length(data.facilities)) facilities,")
    print(io, " $(length(data.customers)) customers)")
    print(io, " [$(data.lb), $(data.ub)]")
end
