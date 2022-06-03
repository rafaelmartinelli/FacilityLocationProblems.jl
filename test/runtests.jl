using CFLPLib
using Test

@testset "LoadSymbol" begin
    data = loadFacilityLocationProblem(:cap41)
    @test data.name == "cap41"
    @test data.capacities[3] == 5000
    @test data.fixed_costs[5] == 7500.0
    @test data.demands[7] == 2370
    @test nf(data) == 16
    @test nc(data) == 50
    @test data.lb == 1040444.375
    @test data.ub == 1040444.375
    @test_nowarn println(data)
end

@testset "ErrorSymbol" begin
    data = loadFacilityLocationProblem(:notaninstance)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadFacilityLocationProblem(joinpath(pkgdir(CFLPLib), "test/data/cap41.txt"))
    @test data.name == "cap41"
    @test data.capacities[3] == 5000
    @test data.fixed_costs[5] == 7500.0
    @test data.demands[7] == 2370
    @test nf(data) == 16
    @test nc(data) == 50
    @test data.lb == 1040444.375
    @test data.ub == 1040444.375
    @test_nowarn println(data)
end

@testset "ErrorString" begin
    data = loadFacilityLocationProblem("notaninstance")
    @test data === nothing
end

@testset "DifferentCapacity" begin
    data = loadFacilityLocationProblem(:cap41, 1000)
    @test data.name == "cap41-1000"
    @test data.capacities[3] == 1000
    @test data.capacities[5] == 1000
    @test data.lb == -Inf
    @test data.ub == Inf
    @test_nowarn println(data)
end

@testset "LargeInstances" begin
    data = loadFacilityLocationProblem(:capa, 8000)
    @test data.name == "capa-8000"
    @test data.capacities[3] == 8000
    @test data.fixed_costs[5] == 2164343.000
    @test data.demands[7] == 14
    @test nf(data) == 100
    @test nc(data) == 1000
    @test data.lb == 19240822.449
    @test data.ub == 19240822.449
    @test_nowarn println(data)
end

@testset "NoCapacity" begin
    @test_throws ErrorException data = loadFacilityLocationProblem(:capa)
end
