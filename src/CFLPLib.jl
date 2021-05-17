module CFLPLib

export CFLPData, CFLPFacility, CFLPCustomer, loadCFLP

const data_path = joinpath(pkgdir(CFLPLib), "data")

using ZipFile

include("Data.jl")
include("Loader.jl")

end
