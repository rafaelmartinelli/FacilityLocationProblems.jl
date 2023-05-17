# FacilityLocationProblems.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelmartinelli.github.io/FacilityLocationProblems.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://rafaelmartinelli.github.io/FacilityLocationProblems.jl/dev)
[![Build Status](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/FacilityLocationProblems.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/FacilityLocationProblems.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

This package reads data files for different location problems instances:

- (Capacitated) Facility Location Problems
- ~~(~~Capacitated~~)~~ P-Median Problems
- Maximum Coverage Problems

## Usage

### Capacitated Facility Location Problems

The type used by (Capacitated) Facility Location Problems is `FacilityLocationProblem`, defined as follows:

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

Some classical instances from the literature can be downloaded on demand from [ORLib page](http://people.brunel.ac.uk/~mastjjb/jeb/info.html). For example, to download and load instance `cap41`:

```julia
data = loadFacilityLocationProblem(:cap41)
```

See the full list on [ORLib UFLP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/uncapinfo.html), [ORLib CFLP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html) or call the function `getFacilityLocationInstances`.

Optionally, it is possible to set the facilities' capacity (mandatory for instances `capa`, `capb`, and `capc`):

```julia
data = loadFacilityLocationProblem(:capa, 8000)
```

### ~~(~~Capacitated~~)~~ P-Median Problems

The type used by ~~(~~Capacitated~~)~~ P-Median Problems is `PMedianProblem`, defined as follows:

```julia
struct PMedianProblem
    name::String           # Instance name

    medians::Int64         # Number of medians (p)
    capacity::Int64        # Medians capacities

    demands::Vector{Int64} # Customers demands
    costs::Matrix{Float64} # Costs matrix (distances)

    x::Vector{Int64}       # Customers x coordinates
    y::Vector{Int64}       # Customers y coordinates

    lb::Float64            # Lower bound (-Inf if not known)
    ub::Float64            # Upper bound ( Inf if not known)
end
```

Some classical (Capacitated) P-Median instances from the literature are preloaded. For example, to load instance `pmedcap01`:

```julia
data = loadPMedianProblem(:pmedcap01)
```

See the [full list](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/tree/main/data) or call the function `getPMedianInstances`.

### Maximum Coverage Problems

The type used by Maximum Coverage Problems is `MaximumCoverageProblem`, defined as follows:

```julia
struct MaximumCoverageProblem
    name::String                    # Instance name

    medians::Int64                  # Number of medians (p)
    distance::Int64                 # Coverage distance

    demands::Vector{Int64}          # Customers demands
    coverage::Vector{Vector{Int64}} # Coverage sets

    x::Vector{Int64}                # Customers x coordinates
    y::Vector{Int64}                # Customers y coordinates

    lb::Float64                     # Lower bound (-Inf if not known)
    ub::Float64                     # Upper bound ( Inf if not known)
end
```

The package loads Capacitated P-Median instances as Maximum Coverage Problems, and the user must input the maximum coverage distance. For example, to load instance `pmedcap01` with maximum coverage distance of 10:

```julia
data = loadMaximumCoverageProblem(:pmedcap01, 10)
```

The medians capacities are ignored, and the coverage sets are built using calculated costs and given coverage distance.

### Other Features

This package also loads custom instances (following [ORLib format](http://people.brunel.ac.uk/~mastjjb/jeb/info.html)):

```julia
data = loadTypeOfProblem("/path/to/your/instance.txt", optional_arguments)
```

## Installation

FacilityLocationProblems is a registered Julia Package (yay!).
You can install FacilityLocationProblems through the Julia package manager.
Open Julia's interactive session (REPL) and type:

```julia
] add FacilityLocationProblems
```

## Related links

- [ORLib's Uncapacitated Facility Location page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/uncapinfo.html)
- [ORLib's Capacitated Facility Location page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html)
- [ORLib's Uncapacitated P-Median page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/pmedinfo.html) (this package does not read those instances)
- [ORLib's Capacitated P-Median page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/pmedcapinfo.html)
- [Sobolev Institute of Mathematics' CFLP Page](http://www.math.nsc.ru/AP/benchmarks/CFLP/cflp_tabl-eng.html) (this package does not read those instances)
- [Instituto Nacional de Pesquisas Espaciais' P-Median and Max Cover Page](http://www.lac.inpe.br/~lorena/instancias.html) (this package does not read those instances)

## Other packages

- [KnapsackLib.jl](https://github.com/rafaelmartinelli/Knapsacks.jl): Knapsack algorithms in Julia
- [LotSizingProblems.jl](https://github.com/rafaelmartinelli/LotSizingProblems.jl): Lot Sizing Problems Lib
- [AssignmentProblems.jl](https://github.com/rafaelmartinelli/AssignmentProblems.jl): Assignment Problems Lib
- [InventoryRoutingProblems.jl](https://github.com/rafaelmartinelli/InventoryRoutingProblems.jl): Inventory Routing Problems Lib
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Problems Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib
- [MDVSP.jl](https://github.com/rafaelmartinelli/MDVSP.jl): Multiple-Depot Vehicle Scheduling Problem Lib
- [CVRPLIB.jl](https://github.com/chkwon/CVRPLIB.jl): Capacitated Vehicle Routing Problem Lib
- [TSPLIB.jl](https://github.com/matago/TSPLIB.jl): Traveling Salesman Problem Lib
