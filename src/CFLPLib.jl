module CFLPLib

export loadFacilityLocationProblem, FacilityLocationProblem
export nf, nc

const data_path = joinpath(pkgdir(CFLPLib), "data")

using ZipFile
using Printf

include("Data.jl")
include("Util.jl")
include("Loader.jl")

end
