function loadMaximumCoverageProblem(instance::Symbol, distance::Int64)::Union{MaximumCoverageProblem, Nothing}
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    file = ZipFile.Reader(file_name)
    values = split(read(file.files[1], String))
    close(file)

    return doLoadMaximumCoverageProblem(values, distance, name)
end

function loadMaximumCoverageProblem(file_name::String, distance::Int64)::Union{MaximumCoverageProblem, Nothing}
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end
    
    name = splitext(basename(file_name))[1]
    values = split(read(file_name, String))

    return doLoadMaximumCoverageProblem(values, distance, name)
end

function doLoadMaximumCoverageProblem(values::Array{SubString{String}}, distance::Int64, name::String)::Union{MaximumCoverageProblem, Nothing}
    n = parse(Int64, values[3])
    medians = parse(Int64, values[4])

    counter = 6

    x = parse.(Int64, values[counter + 1:4:end])
    y = parse.(Int64, values[counter + 2:4:end])
    demands = parse.(Int64, values[counter + 3:4:end])

    costs = [ floor(Int64, euclidean([x[i], y[i]], [x[j], y[j]])) for i in 1:n, j in 1:n ]
    coverage = [ [ j for j in 1:n if costs[i, j] <= distance ] for i in 1:n ]

    return MaximumCoverageProblem(name, medians, distance, demands, coverage, x, y, -Inf64, Inf64)
end
