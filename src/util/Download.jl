function downloadFile(url::String, file_name::String)
    abs_file_name = joinpath(data_path, file_name)
    try
        Downloads.download(url, abs_file_name)
    catch
        @error("Unable to download file $file_name from the Internet.")
        return false
    end
    return true
end

function readInstance(instance::String)::Union{Vector{SubString{String}}, Nothing}
    name = string(instance)
    file_name = name * ".txt"
    abs_file_name = joinpath(data_path, file_name)

    if !isfile(abs_file_name)
        if !downloadFile(orlib_url * file_name, file_name)
            return nothing
        end
    end

    return split(read(abs_file_name, String))
end
