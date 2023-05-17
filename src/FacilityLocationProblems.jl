module FacilityLocationProblems

export loadFacilityLocationProblem, FacilityLocationProblem
export loadPMedianProblem, PMedianProblem
export loadMaximumCoverageProblem, MaximumCoverageProblem
export nf, nc

const data_path = joinpath(pkgdir(FacilityLocationProblems), "data")

using Distances
using ZipFile
using Printf

include("facility-location/Data.jl")
include("facility-location/Loader.jl")

include("maximum-coverage/Data.jl")
include("maximum-coverage/Loader.jl")

include("p-median/Data.jl")
include("p-median/Loader.jl")

include("Util.jl")

end
