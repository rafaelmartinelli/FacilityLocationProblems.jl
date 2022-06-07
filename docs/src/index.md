```@meta
CurrentModule = FacilityLocationProblems
```

# FacilityLocationProblems

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

```@index
```

```@autodocs
Modules = [FacilityLocationProblems]
```
