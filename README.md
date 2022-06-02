# CFLPLib.jl

[![Build Status](https://github.com/rafaelmartinelli/CFLPLib.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/CFLPLib.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/CFLPLib.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/CFLPLib.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

CFLPLib reads data files in `cflp` format for Capacitated Facility Location Problem (CFLP) instances.

## Usage

The main type used by the package is `CFLPData`, defined as follows:

```julia
struct CFLPData
    name       ::String               # Instance name
    facilities ::Vector{CFLPFacility} # Vector of Facilities
    customers  ::Vector{CFLPCustomer} # Vector of Customers

    lb         ::Float64              # Lower bound (-Inf if not known)
    ub         ::Float64              # Upper bound ( Inf if not known)
end
```

Type `CFLPFacility` is defined as follows:

```julia
struct CFLPFacility
    id         ::Int64           # Sequential facility ID
    capacity   ::Int64           # Facility capacity
    fixed_cost ::Float64         # Fixed cost to open facility
    costs      ::Vector{Float64} # List of customers costs for this facility
end
```

Type `CFLPCustomer` is defined as follows:

```julia
struct CFLPCustomer
    id         ::Int64           # Sequential customer ID
    demand     ::Int64           # Customer demand
    costs      ::Vector{Float64} # List of facilities costs for this customer
end
```
So, `costs` are duplicated in both types.

Some classical CFLP instances from the literature are preloaded. For example, to load CFLP instance `cap41`:

```julia
data = loadCFLP(:cap41)
```

See the [full list](https://github.com/rafaelmartinelli/CFLPLib.jl/tree/main/data).

Optionally, it is possible to set the facilities' capacity (mandatory for instances `capa`, `capb`, and `capc`):

```julia
data = loadCFLP(:capa, 8000)
```

CFLPLib also loads custom CFLP instances (following [ORLib format](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html)):

```julia
data = loadCFLP("/path/to/your/CFLP/instance.txt", optional_facilities_capacity)
```

## Installation

CFLPLib is *not* a registered Julia Package.
You can install CFLPLib through the Julia package manager.
Open Julia's interactive session (REPL) and type:

```julia
] add https://github.com/rafaelmartinelli/CFLPLib.jl
```

## Related links

- [ORLib's CFLP page](http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html)
- [Sobolev Institute of Mathematics' CFLP Page](http://www.math.nsc.ru/AP/benchmarks/CFLP/cflp_tabl-eng.html) (this package does not read those instances)

## Other packages

- [KnapsackLib.jl](https://github.com/rafaelmartinelli/KnapsackLib.jl): Knapsack algorithms in Julia
- [GAPLib.jl](https://github.com/rafaelmartinelli/GAPLib.jl): Generalized Assignment Problem Lib
- [BPPLib.jl](https://github.com/rafaelmartinelli/BPPLib.jl): Bin Packing and Cutting Stock Lib
- [CARPData.jl](https://github.com/rafaelmartinelli/CARPData.jl): Capacitated Arc Routing Problem Lib
