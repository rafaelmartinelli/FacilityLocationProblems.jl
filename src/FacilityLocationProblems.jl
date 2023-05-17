module FacilityLocationProblems

export loadFacilityLocationProblem, FacilityLocationProblem, getFacilityLocationInstances
export loadPMedianProblem, PMedianProblem, getPMedianInstances
export loadMaximumCoverageProblem, MaximumCoverageProblem, getMaximumCoverageInstances
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

include("p-median/Instances.jl")
include("p-median/Data.jl")
include("p-median/Loader.jl")

include("maximum-coverage/Instances.jl")
include("maximum-coverage/Data.jl")
include("maximum-coverage/Loader.jl")

end
