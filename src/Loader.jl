function loadCFLP(instance::Symbol)
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    file = ZipFile.Reader(file_name)
    values = parse.(Float64, split(read(file.files[1], String)))

    return load(values, name)
end

function loadCFLP(file_name::String)
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = parse.(Float64, split(read(file_name, String)))

    return load(values, name)
end

function load(values::Array{Float64}, name::String)
    n_facilities = convert(Int64, values[1])
    n_customers = convert(Int64, values[2])

    counter = 3

    capacities = convert.(Int64, values[counter:2:counter + 2 * n_facilities - 1])
    fixed_costs = values[counter + 1:2:counter + 2 * n_facilities - 1]

    counter += 2 * n_facilities

    customers = CFLPCustomer[]
    for j in 1:n_customers
        push!(customers, CFLPCustomer(j, convert(Int64, values[counter]), values[counter + 1:counter + n_facilities]))
        counter += n_facilities + 1
    end

    facilities = [ CFLPFacility(i, capacities[i], fixed_costs[i], [ c.costs[i] for c in customers ]) for i in 1:n_facilities ]

    return CFLPData(name, facilities, customers, -Inf, Inf)
end
