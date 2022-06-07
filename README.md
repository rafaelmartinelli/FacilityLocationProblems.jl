# FacilityLocationProblems.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelmartinelli.github.io/FacilityLocationProblems.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://rafaelmartinelli.github.io/FacilityLocationProblems.jl/dev)
[![Build Status](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/FacilityLocationProblems.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/FacilityLocationProblems.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

This package reads data files in `cflp` format for Capacitated Facility Location Problem (CFLP) instances.

## Usage

The type used by the package is `FacilityLocationProblem`, defined as follows:

```julia
struct FacilityLocationProblem
    name::String                 # Instance name

    capacities::Vector{Int64}    # Facilities capacities
    demands::Vector{Int64}       # Customers demands
    fixed_costs::Vector{Float64} # Fixed costs to open facilities
    costs::Matrix{Float64}       # Costs to assign facilities to customers

    lb::Float64                  # Lower bound (-Inf if not known)
    ub::Float64                  # Upper bound ( Inf if not known)
end
```

Some classical CFLP instances from the literature are preloaded. For example, to load CFLP instance `cap41`:

```julia
data = loadFacilityLocationProblem(:cap41)
```

See the [full list](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/tree/main/data).

Optionally, it is possible to set the facilities' capacity (mandatory for instances `capa`, `capb`, and `capc`):

```julia
data = loadFacilityLocationProblem(:capa, 8000)
```

This package also loads custom CFLP instances (following [ORLib format](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html)):

```julia
data = loadFacilityLocationProblem("/path/to/your/CFLP/instance.txt", optional_facilities_capacity)
```

## Installation

FacilityLocationProblems is a registered Julia Package (yay!).
You can install FacilityLocationProblems through the Julia package manager.
Open Julia's interactive session (REPL) and type:

```julia
] add FacilityLocationProblems
```

## Related links

- [ORLib's CFLP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html)
- [Sobolev Institute of Mathematics' CFLP Page](http://www.math.nsc.ru/AP/benchmarks/CFLP/cflp_tabl-eng.html) (this package does not read those instances)

## Other packages

- [KnapsackLib.jl](https://github.com/rafaelmartinelli/Knapsacks.jl): Knapsack algorithms in Julia
- [GAPLib.jl](https://github.com/rafaelmartinelli/GAPLib.jl): Generalized Assignment Problem Lib
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib
