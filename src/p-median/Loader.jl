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
    ub = parse(Int64, values[2])
    n = parse(Int64, values[3])
    medians = parse(Int64, values[4])
    capacity = parse(Int64, values[5])

    counter = 6

    x = parse.(Int64, values[counter + 1:4:end])
    y = parse.(Int64, values[counter + 2:4:end])
    demands = parse.(Int64, values[counter + 3:4:end])

    costs = [ floor(Int64, euclidean([x[i], y[i]], [x[j], y[j]])) for i in 1:n, j in 1:n ]

    return PMedianProblem(name, medians, capacity, demands, costs, -Inf64, ub)
end
