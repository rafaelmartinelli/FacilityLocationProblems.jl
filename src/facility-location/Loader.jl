function loadFacilityLocationProblem(instance::Symbol, capacity::Int64 = 0)::Union{FacilityLocationProblem, Nothing}
    name = string(instance)
    values = readInstance(name)
    if values === nothing return nothing end
    name = name * (capacity == 0 ? "" : "_$capacity")
    return doLoadFacilityLocationProblem(values, name, capacity)
end

function loadFacilityLocationProblem(file_name::String, capacity::Int64 = 0)::Union{FacilityLocationProblem, Nothing}
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    values = split(read(file_name, String))
    name = splitext(basename(file_name))[1] * (capacity == 0 ? "" : "_$capacity")
    return doLoadFacilityLocationProblem(values, name, capacity)
end

function doLoadFacilityLocationProblem(values::Vector{SubString{String}}, name::String, capacity::Int64)::Union{FacilityLocationProblem, Nothing}
    n_facilities = parse(Int64, values[1])
    n_customers = parse(Int64, values[2])

    counter = 3

    capacities = Int64[]
    if capacity == 0
        capacities = tryparse.(Int64, values[counter:2:counter + 2 * n_facilities - 1])
        if capacities[1] === nothing
            @error("Instance $name does not have capacities. Please load with loadFacilityLocationProblem(instance, capacity).")
            return nothing
        end
    else
        capacities = fill(capacity, n_facilities)
    end
    fixed_costs = parse.(Float64, values[counter + 1:2:counter + 2 * n_facilities - 1])

    counter += 2 * n_facilities

    demands = Int64[]
    costs = Matrix{Float64}(undef, n_facilities, n_customers)
    for j in 1:n_customers
        push!(demands, parse(Int64, values[counter]))
        costs[:, j] = parse.(Float64, values[counter + 1:counter + n_facilities])
        counter += n_facilities + 1
    end

    return FacilityLocationProblem(name, capacities, demands, fixed_costs, costs, loadBounds(name, capacity)...)
end
