function loadFacilityLocationProblem(instance::Symbol, capacity::Int64 = 0)::Union{FacilityLocationProblem, Nothing}
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1] * (capacity == 0 ? "" : "-$capacity")
    file = ZipFile.Reader(file_name)
    values = split(read(file.files[1], String))
    close(file)

    return loadFacilityLocationProblem(values, name, capacity)
end

function loadFacilityLocationProblem(file_name::String, capacity::Int64 = 0)::Union{FacilityLocationProblem, Nothing}
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1] * (capacity == 0 ? "" : "-$capacity")
    values = split(read(file_name, String))

    return loadFacilityLocationProblem(values, name, capacity)
end

function loadFacilityLocationProblem(values::Array{SubString{String}}, name::String, capacity::Int64 = 0)::Union{FacilityLocationProblem, Nothing}
    n_facilities = parse(Int64, values[1])
    n_customers = parse(Int64, values[2])

    counter = 3

    capacities = Int64[]
    if capacity == 0
        capacities = tryparse.(Int64, values[counter:2:counter + 2 * n_facilities - 1])
        if capacities[1] === nothing
            error("Instance $name does not have capacities. Please load with loadFacilityLocationProblem(instance, capacity).")
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

    return FacilityLocationProblem(name, capacities, demands, fixed_costs, costs, loadBounds(name)...)
end

function loadPMedianProblem(instance::Symbol)::Union{PMedianProblem, Nothing}
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    file = ZipFile.Reader(file_name)
    values = split(read(file.files[1], String))
    close(file)

    return loadPMedianProblem(values, name)
end

function loadPMedianProblem(file_name::String)::Union{PMedianProblem, Nothing}
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = split(read(file_name, String))

    return loadPMedianProblem(values, name)
end

function loadPMedianProblem(values::Array{SubString{String}}, name::String)::Union{PMedianProblem, Nothing}
    number = parse(Int64, values[1])
    ub = parse(Int64, values[2])
    n = parse(Int64, values[3])
    medians = parse(Int64, values[4])
    capacity = parse(Int64, values[5])

    counter = 6

    x = parse.(Int64, values[counter + 1:4:end])
    y = parse.(Int64, values[counter + 2:4:end])
    demands = parse.(Int64, values[counter + 3:4:end])

    costs = [ floor(Int64, euclidean([x[i], y[i]], [x[j], y[j]])) for i in 1:n, j in 1:n ]

    return PMedianProblem(name, medians, capacity, demands, costs, 0, ub)
end
