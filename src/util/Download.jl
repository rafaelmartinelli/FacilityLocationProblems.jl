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
