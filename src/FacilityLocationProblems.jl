module FacilityLocationProblems

export loadFacilityLocationProblem, FacilityLocationProblem, getFacilityLocationInstances
export loadPMedianProblem, PMedianProblem, getPMedianInstances
export loadMaximumCoveringProblem, MaximumCoveringProblem, getMaximumCoveringInstances
export nf, nc

const data_path = joinpath(pkgdir(FacilityLocationProblems), "data")

const orlib_url = "http://people.brunel.ac.uk/~mastjjb/jeb/orlib/files/"

using Distances
using Downloads
using ZipFile
using Printf

include("util/Download.jl")
include("util/Bounds.jl")

include("facility-location/Instances.jl")
include("facility-location/Data.jl")
include("facility-location/Loader.jl")

include("maximum-covering/Instances.jl")
include("maximum-covering/Data.jl")
include("maximum-covering/Loader.jl")

include("p-median/Instances.jl")
include("p-median/Data.jl")
include("p-median/Loader.jl")

end
