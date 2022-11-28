
function loadBounds(name::String, capacity::Int64 = 0)
    file_name = joinpath(data_path, "bounds.txt")
    values = split(read(file_name, String))

    index = findfirst(isequal(name), values)
    # if index === nothing
    #     index = findfirst(isequal(name * "_" * string(capacity)), values)
    # end

    if index !== nothing
        return parse(Float64, values[index + 1]), parse(Float64, values[index + 2])
    else
        return -Inf64, Inf64
    end
end
